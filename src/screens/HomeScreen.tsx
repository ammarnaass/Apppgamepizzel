import React from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { DateCharacter } from '@/assets/icons/DateCharacter';
import { PalmTree } from '@/assets/icons/PalmTree';
import { Button } from '@/components/Button';
import { Card } from '@/components/Card';
import { ProgressBar } from '@/components/ProgressBar';

const HomeContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  background: linear-gradient(180deg, 
    ${({ theme }) => theme.colors.desertSky} 0%,
    ${({ theme }) => theme.colors.sandLight} 40%,
    ${({ theme }) => theme.colors.oasisGreen} 100%
  );
  position: relative;
  overflow: hidden;
`;

const CloudDecoration = styled(motion.div)`
  position: absolute;
  top: 10%;
  background: rgba(255, 255, 255, 0.6);
  border-radius: 100px;
  
  &::before,
  &::after {
    content: '';
    position: absolute;
    background: rgba(255, 255, 255, 0.6);
    border-radius: 100px;
  }
`;

const Header = styled.div`
  padding: ${({ theme }) => theme.spacing.xl};
  text-align: center;
`;

const Title = styled.h1`
  font-size: ${({ theme }) => theme.fontSizes['3xl']};
  font-weight: 900;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.lg};
  text-shadow: 2px 2px 4px rgba(255, 255, 255, 0.5);
`;

const StatsCard = styled(Card)`
  margin: 0 ${({ theme }) => theme.spacing.lg};
  margin-bottom: ${({ theme }) => theme.spacing.lg};
`;

const StatsRow = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.lg};
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const StatItem = styled.div`
  flex: 1;
  text-align: center;
`;

const StatValue = styled.div`
  font-size: ${({ theme }) => theme.fontSizes['2xl']};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.primary};
  margin-bottom: ${({ theme }) => theme.spacing.xs};
`;

const StatLabel = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.sm};
  color: ${({ theme }) => theme.colors.textSecondary};
  font-weight: 600;
`;

const SceneContainer = styled.div`
  position: relative;
  height: 250px;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  margin: ${({ theme }) => theme.spacing.xl} 0;
`;

const PalmTreeWrapper = styled(motion.div)`
  position: absolute;
  bottom: 20px;
`;

const CharacterWrapper = styled(motion.div)`
  position: relative;
  z-index: 2;
  margin-bottom: 20px;
`;

const MenuGrid = styled.div`
  padding: ${({ theme }) => theme.spacing.lg};
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: ${({ theme }) => theme.spacing.md};
`;

const MenuItem = styled(Card)`
  padding: ${({ theme }) => theme.spacing.lg};
  text-align: center;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: ${({ theme }) => theme.spacing.md};
  min-height: 140px;
  justify-content: center;
  background: ${({ theme }) => theme.colors.surface};
`;

const MenuIcon = styled.div`
  font-size: ${({ theme }) => theme.fontSizes['3xl']};
  width: 60px;
  height: 60px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: ${({ theme }) => theme.borderRadius.md};
  background: linear-gradient(135deg, 
    ${({ theme }) => theme.colors.datesBeige} 0%,
    ${({ theme }) => theme.colors.sandLight} 100%
  );
`;

const MenuLabel = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.base};
  font-weight: 700;
  color: ${({ theme }) => theme.colors.text};
`;

export const HomeScreen: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();

  const userLevel = 5;
  const userXP = 1250;
  const userCoins = 480;
  const xpProgress = 65;

  const menuItems = [
    { id: 'levels', icon: '🎮', label: t('home.levels'), route: '/levels' },
    { id: 'encyclopedia', icon: '📚', label: t('home.encyclopedia'), route: '/encyclopedia' },
    { id: 'profile', icon: '👤', label: t('home.profile'), route: '/profile' },
    { id: 'settings', icon: '⚙️', label: t('home.settings'), route: '/settings' },
  ];

  return (
    <HomeContainer>
      <CloudDecoration
        style={{ left: '10%', width: 100, height: 40 }}
        animate={{ x: [0, 20, 0] }}
        transition={{ duration: 8, repeat: Infinity }}
      >
        <div style={{ width: 60, height: 60, left: 20, top: -20, position: 'absolute' }} />
        <div style={{ width: 80, height: 80, right: 0, top: -30, position: 'absolute' }} />
      </CloudDecoration>
      
      <CloudDecoration
        style={{ right: '5%', width: 120, height: 50 }}
        animate={{ x: [0, -30, 0] }}
        transition={{ duration: 10, repeat: Infinity }}
      >
        <div style={{ width: 70, height: 70, left: 30, top: -25, position: 'absolute' }} />
        <div style={{ width: 90, height: 90, right: 10, top: -35, position: 'absolute' }} />
      </CloudDecoration>

      <Header>
        <Title>{t('home.title')}</Title>
        
        <StatsCard>
          <StatsRow>
            <StatItem>
              <StatValue>{userLevel}</StatValue>
              <StatLabel>{t('profile.level')}</StatLabel>
            </StatItem>
            <StatItem>
              <StatValue>{userXP}</StatValue>
              <StatLabel>{t('profile.xp')}</StatLabel>
            </StatItem>
            <StatItem>
              <StatValue>{userCoins}</StatValue>
              <StatLabel>{t('profile.coins')}</StatLabel>
            </StatItem>
          </StatsRow>
          <ProgressBar progress={xpProgress} showLabel />
        </StatsCard>
      </Header>

      <SceneContainer>
        <PalmTreeWrapper
          style={{ left: '15%' }}
          animate={{ rotate: [-2, 2, -2] }}
          transition={{ duration: 4, repeat: Infinity }}
        >
          <PalmTree size={120} />
        </PalmTreeWrapper>
        
        <CharacterWrapper
          animate={{ y: [0, -10, 0] }}
          transition={{ duration: 2, repeat: Infinity, ease: 'easeInOut' }}
        >
          <DateCharacter size={150} isWaving />
        </CharacterWrapper>
        
        <PalmTreeWrapper
          style={{ right: '15%' }}
          animate={{ rotate: [2, -2, 2] }}
          transition={{ duration: 3.5, repeat: Infinity }}
        >
          <PalmTree size={140} />
        </PalmTreeWrapper>
      </SceneContainer>

      <MenuGrid>
        {menuItems.map((item, index) => (
          <MenuItem
            key={item.id}
            clickable
            onClick={() => navigate(item.route)}
            as={motion.div}
            initial={{ opacity: 0, scale: 0.8 }}
            animate={{ opacity: 1, scale: 1 }}
            transition={{ delay: index * 0.1 }}
          >
            <MenuIcon>{item.icon}</MenuIcon>
            <MenuLabel>{item.label}</MenuLabel>
          </MenuItem>
        ))}
      </MenuGrid>

      <div style={{ padding: '20px' }}>
        <Button
          size="lg"
          fullWidth
          onClick={() => navigate('/levels')}
        >
          {t('home.startGame')}
        </Button>
      </div>
    </HomeContainer>
  );
};
