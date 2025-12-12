import React from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { DateCharacter } from '@/assets/icons/DateCharacter';
import { Card } from '@/components/Card';
import { ProgressBar } from '@/components/ProgressBar';

const ProfileContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  background: ${({ theme }) => theme.colors.background};
`;

const Header = styled.div`
  padding: ${({ theme }) => theme.spacing.xl};
  background: linear-gradient(135deg, 
    ${({ theme }) => theme.colors.primary} 0%,
    ${({ theme }) => theme.colors.primaryDark} 100%
  );
  color: ${({ theme }) => theme.colors.textInverse};
  position: relative;
`;

const BackButton = styled.button`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  padding: ${({ theme }) => theme.spacing.sm};
  color: ${({ theme }) => theme.colors.textInverse};
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const ProfileInfo = styled.div`
  text-align: center;
  margin-top: ${({ theme }) => theme.spacing.lg};
`;

const AvatarWrapper = styled.div`
  display: flex;
  justify-content: center;
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const PlayerName = styled.h2`
  font-size: ${({ theme }) => theme.fontSizes['2xl']};
  font-weight: 800;
  margin-bottom: ${({ theme }) => theme.spacing.sm};
`;

const PlayerRank = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.base};
  opacity: 0.9;
  font-weight: 600;
`;

const Content = styled.div`
  padding: ${({ theme }) => theme.spacing.lg};
  margin-top: -${({ theme }) => theme.spacing['2xl']};
`;

const StatsCard = styled(Card)`
  margin-bottom: ${({ theme }) => theme.spacing.lg};
`;

const StatsGrid = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: ${({ theme }) => theme.spacing.lg};
  text-align: center;
`;

const StatItem = styled.div`
  padding: ${({ theme }) => theme.spacing.md};
  border-radius: ${({ theme }) => theme.borderRadius.md};
  background: ${({ theme }) => theme.colors.backgroundSecondary};
`;

const StatValue = styled.div`
  font-size: ${({ theme }) => theme.fontSizes['2xl']};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.primary};
  margin-bottom: ${({ theme }) => theme.spacing.xs};
`;

const StatLabel = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xs};
  color: ${({ theme }) => theme.colors.textSecondary};
  font-weight: 600;
`;

const SectionTitle = styled.h3`
  font-size: ${({ theme }) => theme.fontSizes.lg};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const AchievementsList = styled.div`
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  gap: ${({ theme }) => theme.spacing.md};
`;

const AchievementCard = styled(Card)`
  padding: ${({ theme }) => theme.spacing.md};
  text-align: center;
  background: ${({ theme }) => theme.colors.surface};
`;

const AchievementIcon = styled.div`
  font-size: ${({ theme }) => theme.fontSizes['3xl']};
  margin-bottom: ${({ theme }) => theme.spacing.sm};
`;

const AchievementName = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.sm};
  font-weight: 700;
  color: ${({ theme }) => theme.colors.text};
  margin-bottom: ${({ theme }) => theme.spacing.xs};
`;

const AchievementDescription = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xs};
  color: ${({ theme }) => theme.colors.textLight};
`;

const achievements = [
  { id: 1, icon: '🏆', name: 'البداية', description: 'أكمل أول مستوى', unlocked: true },
  { id: 2, icon: '⭐', name: 'النجمة الأولى', description: 'احصل على 3 نجوم', unlocked: true },
  { id: 3, icon: '🎯', name: 'دقيق', description: 'أكمل لعبة بدون أخطاء', unlocked: true },
  { id: 4, icon: '🧠', name: 'عبقري', description: 'أكمل 10 مستويات', unlocked: false },
  { id: 5, icon: '📚', name: 'عالم التمور', description: 'اقرأ كل الموسوعة', unlocked: false },
  { id: 6, icon: '👑', name: 'الملك', description: 'أكمل جميع المستويات', unlocked: false },
];

export const ProfileScreen: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();

  return (
    <ProfileContainer>
      <Header>
        <BackButton onClick={() => navigate('/home')}>
          ← {t('common.back')}
        </BackButton>
        <ProfileInfo>
          <AvatarWrapper>
            <DateCharacter size={120} />
          </AvatarWrapper>
          <PlayerName>لاعب التمور</PlayerName>
          <PlayerRank>{t('profile.level')} 5 - خبير التمور</PlayerRank>
        </ProfileInfo>
      </Header>

      <Content>
        <StatsCard>
          <StatsGrid>
            <StatItem>
              <StatValue>1250</StatValue>
              <StatLabel>{t('profile.xp')}</StatLabel>
            </StatItem>
            <StatItem>
              <StatValue>480</StatValue>
              <StatLabel>{t('profile.coins')}</StatLabel>
            </StatItem>
            <StatItem>
              <StatValue>15</StatValue>
              <StatLabel>{t('profile.gamesPlayed')}</StatLabel>
            </StatItem>
          </StatsGrid>
          <div style={{ marginTop: '16px' }}>
            <StatLabel style={{ marginBottom: '8px', textAlign: 'left' }}>
              {t('profile.accuracy')}: 87%
            </StatLabel>
            <ProgressBar progress={87} showLabel />
          </div>
        </StatsCard>

        <SectionTitle>{t('profile.achievements')}</SectionTitle>
        <AchievementsList>
          {achievements.map((achievement, index) => (
            <AchievementCard
              key={achievement.id}
              as={motion.div}
              initial={{ opacity: 0, scale: 0.8 }}
              animate={{ opacity: achievement.unlocked ? 1 : 0.4, scale: 1 }}
              transition={{ delay: index * 0.05 }}
            >
              <AchievementIcon>
                {achievement.unlocked ? achievement.icon : '🔒'}
              </AchievementIcon>
              <AchievementName>{achievement.name}</AchievementName>
              <AchievementDescription>{achievement.description}</AchievementDescription>
            </AchievementCard>
          ))}
        </AchievementsList>
      </Content>
    </ProfileContainer>
  );
};
