"""Decode-duration helpers without requiring a real ASR model."""

import numpy as np
import pytest

import main


class _FakeFrame:
    def __init__(self, n):
        self._n = n

    def to_ndarray(self):
        return np.zeros(self._n, dtype=np.float32)


class _FakeResampler:
    def __init__(self, sizes):
        self.sizes = list(sizes)
        self.flushed = False

    def resample(self, frame):
        if frame is None:
            self.flushed = True
            return []
        if not self.sizes:
            return []
        return [_FakeFrame(self.sizes.pop(0))]


def test_append_frames_enforces_sample_cap():
    resampler = _FakeResampler([main.MAX_TRANSCRIBE_SAMPLES // 2, main.MAX_TRANSCRIBE_SAMPLES])
    chunks = []
    count = 0
    count = main._append_resampled_frames(resampler, object(), chunks, count)
    with pytest.raises(main.AudioTooLongError):
        main._append_resampled_frames(resampler, object(), chunks, count)
