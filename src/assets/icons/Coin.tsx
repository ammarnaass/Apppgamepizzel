import React from 'react';

interface CoinProps {
  size?: number;
  className?: string;
}

export const Coin: React.FC<CoinProps> = ({ size = 24, className }) => {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <defs>
        <linearGradient id="coinGradient" x1="0%" y1="0%" x2="100%" y2="100%">
          <stop offset="0%" style={{ stopColor: '#FFD700', stopOpacity: 1 }} />
          <stop offset="50%" style={{ stopColor: '#FFA500', stopOpacity: 1 }} />
          <stop offset="100%" style={{ stopColor: '#FF8C00', stopOpacity: 1 }} />
        </linearGradient>
      </defs>
      <circle cx="12" cy="12" r="10" fill="url(#coinGradient)" />
      <circle cx="12" cy="12" r="8" fill="#FFD700" opacity="0.5" />
      <circle cx="12" cy="12" r="6" fill="#FFA500" opacity="0.3" />
      <text
        x="12"
        y="16"
        fontSize="12"
        fontWeight="bold"
        fill="#8B4513"
        textAnchor="middle"
      >
        $
      </text>
    </svg>
  );
};
