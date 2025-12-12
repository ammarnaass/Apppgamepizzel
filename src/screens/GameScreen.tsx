import React, { useState, useEffect } from 'react';
import styled from 'styled-components';
import { motion, AnimatePresence } from 'framer-motion';
import { useNavigate, useParams } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { DateCharacter } from '@/assets/icons/DateCharacter';
import { Button } from '@/components/Button';
import { Card } from '@/components/Card';

const GameContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  background: linear-gradient(180deg, 
    ${({ theme }) => theme.colors.desertSky} 0%,
    ${({ theme }) => theme.colors.sandLight} 100%
  );
  display: flex;
  flex-direction: column;
`;

const GameHeader = styled.div`
  padding: ${({ theme }) => theme.spacing.lg};
  background: ${({ theme }) => theme.colors.surface};
  box-shadow: ${({ theme }) => theme.shadows.md};
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

const HeaderLeft = styled.div`
  display: flex;
  align-items: center;
  gap: ${({ theme }) => theme.spacing.md};
`;

const BackButton = styled.button`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  padding: ${({ theme }) => theme.spacing.sm};
  color: ${({ theme }) => theme.colors.text};
`;

const GameTitle = styled.h2`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.datesBrown};
`;

const StatsRow = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.lg};
`;

const StatItem = styled.div`
  text-align: center;
`;

const StatValue = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.primary};
`;

const StatLabel = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xs};
  color: ${({ theme }) => theme.colors.textSecondary};
  font-weight: 600;
`;

const GameContent = styled.div`
  flex: 1;
  padding: ${({ theme }) => theme.spacing.xl};
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
`;

const Instruction = styled.p`
  text-align: center;
  font-size: ${({ theme }) => theme.fontSizes.lg};
  color: ${({ theme }) => theme.colors.textSecondary};
  font-weight: 600;
  margin-bottom: ${({ theme }) => theme.spacing.xl};
`;

const GameArea = styled.div`
  width: 100%;
  max-width: 500px;
`;

const OptionsList = styled.div`
  display: grid;
  grid-template-columns: 1fr;
  gap: ${({ theme }) => theme.spacing.md};
`;

const OptionCard = styled(Card)<{ selected?: boolean; correct?: boolean; wrong?: boolean }>`
  padding: ${({ theme }) => theme.spacing.lg};
  text-align: center;
  cursor: pointer;
  background: ${({ selected, correct, wrong, theme }) =>
    correct
      ? theme.colors.success
      : wrong
      ? theme.colors.danger
      : selected
      ? theme.colors.primary
      : theme.colors.surface};
  color: ${({ selected, correct, wrong, theme }) =>
    selected || correct || wrong ? theme.colors.textInverse : theme.colors.text};
  transition: all ${({ theme }) => theme.transitions.normal};
`;

const OptionText = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xl};
  font-weight: 700;
`;

const Modal = styled(motion.div)`
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
  text-align: center;
  max-width: 400px;
  width: 100%;
  box-shadow: ${({ theme }) => theme.shadows.xl};
`;

const ModalTitle = styled.h2`
  font-size: ${({ theme }) => theme.fontSizes['3xl']};
  font-weight: 900;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const ModalMessage = styled.p`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  color: ${({ theme }) => theme.colors.textSecondary};
  margin-bottom: ${({ theme }) => theme.spacing.xl};
`;

const StarsContainer = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.md};
  justify-content: center;
  margin: ${({ theme }) => theme.spacing.xl} 0;
  font-size: 60px;
`;

const ButtonRow = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.md};
  margin-top: ${({ theme }) => theme.spacing.xl};
`;

const QuestionImage = styled.div`
  width: 200px;
  height: 200px;
  margin: 0 auto ${({ theme }) => theme.spacing.xl};
  background: ${({ theme }) => theme.colors.datesBrown};
  border-radius: ${({ theme }) => theme.borderRadius.xl};
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 100px;
  box-shadow: ${({ theme }) => theme.shadows.lg};
`;

export const GameScreen: React.FC = () => {
  const navigate = useNavigate();
  const { type, levelId } = useParams();
  const { t } = useTranslation();
  
  const [score, setScore] = useState(0);
  const [time, setTime] = useState(0);
  const [selectedAnswer, setSelectedAnswer] = useState<number | null>(null);
  const [showResult, setShowResult] = useState(false);
  const [isCorrect, setIsCorrect] = useState(false);

  const question = {
    image: '🌴',
    question: 'ما نوع هذا التمر؟',
    options: ['تمر المجهول', 'تمر العجوة', 'تمر الصقعي', 'تمر البرحي'],
    correctAnswer: 0,
  };

  useEffect(() => {
    const timer = setInterval(() => {
      setTime(prev => prev + 1);
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  const handleAnswer = (index: number) => {
    if (selectedAnswer !== null) return;
    
    setSelectedAnswer(index);
    const correct = index === question.correctAnswer;
    setIsCorrect(correct);
    
    setTimeout(() => {
      setShowResult(true);
      if (correct) {
        setScore(prev => prev + 100);
      }
    }, 1000);
  };

  const handleNext = () => {
    navigate('/levels');
  };

  const handleRetry = () => {
    setSelectedAnswer(null);
    setShowResult(false);
    setScore(0);
    setTime(0);
  };

  const getStars = () => {
    if (time < 30 && isCorrect) return 3;
    if (time < 60 && isCorrect) return 2;
    if (isCorrect) return 1;
    return 0;
  };

  return (
    <GameContainer>
      <GameHeader>
        <HeaderLeft>
          <BackButton onClick={() => navigate('/levels')}>
            ←
          </BackButton>
          <GameTitle>{t(`game.${type}.title`)}</GameTitle>
        </HeaderLeft>
        <StatsRow>
          <StatItem>
            <StatValue>{score}</StatValue>
            <StatLabel>{t('game.score')}</StatLabel>
          </StatItem>
          <StatItem>
            <StatValue>{time}s</StatValue>
            <StatLabel>{t('game.time')}</StatLabel>
          </StatItem>
        </StatsRow>
      </GameHeader>

      <GameContent>
        <Instruction>{t(`game.${type}.instruction`)}</Instruction>
        
        <GameArea>
          <QuestionImage>
            {question.image}
          </QuestionImage>
          
          <OptionsList>
            {question.options.map((option, index) => (
              <OptionCard
                key={index}
                clickable={selectedAnswer === null}
                onClick={() => handleAnswer(index)}
                selected={selectedAnswer === index}
                correct={selectedAnswer === index && isCorrect}
                wrong={selectedAnswer === index && !isCorrect}
                as={motion.div}
                whileHover={selectedAnswer === null ? { scale: 1.02 } : {}}
                whileTap={selectedAnswer === null ? { scale: 0.98 } : {}}
              >
                <OptionText>{option}</OptionText>
              </OptionCard>
            ))}
          </OptionsList>
        </GameArea>
      </GameContent>

      <AnimatePresence>
        {showResult && (
          <Modal
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
          >
            <ModalContent
              initial={{ scale: 0.8, opacity: 0 }}
              animate={{ scale: 1, opacity: 1 }}
              exit={{ scale: 0.8, opacity: 0 }}
            >
              <motion.div
                initial={{ scale: 0 }}
                animate={{ scale: 1 }}
                transition={{ delay: 0.2, type: 'spring' }}
              >
                {isCorrect ? (
                  <DateCharacter size={120} />
                ) : (
                  <DateCharacter size={120} isSad />
                )}
              </motion.div>
              
              <ModalTitle>
                {isCorrect ? t('result.win.title') : t('result.lose.title')}
              </ModalTitle>
              <ModalMessage>
                {isCorrect ? t('result.win.message') : t('result.lose.message')}
              </ModalMessage>
              
              {isCorrect && (
                <StarsContainer>
                  {[...Array(3)].map((_, i) => (
                    <motion.span
                      key={i}
                      initial={{ scale: 0, rotate: -180 }}
                      animate={{ scale: 1, rotate: 0 }}
                      transition={{ delay: 0.3 + i * 0.1, type: 'spring' }}
                    >
                      {i < getStars() ? '⭐' : '☆'}
                    </motion.span>
                  ))}
                </StarsContainer>
              )}
              
              <ButtonRow>
                <Button variant="outline" onClick={handleRetry}>
                  {t('result.retry')}
                </Button>
                <Button onClick={handleNext}>
                  {t('result.next')}
                </Button>
              </ButtonRow>
            </ModalContent>
          </Modal>
        )}
      </AnimatePresence>
    </GameContainer>
  );
};
