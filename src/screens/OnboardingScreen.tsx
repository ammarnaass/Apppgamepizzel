import React, { useState } from 'react';
import styled from 'styled-components';
import { motion, AnimatePresence } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { DateCharacter } from '@/assets/icons/DateCharacter';
import { PalmTree } from '@/assets/icons/PalmTree';
import { Button } from '@/components/Button';

const OnboardingContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  background: linear-gradient(135deg, 
    ${({ theme }) => theme.colors.background} 0%,
    ${({ theme }) => theme.colors.sandLight} 100%
  );
`;

const Header = styled.div`
  padding: ${({ theme }) => theme.spacing.lg};
  display: flex;
  justify-content: flex-end;
`;

const SkipButton = styled.button`
  background: transparent;
  color: ${({ theme }) => theme.colors.textSecondary};
  font-size: ${({ theme }) => theme.fontSizes.base};
  font-weight: 600;
  padding: ${({ theme }) => theme.spacing.sm} ${({ theme }) => theme.spacing.md};
`;

const SlideContainer = styled(motion.div)`
  flex: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  padding: ${({ theme }) => theme.spacing.xl};
  text-align: center;
`;

const IllustrationWrapper = styled.div`
  width: 100%;
  max-width: 300px;
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: ${({ theme }) => theme.spacing['2xl']};
`;

const SlideTitle = styled.h2`
  font-size: ${({ theme }) => theme.fontSizes['3xl']};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.md};
  line-height: 1.3;
`;

const SlideDescription = styled.p`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  color: ${({ theme }) => theme.colors.textSecondary};
  line-height: 1.6;
  max-width: 400px;
`;

const Footer = styled.div`
  padding: ${({ theme }) => theme.spacing.xl};
  display: flex;
  flex-direction: column;
  gap: ${({ theme }) => theme.spacing.lg};
`;

const DotsContainer = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.sm};
  justify-content: center;
`;

const Dot = styled.div<{ active: boolean }>`
  width: 10px;
  height: 10px;
  border-radius: 50%;
  background: ${({ active, theme }) =>
    active ? theme.colors.primary : theme.colors.border};
  transition: all ${({ theme }) => theme.transitions.normal};
  
  ${({ active }) =>
    active &&
    `
    width: 24px;
    border-radius: 5px;
  `}
`;

const ButtonRow = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.md};
`;

const slides = [
  {
    id: 1,
    illustration: 'welcome',
  },
  {
    id: 2,
    illustration: 'games',
  },
  {
    id: 3,
    illustration: 'guide',
  },
];

export const OnboardingScreen: React.FC = () => {
  const [currentSlide, setCurrentSlide] = useState(0);
  const navigate = useNavigate();
  const { t } = useTranslation();

  const handleNext = () => {
    if (currentSlide < slides.length - 1) {
      setCurrentSlide(currentSlide + 1);
    } else {
      handleFinish();
    }
  };

  const handleFinish = () => {
    localStorage.setItem('hasSeenOnboarding', 'true');
    navigate('/home');
  };

  const renderIllustration = (type: string) => {
    switch (type) {
      case 'welcome':
        return (
          <motion.div
            initial={{ scale: 0 }}
            animate={{ scale: 1, rotate: [0, 5, -5, 0] }}
            transition={{ duration: 0.8, rotate: { duration: 2, repeat: Infinity } }}
          >
            <DateCharacter size={160} isWaving />
          </motion.div>
        );
      case 'games':
        return (
          <motion.div
            style={{ display: 'flex', gap: '20px' }}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
          >
            <motion.div animate={{ y: [0, -10, 0] }} transition={{ duration: 1.5, repeat: Infinity }}>
              <DateCharacter size={80} />
            </motion.div>
            <motion.div animate={{ y: [0, 10, 0] }} transition={{ duration: 1.5, repeat: Infinity, delay: 0.3 }}>
              <DateCharacter size={80} />
            </motion.div>
            <motion.div animate={{ y: [0, -10, 0] }} transition={{ duration: 1.5, repeat: Infinity, delay: 0.6 }}>
              <DateCharacter size={80} />
            </motion.div>
          </motion.div>
        );
      case 'guide':
        return (
          <motion.div
            style={{ display: 'flex', gap: '20px', alignItems: 'flex-end' }}
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
          >
            <PalmTree size={100} />
            <motion.div
              animate={{ x: [0, 10, 0] }}
              transition={{ duration: 2, repeat: Infinity }}
            >
              <DateCharacter size={120} />
            </motion.div>
          </motion.div>
        );
      default:
        return null;
    }
  };

  return (
    <OnboardingContainer>
      <Header>
        <SkipButton onClick={handleFinish}>{t('onboarding.skip')}</SkipButton>
      </Header>

      <AnimatePresence mode="wait">
        <SlideContainer
          key={currentSlide}
          initial={{ opacity: 0, x: 100 }}
          animate={{ opacity: 1, x: 0 }}
          exit={{ opacity: 0, x: -100 }}
          transition={{ duration: 0.3 }}
        >
          <IllustrationWrapper>
            {renderIllustration(slides[currentSlide].illustration)}
          </IllustrationWrapper>

          <SlideTitle>
            {t(`onboarding.slide${currentSlide + 1}.title`)}
          </SlideTitle>
          <SlideDescription>
            {t(`onboarding.slide${currentSlide + 1}.description`)}
          </SlideDescription>
        </SlideContainer>
      </AnimatePresence>

      <Footer>
        <DotsContainer>
          {slides.map((_, index) => (
            <Dot key={index} active={index === currentSlide} />
          ))}
        </DotsContainer>

        <ButtonRow>
          {currentSlide > 0 && (
            <Button
              variant="outline"
              onClick={() => setCurrentSlide(currentSlide - 1)}
            >
              {t('common.back')}
            </Button>
          )}
          <Button
            fullWidth
            size="lg"
            onClick={handleNext}
          >
            {currentSlide === slides.length - 1
              ? t('onboarding.start')
              : t('onboarding.next')}
          </Button>
        </ButtonRow>
      </Footer>
    </OnboardingContainer>
  );
};
