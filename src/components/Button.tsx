import React from 'react';
import styled, { css } from 'styled-components';
import { motion } from 'framer-motion';

interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'success' | 'danger' | 'outline';
  size?: 'sm' | 'md' | 'lg';
  fullWidth?: boolean;
  disabled?: boolean;
  icon?: React.ReactNode;
  children: React.ReactNode;
  onClick?: () => void;
  className?: string;
}

const ButtonBase = styled(motion.button)<ButtonProps>`
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: ${({ theme }) => theme.spacing.sm};
  font-family: ${({ theme }) => theme.fonts.primary};
  font-weight: 700;
  border-radius: ${({ theme }) => theme.borderRadius.full};
  transition: all ${({ theme }) => theme.transitions.normal};
  cursor: pointer;
  border: none;
  position: relative;
  overflow: hidden;
  
  ${({ size, theme }) => {
    switch (size) {
      case 'sm':
        return css`
          padding: ${theme.spacing.sm} ${theme.spacing.lg};
          font-size: ${theme.fontSizes.sm};
        `;
      case 'lg':
        return css`
          padding: ${theme.spacing.lg} ${theme.spacing['2xl']};
          font-size: ${theme.fontSizes.xl};
        `;
      default:
        return css`
          padding: ${theme.spacing.md} ${theme.spacing.xl};
          font-size: ${theme.fontSizes.base};
        `;
    }
  }}
  
  ${({ variant, theme }) => {
    switch (variant) {
      case 'secondary':
        return css`
          background: ${theme.colors.secondary};
          color: ${theme.colors.textInverse};
          box-shadow: ${theme.shadows.md};
          
          &:hover:not(:disabled) {
            background: ${theme.colors.datesBrown};
            transform: translateY(-2px);
            box-shadow: ${theme.shadows.lg};
          }
        `;
      case 'success':
        return css`
          background: ${theme.colors.success};
          color: ${theme.colors.textInverse};
          box-shadow: ${theme.shadows.md};
          
          &:hover:not(:disabled) {
            background: #4DA54E;
            transform: translateY(-2px);
            box-shadow: ${theme.shadows.lg};
          }
        `;
      case 'danger':
        return css`
          background: ${theme.colors.danger};
          color: ${theme.colors.textInverse};
          box-shadow: ${theme.shadows.md};
          
          &:hover:not(:disabled) {
            background: #D43B2B;
            transform: translateY(-2px);
            box-shadow: ${theme.shadows.lg};
          }
        `;
      case 'outline':
        return css`
          background: transparent;
          color: ${theme.colors.primary};
          border: 2px solid ${theme.colors.primary};
          
          &:hover:not(:disabled) {
            background: ${theme.colors.primary};
            color: ${theme.colors.textInverse};
            transform: translateY(-2px);
          }
        `;
      default:
        return css`
          background: linear-gradient(135deg, ${theme.colors.primary} 0%, ${theme.colors.primaryDark} 100%);
          color: ${theme.colors.textInverse};
          box-shadow: ${theme.shadows.md};
          
          &:hover:not(:disabled) {
            transform: translateY(-2px);
            box-shadow: ${theme.shadows.lg};
          }
          
          &:active:not(:disabled) {
            transform: translateY(0);
          }
        `;
    }
  }}
  
  ${({ fullWidth }) =>
    fullWidth &&
    css`
      width: 100%;
    `}
  
  &:disabled {
    opacity: 0.5;
    cursor: not-allowed;
  }
  
  &::before {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    transform: translate(-50%, -50%);
    transition: width 0.6s, height 0.6s;
  }
  
  &:active:not(:disabled)::before {
    width: 300px;
    height: 300px;
  }
`;

export const Button: React.FC<ButtonProps> = ({
  children,
  icon,
  variant = 'primary',
  size = 'md',
  ...props
}) => {
  return (
    <ButtonBase
      variant={variant}
      size={size}
      whileTap={{ scale: 0.95 }}
      {...props}
    >
      {icon && <span>{icon}</span>}
      {children}
    </ButtonBase>
  );
};
