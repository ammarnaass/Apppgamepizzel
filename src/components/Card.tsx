import React from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';

interface CardProps {
  children: React.ReactNode;
  elevated?: boolean;
  clickable?: boolean;
  onClick?: () => void;
  className?: string;
}

const CardBase = styled(motion.div)<CardProps>`
  background: ${({ theme }) => theme.colors.surface};
  border-radius: ${({ theme }) => theme.borderRadius.lg};
  padding: ${({ theme }) => theme.spacing.lg};
  box-shadow: ${({ elevated, theme }) =>
    elevated ? theme.shadows.lg : theme.shadows.md};
  transition: all ${({ theme }) => theme.transitions.normal};
  
  ${({ clickable }) =>
    clickable &&
    `
    cursor: pointer;
    
    &:hover {
      transform: translateY(-4px);
      box-shadow: 0 12px 24px rgba(139, 69, 19, 0.2);
    }
    
    &:active {
      transform: translateY(-2px);
    }
  `}
`;

export const Card: React.FC<CardProps> = ({ children, clickable, ...props }) => {
  return (
    <CardBase
      clickable={clickable}
      whileHover={clickable ? { scale: 1.02 } : undefined}
      whileTap={clickable ? { scale: 0.98 } : undefined}
      {...props}
    >
      {children}
    </CardBase>
  );
};
