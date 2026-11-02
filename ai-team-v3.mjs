import { spawnSync } from 'node:child_process';
import {
  existsSync, readFileSync, writeFileSync, mkdirSync,
  mkdtempSync, symlinkSync
} from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { createHash } from 'node:crypto';

const root = process.cwd();
const action = process.argv[2];
const approved = process.argv.includes('--approve-local-edits');
const task = process.argv.slice(3)
  .filter(x => x !== '--approve-local-edits')
  .join(' ').trim();

const hash = s => createHash('sha256')
  .update(s).digest('hex').slice(0, 12);

const id = hash(root + ':' + task);
const base = join(tmpdir(), 'tewahedo-ai-team-v2');
const planPath = join(base, id + '.json');
const statePath = join(base, id + '-implementation.json');

const clip = (value, n = 4000) =>
  String(value ?? '').slice(0, n);

function fail(message) {
  console.error('\nBLOCKED: ' + message);
  process.exit(1);
}

function readJson(path) {
  return JSON.parse(readFileSync(path, 'utf8'));
}

function save(state) {
  mkdirSync(base, { recursive: true });
  writeFileSync(statePath, JSON.stringify(state, null, 2));
}

function run(name, cmd, args, cwd = root, timeout = 240000) {
  console.log('\nRunning ' + name + '...');

  const r = spawnSync(cmd, args, {
    cwd, encoding: 'utf8', windowsHide: true,
    timeout, maxBuffer: 8 * 1024 * 1024,
    env: process.env
  });

  const output = (r.stdout || '').trim();
  const error = (r.stderr || '').trim();

  if (r.error || r.status !== 0) {
    fail(name + ': ' + clip(
      error || output || r.error?.message, 1800
    ));
  }

  console.log(name + ' completed.');
  return output;
}

function git(args, cwd = root) {
  return run('Git', 'git', args, cwd);
}

function loadPlan() {
  if (!existsSync(planPath)) {
    fail('Saved V2 plan not found. Use the exact original task.');
  }
  return readJson(planPath);
}

function loadImplementation() {
  if (!existsSync(statePath)) {
    fail('No implementation found. Run --implement first.');
  }
  return readJson(statePath);
}

function getChanges(wt) {
  const tracked = git(['diff', '--name-only'], wt)
    .split(/\r?\n/).filter(Boolean);

  const added = git([
    'ls-files', '--others', '--exclude-standard'
  ], wt).split(/\r?\n/).filter(Boolean);

  return [...new Set([...tracked, ...added])];
}

function validateScope(files) {
  if (!files.length) fail('Codex produced no source changes.');

  const unsafe = files.filter(file =>
    !/^(src\/|scripts\/)/.test(file.replaceAll('\\', '/'))
  );

  if (unsafe.length) {
    fail('Changes outside source/test scope: ' + unsafe.join(', '));
  }
}

function test(wt) {
  const results = [];

  function check(name, cmd, args) {
    console.log('\nTesting: ' + name);

    const r = spawnSync(cmd, args, {
      cwd: wt, encoding: 'utf8',
      windowsHide: true, timeout: 180000,
      maxBuffer: 8 * 1024 * 1024
    });

    const result = {
      name,
      status: r.status === 0 ? 'PASS' : 'FAIL',
      output: clip(
        r.stderr || r.stdout || r.error?.message, 1800
      )
    };

    results.push(result);
    console.log(name + ': ' + result.status);
  }

  check('Git whitespace', 'git', ['diff', '--check']);

  if (
    existsSync(join(wt, 'scripts', 'test-locale-unify.mjs'))
  ) {
    check('Locale tests', 'node', [
      'scripts/test-locale-unify.mjs'
    ]);
  }

  if (existsSync(join(wt, 'node_modules'))) {
    check('Production build', 'cmd.exe', [
      '/d', '/s', '/c', 'npm.cmd run build'
    ]);
  } else {
    results.push({
      name: 'Production build',
      status: 'NOT RUN',
      output: 'Dependencies unavailable in isolated worktree'
    });
  }

  return results;
}

function implement() {
  if (!approved) {
    fail('Add --approve-local-edits to authorize isolated coding.');
  }

  const plan = loadPlan();

  if (existsSync(statePath)) {
    console.log('Implementation already recorded.');
    console.log('Use --review to resume.');
    return;
  }

  const current = git(['status', '--porcelain=v1']);
  console.log(
    'Original workspace:',
    current ? 'contains existing changes; preserving them' : 'clean'
  );

  const wt = mkdtempSync(join(tmpdir(), 'tewahedo-code-'));

  // mkdtemp creates a directory; git worktree requires
  // an available path, so use a child directory.
  const workspace = join(wt, 'workspace');

  git(['worktree', 'add', '--detach', workspace, 'HEAD']);

  // Reuse installed dependencies without reinstalling packages.
  const deps = join(root, 'node_modules');
  if (existsSync(deps) &&
      !existsSync(join(workspace, 'node_modules'))) {
    try {
      symlinkSync(
        deps, join(workspace, 'node_modules'), 'junction'
      );
    } catch {
      console.log('Dependency junction unavailable.');
    }
  }

  const requirements = `
Task: ${clip(task, 800)}

Claude plan:
${clip(plan.plan, 2400)}

Codex feasibility:
${clip(plan.feasibility, 1400)}

Copilot planning feedback:
${clip(plan.approval, 900)}

Additional requirements:
- Preserve untranslated religious names and Ge'ez terms.
- Preserve existing Ethiopian/Gregorian numeral conventions.
- Check real DOM overflow and component boundaries.
- Prefer existing locale helpers and shared UI labels.
- Keep untranslated content visible as fallback.
- Do not invent sacred text translations.

You are Codex, implementing this approved task.
Use LOW reasoning.
Change only directly relevant src/ and scripts/ files.
Do not modify dependencies, configuration or production.
Do not stage, commit, push, merge or deploy.
Do not touch secrets or Supabase data.
Do not edit unrelated code.
Keep the implementation focused and concise.
`;

  const output = run('Codex implementation', 'codex', [
    'exec', '-C', workspace,
    '--sandbox', 'workspace-write',
    '-c', 'model_reasoning_effort="low"',
    requirements
  ], workspace, 600000);

  const files = getChanges(workspace);
  validateScope(files);

  const checks = test(workspace);
  const diff = git([
    'diff', '--', 'src', 'scripts'
  ], workspace);

  const state = {
    task,
    workspace,
    files,
    implementation: clip(output, 2500),
    checks,
    diff: clip(diff, 14000),
    qa: null,
    approval: null
  };

  save(state);

  console.log('\nImplementation saved.');
  console.log('Changed files: ' + files.join(', '));
  console.log('Workspace: ' + workspace);
  console.log('Run --review next.');
}

function review() {
  const state = loadImplementation();

  if (!existsSync(state.workspace)) {
    fail('Isolated workspace no longer exists.');
  }

  if (!state.qa) {
    state.qa = run('Gemini Flash QA', 'agy', [
      '--print',
      `You are a READ-ONLY QA reviewer.
Do not use tools, edit files or run commands.
Review the implementation using only the supplied data.
Report concrete issues, or PASS.

Task:
${clip(state.task, 700)}

Changed files:
${state.files.join(', ')}

Automated checks:
${clip(JSON.stringify(state.checks), 2600)}

Diff:
${clip(state.diff, 8500)}

Return PASS, REVISE or BLOCK with at most
three specific findings. Under 160 words.`,
      '--model', 'gemini-3.8-flash-low',
      '--effort', 'low',
      '--mode', 'plan'
    ], base);

    if (!state.qa.trim()) fail('Gemini returned empty QA.');
    save(state);
  } else {
    console.log('Reusing saved Gemini QA.');
  }

  if (!state.approval) {
    state.approval = run('Copilot approval', 'copilot', [
      '-p',
      `You are the final internal approval reviewer.
Use only the supplied report. No tools or file changes.

Task: ${clip(state.task, 500)}
Files: ${state.files.join(', ')}
Tests: ${clip(JSON.stringify(state.checks), 1600)}
QA: ${clip(state.qa, 1800)}

Return APPROVE, REVISE or BLOCK and one reason.
A missing production build cannot be treated as PASS.
Keep under 60 words.`,
      '--model', 'auto',
      '--allow-all-tools',
      '--deny-tool=shell',
      '--deny-tool=write',
      '--silent'
    ], base);

    if (!state.approval.trim()) fail('Copilot returned empty approval.');
    save(state);
  } else {
    console.log('Reusing saved Copilot approval.');
  }

  console.log('\n=== AI TEAM REPORT ===');
  console.log('Workspace: ' + state.workspace);
  console.log('Files: ' + state.files.join(', '));

  for (const c of state.checks) {
    console.log(c.name + ': ' + c.status);
  }

  console.log('\nGemini: ' + clip(state.qa, 1000));
  console.log('\nCopilot: ' + state.approval);

  console.log('\nNo commits or pushes were requested.');
  console.log('Review the isolated workspace before integrating.');
}

if (action === '--check') {
  for (const bin of ['claude', 'codex', 'agy', 'copilot']) {
    const r = spawnSync('where.exe', [bin], {
      encoding: 'utf8', windowsHide: true
    });
    console.log(bin + ': ' +
      (r.status === 0 ? 'READY' : 'MISSING'));
  }
} else if (action === '--implement' && task) {
  implement();
} else if (action === '--review' && task) {
  review();
} else {
  console.log(`
Usage:
 node ai-team-v3.mjs --check
 node ai-team-v3.mjs --implement "TASK" --approve-local-edits
 node ai-team-v3.mjs --review "TASK"

V3 reuses the saved V2 plan.
Implementation runs in a detached Git worktree.
No automatic commits, merges, pushes or deployments.
`);
}
