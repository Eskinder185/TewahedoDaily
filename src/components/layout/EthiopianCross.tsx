type EthiopianCrossProps = {
  className?: string
}

export function EthiopianCross({ className }: EthiopianCrossProps) {
  return (
    <svg
      className={className}
      viewBox="0 0 32 36"
      width="22"
      height="25"
      aria-hidden="true"
      focusable="false"
    >
      <g fill="none" stroke="currentColor" strokeWidth="1.35" strokeLinejoin="round">
        <path d="M16 3.2 L19.4 7.4 H22.8 L19.8 10.6 L21.6 14 H17.8 L16 17.2 L14.2 14 H10.4 L12.2 10.6 L9.2 7.4 H12.6 Z" />
        <path d="M16 17.2 V24.6" />
        <path d="M11.4 21.2 H20.6" />
        <path d="M12.2 24.6 H19.8 L18.4 28.4 H13.6 Z" />
        <path d="M13.2 28.4 H18.8 L17.4 32.2 H14.6 Z" />
      </g>
      <circle cx="16" cy="10.8" r="1.35" fill="currentColor" />
    </svg>
  )
}
