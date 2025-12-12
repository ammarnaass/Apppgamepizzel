import React from 'react';

interface DateCharacterProps {
  size?: number;
  isWaving?: boolean;
  isSad?: boolean;
  className?: string;
}

export const DateCharacter: React.FC<DateCharacterProps> = ({ 
  size = 120, 
  isWaving = false,
  isSad = false,
  className 
}) => {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 120 120"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <defs>
        <linearGradient id="dateGradient" x1="0%" y1="0%" x2="0%" y2="100%">
          <stop offset="0%" style={{ stopColor: '#8B4513', stopOpacity: 1 }} />
          <stop offset="100%" style={{ stopColor: '#6B3410', stopOpacity: 1 }} />
        </linearGradient>
        <filter id="shadow">
          <feDropShadow dx="0" dy="2" stdDeviation="3" floodOpacity="0.3" />
        </filter>
      </defs>
      
      <g filter="url(#shadow)">
        <ellipse cx="60" cy="75" rx="32" ry="38" fill="url(#dateGradient)" />
        
        <ellipse cx="60" cy="30" rx="8" ry="12" fill="#4A7C59" />
        <path
          d="M 60 18 Q 52 10, 48 8 M 60 18 Q 68 10, 72 8 M 60 18 Q 58 8, 56 4 M 60 18 Q 62 8, 64 4"
          stroke="#5B8C6B"
          strokeWidth="2.5"
          fill="none"
          strokeLinecap="round"
        />
        
        {!isSad ? (
          <>
            <ellipse cx="48" cy="68" rx="4" ry="6" fill="#3E2723" />
            <ellipse cx="72" cy="68" rx="4" ry="6" fill="#3E2723" />
            <ellipse cx="47" cy="66" rx="1.5" ry="2" fill="#FFFFFF" />
            <ellipse cx="71" cy="66" rx="1.5" ry="2" fill="#FFFFFF" />
            
            <path
              d="M 48 82 Q 60 90, 72 82"
              stroke="#3E2723"
              strokeWidth="3"
              fill="none"
              strokeLinecap="round"
            />
            
            <path d="M 38 62 Q 32 58, 28 60" stroke="#D4A574" strokeWidth="2" strokeLinecap="round" />
            <path d="M 82 62 Q 88 58, 92 60" stroke="#D4A574" strokeWidth="2" strokeLinecap="round" />
          </>
        ) : (
          <>
            <ellipse cx="48" cy="68" rx="4" ry="5" fill="#3E2723" />
            <ellipse cx="72" cy="68" rx="4" ry="5" fill="#3E2723" />
            
            <path
              d="M 48 88 Q 60 82, 72 88"
              stroke="#3E2723"
              strokeWidth="3"
              fill="none"
              strokeLinecap="round"
            />
          </>
        )}
        
        {isWaving && (
          <g>
            <ellipse cx="24" cy="70" rx="8" ry="18" fill="url(#dateGradient)" transform="rotate(-20 24 70)" />
            <circle cx="20" cy="56" r="5" fill="#D4A574" />
            <animateTransform
              attributeName="transform"
              attributeType="XML"
              type="rotate"
              from="-20 24 70"
              to="20 24 70"
              dur="0.5s"
              repeatCount="indefinite"
            />
          </g>
        )}
      </g>
    </svg>
  );
};
