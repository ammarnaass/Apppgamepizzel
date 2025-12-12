import React from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { DateCharacter } from '@/assets/icons/DateCharacter';

interface LoadingProps {
  message?: string;
}

const LoadingContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, 
    ${({ theme }) => theme.colors.background} 0%,
    ${({ theme }) => theme.colors.sandLight} 100%
  );
  padding: ${({ theme }) => theme.spacing.xl};
`;

const LoadingCharacter = styled(motion.div)`
  margin-bottom: ${({ theme }) => theme.spacing.xl};
`;

const LoadingText = styled(motion.p)`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  font-weight: 600;
  color: ${({ theme }) => theme.colors.textSecondary};
  text-align: center;
`;

const DotsContainer = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.sm};
  margin-top: ${({ theme }) => theme.spacing.md};
`;

const Dot = styled(motion.div)`
  width: 12px;
  height: 12px;
  border-radius: 50%;
  background: ${({ theme }) => theme.colors.primary};
`;

export const Loading: React.FC<LoadingProps> = ({ message = 'جاري التحميل...' }) => {
  return (
    <LoadingContainer>
      <LoadingCharacter
        animate={{ 
          y: [0, -20, 0],
          rotate: [0, 5, -5, 0]
        }}
        transition={{ 
          duration: 2,
          repeat: Infinity,
          ease: 'easeInOut'
        }}
      >
        <DateCharacter size={120} />
      </LoadingCharacter>
      
      <LoadingText
        animate={{ opacity: [0.5, 1, 0.5] }}
        transition={{ duration: 1.5, repeat: Infinity }}
      >
        {message}
      </LoadingText>
      
      <DotsContainer>
        {[0, 1, 2].map((index) => (
          <Dot
            key={index}
            animate={{ 
              scale: [1, 1.5, 1],
              opacity: [0.5, 1, 0.5]
            }}
            transition={{ 
              duration: 1,
              repeat: Infinity,
              delay: index * 0.2
            }}
          />
        ))}
      </DotsContainer>
    </LoadingContainer>
  );
};
