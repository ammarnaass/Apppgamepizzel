import React, { useEffect } from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { DateCharacter } from '@/assets/icons/DateCharacter';
import { Button } from '@/components/Button';

const SplashContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, 
    ${({ theme }) => theme.colors.desertSky} 0%,
    ${({ theme }) => theme.colors.sandLight} 50%,
    ${({ theme }) => theme.colors.datesBeige} 100%
  );
  padding: ${({ theme }) => theme.spacing.xl};
  position: relative;
  overflow: hidden;
  
  &::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    height: 40%;
    background: linear-gradient(180deg, transparent 0%, ${({ theme }) => theme.colors.oasisGreen} 100%);
    opacity: 0.3;
  }
`;

const Logo = styled(motion.div)`
  margin-bottom: ${({ theme }) => theme.spacing['2xl']};
  text-align: center;
  z-index: 1;
`;

const Title = styled(motion.h1)`
  font-size: ${({ theme }) => theme.fontSizes['4xl']};
  font-weight: 900;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.md};
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
`;

const Subtitle = styled(motion.p)`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  color: ${({ theme }) => theme.colors.secondary};
  font-weight: 600;
`;

const CharacterWrapper = styled(motion.div)`
  margin: ${({ theme }) => theme.spacing['2xl']} 0;
  z-index: 1;
`;

const ButtonWrapper = styled(motion.div)`
  z-index: 1;
`;

const Decoration = styled(motion.div)`
  position: absolute;
  border-radius: 50%;
  background: ${({ theme }) => theme.colors.accent};
  opacity: 0.1;
`;

export const SplashScreen: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();

  useEffect(() => {
    const hasSeenOnboarding = localStorage.getItem('hasSeenOnboarding');
    if (hasSeenOnboarding) {
      const timer = setTimeout(() => {
        navigate('/home');
      }, 2000);
      return () => clearTimeout(timer);
    }
  }, [navigate]);

  const handleStart = () => {
    const hasSeenOnboarding = localStorage.getItem('hasSeenOnboarding');
    if (hasSeenOnboarding) {
      navigate('/home');
    } else {
      navigate('/onboarding');
    }
  };

  return (
    <SplashContainer>
      <Decoration
        style={{ width: 200, height: 200, top: '10%', right: '10%' }}
        animate={{ scale: [1, 1.2, 1], rotate: [0, 180, 360] }}
        transition={{ duration: 8, repeat: Infinity, ease: 'linear' }}
      />
      <Decoration
        style={{ width: 150, height: 150, bottom: '20%', left: '5%' }}
        animate={{ scale: [1, 1.1, 1], rotate: [0, -180, -360] }}
        transition={{ duration: 10, repeat: Infinity, ease: 'linear' }}
      />
      
      <Logo
        initial={{ scale: 0, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        transition={{ duration: 0.5, ease: 'easeOut' }}
      >
        <Title
          animate={{ y: [0, -10, 0] }}
          transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut' }}
        >
          Date Quest
        </Title>
        <Subtitle
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.3, duration: 0.5 }}
        >
          لعبة أحجيات التمر
        </Subtitle>
      </Logo>

      <CharacterWrapper
        initial={{ scale: 0, rotate: -180 }}
        animate={{ scale: 1, rotate: 0 }}
        transition={{ delay: 0.5, duration: 0.6, type: 'spring' }}
      >
        <DateCharacter size={180} isWaving />
      </CharacterWrapper>

      <ButtonWrapper
        initial={{ opacity: 0, y: 50 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ delay: 1, duration: 0.5 }}
      >
        <Button size="lg" onClick={handleStart}>
          {t('splash.start')}
        </Button>
      </ButtonWrapper>
    </SplashContainer>
  );
};
