import React from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { PalmTree } from '@/assets/icons/PalmTree';
import { ProgressBar } from '@/components/ProgressBar';

const LevelsContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  background: linear-gradient(180deg, 
    ${({ theme }) => theme.colors.desertSky} 0%,
    ${({ theme }) => theme.colors.sandLight} 100%
  );
`;

const Header = styled.div`
  padding: ${({ theme }) => theme.spacing.xl};
  background: ${({ theme }) => theme.colors.surface};
  box-shadow: ${({ theme }) => theme.shadows.md};
`;

const BackButton = styled.button`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  padding: ${({ theme }) => theme.spacing.sm};
  color: ${({ theme }) => theme.colors.text};
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const Title = styled.h1`
  font-size: ${({ theme }) => theme.fontSizes['2xl']};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const ProgressSection = styled.div`
  margin-top: ${({ theme }) => theme.spacing.md};
`;

const ProgressLabel = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.sm};
  color: ${({ theme }) => theme.colors.textSecondary};
  margin-bottom: ${({ theme }) => theme.spacing.sm};
  font-weight: 600;
`;

const LevelsGrid = styled.div`
  padding: ${({ theme }) => theme.spacing.xl};
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: ${({ theme }) => theme.spacing.lg};
  max-width: 600px;
  margin: 0 auto;
`;

const LevelCard = styled(motion.div)<{ locked: boolean; completed: boolean }>`
  aspect-ratio: 1;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  border-radius: ${({ theme }) => theme.borderRadius.lg};
  background: ${({ locked, completed, theme }) =>
    locked
      ? theme.colors.border
      : completed
      ? `linear-gradient(135deg, ${theme.colors.success} 0%, ${theme.colors.palmGreen} 100%)`
      : `linear-gradient(135deg, ${theme.colors.primary} 0%, ${theme.colors.accent} 100%)`};
  box-shadow: ${({ theme }) => theme.shadows.md};
  cursor: ${({ locked }) => (locked ? 'not-allowed' : 'pointer')};
  position: relative;
  overflow: hidden;
  opacity: ${({ locked }) => (locked ? 0.5 : 1)};
  
  &::before {
    content: '';
    position: absolute;
    top: -50%;
    left: -50%;
    width: 200%;
    height: 200%;
    background: radial-gradient(circle, rgba(255,255,255,0.2) 0%, transparent 70%);
    opacity: 0;
    transition: opacity 0.3s;
  }
  
  &:hover:not(:disabled)::before {
    opacity: ${({ locked }) => (locked ? 0 : 1)};
  }
`;

const LevelIcon = styled.div`
  font-size: ${({ theme }) => theme.fontSizes['2xl']};
  margin-bottom: ${({ theme }) => theme.spacing.sm};
`;

const LevelNumber = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xl};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.textInverse};
  text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
`;

const LevelLabel = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xs};
  color: ${({ theme }) => theme.colors.textInverse};
  font-weight: 600;
  margin-top: ${({ theme }) => theme.spacing.xs};
`;

const StarsContainer = styled.div`
  display: flex;
  gap: 2px;
  margin-top: ${({ theme }) => theme.spacing.xs};
`;

const levels = [
  { id: 1, type: 'matching', completed: true, stars: 3, unlocked: true },
  { id: 2, type: 'memory', completed: true, stars: 2, unlocked: true },
  { id: 3, type: 'guess', completed: true, stars: 3, unlocked: true },
  { id: 4, type: 'arrange', completed: false, stars: 0, unlocked: true },
  { id: 5, type: 'matching', completed: false, stars: 0, unlocked: true },
  { id: 6, type: 'memory', completed: false, stars: 0, unlocked: false },
  { id: 7, type: 'guess', completed: false, stars: 0, unlocked: false },
  { id: 8, type: 'arrange', completed: false, stars: 0, unlocked: false },
  { id: 9, type: 'matching', completed: false, stars: 0, unlocked: false },
  { id: 10, type: 'memory', completed: false, stars: 0, unlocked: false },
  { id: 11, type: 'guess', completed: false, stars: 0, unlocked: false },
  { id: 12, type: 'arrange', completed: false, stars: 0, unlocked: false },
];

export const LevelsScreen: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();

  const completedLevels = levels.filter(l => l.completed).length;
  const progress = (completedLevels / levels.length) * 100;

  const handleLevelClick = (level: typeof levels[0]) => {
    if (level.unlocked) {
      navigate(`/game/${level.type}/${level.id}`);
    }
  };

  const getLevelIcon = (type: string) => {
    switch (type) {
      case 'matching': return '🎯';
      case 'memory': return '🧠';
      case 'guess': return '❓';
      case 'arrange': return '📋';
      default: return '🎮';
    }
  };

  return (
    <LevelsContainer>
      <Header>
        <BackButton onClick={() => navigate('/home')}>
          ← {t('common.back')}
        </BackButton>
        <Title>{t('levels.title')}</Title>
        <ProgressSection>
          <ProgressLabel>
            {t('levels.progress')}: {completedLevels}/{levels.length}
          </ProgressLabel>
          <ProgressBar progress={progress} showLabel />
        </ProgressSection>
      </Header>

      <LevelsGrid>
        {levels.map((level, index) => (
          <LevelCard
            key={level.id}
            locked={!level.unlocked}
            completed={level.completed}
            onClick={() => handleLevelClick(level)}
            initial={{ opacity: 0, scale: 0.5 }}
            animate={{ opacity: level.unlocked ? 1 : 0.5, scale: 1 }}
            transition={{ delay: index * 0.05 }}
            whileHover={level.unlocked ? { scale: 1.05 } : {}}
            whileTap={level.unlocked ? { scale: 0.95 } : {}}
          >
            <LevelIcon>{level.unlocked ? getLevelIcon(level.type) : '🔒'}</LevelIcon>
            <LevelNumber>{level.id}</LevelNumber>
            <LevelLabel>{t(`levels.categories.${level.type}`)}</LevelLabel>
            {level.completed && (
              <StarsContainer>
                {[...Array(3)].map((_, i) => (
                  <span key={i} style={{ fontSize: '16px' }}>
                    {i < level.stars ? '⭐' : '☆'}
                  </span>
                ))}
              </StarsContainer>
            )}
          </LevelCard>
        ))}
      </LevelsGrid>
    </LevelsContainer>
  );
};
