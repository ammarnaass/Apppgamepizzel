import React from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';

interface ProgressBarProps {
  progress: number;
  showLabel?: boolean;
  height?: number;
  color?: string;
  className?: string;
}

const ProgressContainer = styled.div<{ height: number }>`
  width: 100%;
  height: ${({ height }) => height}px;
  background: ${({ theme }) => theme.colors.borderLight};
  border-radius: ${({ theme }) => theme.borderRadius.full};
  overflow: hidden;
  position: relative;
  box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
`;

const ProgressFill = styled(motion.div)<{ color?: string }>`
  height: 100%;
  background: ${({ color, theme }) =>
    color ||
    `linear-gradient(90deg, ${theme.colors.primary} 0%, ${theme.colors.accent} 100%)`};
  border-radius: ${({ theme }) => theme.borderRadius.full};
  display: flex;
  align-items: center;
  justify-content: flex-end;
  padding: 0 ${({ theme }) => theme.spacing.sm};
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  position: relative;
  overflow: hidden;
  
  &::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(
      90deg,
      transparent,
      rgba(255, 255, 255, 0.3),
      transparent
    );
    animation: shimmer 2s infinite;
  }
  
  @keyframes shimmer {
    0% {
      transform: translateX(-100%);
    }
    100% {
      transform: translateX(100%);
    }
  }
`;

const Label = styled.span`
  font-size: ${({ theme }) => theme.fontSizes.xs};
  font-weight: 700;
  color: ${({ theme }) => theme.colors.textInverse};
  position: relative;
  z-index: 1;
  text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
`;

export const ProgressBar: React.FC<ProgressBarProps> = ({
  progress,
  showLabel = false,
  height = 24,
  color,
  className,
}) => {
  const clampedProgress = Math.min(Math.max(progress, 0), 100);

  return (
    <ProgressContainer height={height} className={className}>
      <ProgressFill
        color={color}
        initial={{ width: 0 }}
        animate={{ width: `${clampedProgress}%` }}
        transition={{ duration: 0.5, ease: 'easeOut' }}
      >
        {showLabel && <Label>{Math.round(clampedProgress)}%</Label>}
      </ProgressFill>
    </ProgressContainer>
  );
};
