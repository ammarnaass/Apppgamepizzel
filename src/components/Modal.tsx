import React from 'react';
import styled from 'styled-components';
import { motion, AnimatePresence } from 'framer-motion';

interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  children: React.ReactNode;
  className?: string;
}

const Overlay = styled(motion.div)`
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
  padding: ${({ theme }) => theme.spacing.xl};
`;

const ModalContent = styled(motion.div)`
  background: ${({ theme }) => theme.colors.surface};
  border-radius: ${({ theme }) => theme.borderRadius.xl};
  padding: ${({ theme }) => theme.spacing['2xl']};
  max-width: 500px;
  width: 100%;
  max-height: 90vh;
  overflow-y: auto;
  box-shadow: ${({ theme }) => theme.shadows.xl};
  position: relative;
`;

const CloseButton = styled.button`
  position: absolute;
  top: ${({ theme }) => theme.spacing.md};
  left: ${({ theme }) => theme.spacing.md};
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: ${({ theme }) => theme.colors.border};
  color: ${({ theme }) => theme.colors.text};
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: ${({ theme }) => theme.fontSizes.lg};
  transition: all ${({ theme }) => theme.transitions.normal};
  
  &:hover {
    background: ${({ theme }) => theme.colors.primary};
    color: ${({ theme }) => theme.colors.textInverse};
    transform: rotate(90deg);
  }
`;

export const Modal: React.FC<ModalProps> = ({ isOpen, onClose, children, className }) => {
  return (
    <AnimatePresence>
      {isOpen && (
        <Overlay
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          onClick={onClose}
        >
          <ModalContent
            className={className}
            initial={{ scale: 0.8, opacity: 0, y: 50 }}
            animate={{ scale: 1, opacity: 1, y: 0 }}
            exit={{ scale: 0.8, opacity: 0, y: 50 }}
            onClick={(e) => e.stopPropagation()}
          >
            <CloseButton onClick={onClose}>×</CloseButton>
            {children}
          </ModalContent>
        </Overlay>
      )}
    </AnimatePresence>
  );
};
