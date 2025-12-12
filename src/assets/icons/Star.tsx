import React from 'react';

interface StarProps {
  size?: number;
  filled?: boolean;
  className?: string;
}

export const Star: React.FC<StarProps> = ({ size = 24, filled = false, className }) => {
  return (
    <svg
      width={size}
      height={size}
      viewBox="0 0 24 24"
      fill={filled ? '#F4D03F' : 'none'}
      xmlns="http://www.w3.org/2000/svg"
      className={className}
    >
      <path
        d="M12 2L15.09 8.26L22 9.27L17 14.14L18.18 21.02L12 17.77L5.82 21.02L7 14.14L2 9.27L8.91 8.26L12 2Z"
        fill={filled ? '#F4D03F' : 'none'}
        stroke={filled ? '#D4A020' : '#F4D03F'}
        strokeWidth="2"
        strokeLinecap="round"
        strokeLinejoin="round"
      />
    </svg>
  );
};
