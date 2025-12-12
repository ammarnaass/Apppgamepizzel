import React from 'react';

interface PalmTreeProps {
  size?: number;
  className?: string;
}

export const PalmTree: React.FC<PalmTreeProps> = ({ size = 100, className }) => {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 100 120"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <defs>
        <linearGradient id="trunkGradient" x1="0%" y1="0%" x2="100%" y2="0%">
          <stop offset="0%" style={{ stopColor: '#8B6F47', stopOpacity: 1 }} />
          <stop offset="50%" style={{ stopColor: '#A0826D', stopOpacity: 1 }} />
          <stop offset="100%" style={{ stopColor: '#8B6F47', stopOpacity: 1 }} />
        </linearGradient>
        <radialGradient id="leafGradient">
          <stop offset="0%" style={{ stopColor: '#5CB660', stopOpacity: 1 }} />
          <stop offset="100%" style={{ stopColor: '#3D8B40', stopOpacity: 1 }} />
        </radialGradient>
      </defs>
      
      <rect x="42" y="40" width="16" height="80" rx="8" fill="url(#trunkGradient)" />
      <ellipse cx="44" cy="55" rx="2" ry="6" fill="#6D5339" opacity="0.3" />
      <ellipse cx="56" cy="70" rx="2" ry="6" fill="#6D5339" opacity="0.3" />
      <ellipse cx="45" cy="90" rx="2" ry="6" fill="#6D5339" opacity="0.3" />
      
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(-45 50 40)" />
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(45 50 40)" />
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(0 50 40)" />
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(90 50 40)" />
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(-90 50 40)" />
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(135 50 40)" />
      <ellipse cx="50" cy="40" rx="38" ry="12" fill="url(#leafGradient)" transform="rotate(-135 50 40)" />
      
      <g opacity="0.6">
        <ellipse cx="42" cy="46" rx="4" ry="6" fill="#8B4513" />
        <ellipse cx="50" cy="44" rx="4" ry="6" fill="#8B4513" />
        <ellipse cx="58" cy="46" rx="4" ry="6" fill="#8B4513" />
        <ellipse cx="46" cy="50" rx="4" ry="6" fill="#8B4513" />
        <ellipse cx="54" cy="50" rx="4" ry="6" fill="#8B4513" />
      </g>
    </svg>
  );
};
