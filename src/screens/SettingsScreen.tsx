import React, { useState } from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { Card } from '@/components/Card';

const SettingsContainer = styled.div`
  width: 100%;
  min-height: 100vh;
  background: ${({ theme }) => theme.colors.background};
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
`;

const Content = styled.div`
  padding: ${({ theme }) => theme.spacing.lg};
`;

const SettingCard = styled(Card)`
  margin-bottom: ${({ theme }) => theme.spacing.md};
  padding: ${({ theme }) => theme.spacing.lg};
`;

const SettingRow = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: ${({ theme }) => theme.spacing.md} 0;
  border-bottom: 1px solid ${({ theme }) => theme.colors.borderLight};
  
  &:last-child {
    border-bottom: none;
    padding-bottom: 0;
  }
  
  &:first-child {
    padding-top: 0;
  }
`;

const SettingLabel = styled.div`
  display: flex;
  align-items: center;
  gap: ${({ theme }) => theme.spacing.md};
`;

const SettingIcon = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.xl};
  width: 40px;
  height: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: ${({ theme }) => theme.borderRadius.md};
  background: ${({ theme }) => theme.colors.backgroundSecondary};
`;

const SettingText = styled.div``;

const SettingTitle = styled.div`
  font-weight: 700;
  color: ${({ theme }) => theme.colors.text};
  margin-bottom: ${({ theme }) => theme.spacing.xs};
`;

const SettingDescription = styled.div`
  font-size: ${({ theme }) => theme.fontSizes.sm};
  color: ${({ theme }) => theme.colors.textSecondary};
`;

const Toggle = styled.button<{ active: boolean }>`
  width: 50px;
  height: 28px;
  border-radius: ${({ theme }) => theme.borderRadius.full};
  background: ${({ active, theme }) =>
    active ? theme.colors.success : theme.colors.border};
  position: relative;
  transition: background ${({ theme }) => theme.transitions.normal};
  
  &::after {
    content: '';
    position: absolute;
    top: 2px;
    right: ${({ active }) => (active ? '2px' : 'calc(100% - 26px)')};
    width: 24px;
    height: 24px;
    border-radius: 50%;
    background: white;
    transition: right ${({ theme }) => theme.transitions.normal};
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  }
`;

const Select = styled.select`
  padding: ${({ theme }) => theme.spacing.sm} ${({ theme }) => theme.spacing.md};
  border-radius: ${({ theme }) => theme.borderRadius.md};
  border: 2px solid ${({ theme }) => theme.colors.border};
  background: ${({ theme }) => theme.colors.surface};
  color: ${({ theme }) => theme.colors.text};
  font-family: ${({ theme }) => theme.fonts.primary};
  font-size: ${({ theme }) => theme.fontSizes.base};
  font-weight: 600;
  cursor: pointer;
  
  &:focus {
    outline: none;
    border-color: ${({ theme }) => theme.colors.primary};
  }
`;

const SectionTitle = styled.h3`
  font-size: ${({ theme }) => theme.fontSizes.base};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.textSecondary};
  margin: ${({ theme }) => theme.spacing.lg} 0 ${({ theme }) => theme.spacing.md};
  text-transform: uppercase;
  letter-spacing: 0.5px;
`;

const Version = styled.div`
  text-align: center;
  color: ${({ theme }) => theme.colors.textLight};
  font-size: ${({ theme }) => theme.fontSizes.sm};
  margin-top: ${({ theme }) => theme.spacing.xl};
`;

export const SettingsScreen: React.FC = () => {
  const navigate = useNavigate();
  const { t, i18n } = useTranslation();
  const [music, setMusic] = useState(true);
  const [sfx, setSfx] = useState(true);
  const [notifications, setNotifications] = useState(true);
  const [darkMode, setDarkMode] = useState(false);

  const handleLanguageChange = (e: React.ChangeEvent<HTMLSelectElement>) => {
    const newLang = e.target.value;
    i18n.changeLanguage(newLang);
    document.documentElement.dir = newLang === 'ar' ? 'rtl' : 'ltr';
    document.documentElement.lang = newLang;
  };

  return (
    <SettingsContainer>
      <Header>
        <BackButton onClick={() => navigate('/home')}>
          ← {t('common.back')}
        </BackButton>
        <Title>{t('settings.title')}</Title>
      </Header>

      <Content>
        <SectionTitle>{t('settings.language')}</SectionTitle>
        <SettingCard as={motion.div} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}>
          <SettingRow>
            <SettingLabel>
              <SettingIcon>🌍</SettingIcon>
              <SettingText>
                <SettingTitle>{t('settings.language')}</SettingTitle>
              </SettingText>
            </SettingLabel>
            <Select value={i18n.language} onChange={handleLanguageChange}>
              <option value="ar">{t('settings.languages.ar')}</option>
              <option value="en">{t('settings.languages.en')}</option>
              <option value="fr">{t('settings.languages.fr')}</option>
            </Select>
          </SettingRow>
        </SettingCard>

        <SectionTitle>{t('settings.sound')}</SectionTitle>
        <SettingCard as={motion.div} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.1 }}>
          <SettingRow>
            <SettingLabel>
              <SettingIcon>🎵</SettingIcon>
              <SettingText>
                <SettingTitle>{t('settings.music')}</SettingTitle>
                <SettingDescription>تشغيل الموسيقى الخلفية</SettingDescription>
              </SettingText>
            </SettingLabel>
            <Toggle active={music} onClick={() => setMusic(!music)} />
          </SettingRow>
          
          <SettingRow>
            <SettingLabel>
              <SettingIcon>🔊</SettingIcon>
              <SettingText>
                <SettingTitle>{t('settings.sfx')}</SettingTitle>
                <SettingDescription>تشغيل المؤثرات الصوتية</SettingDescription>
              </SettingText>
            </SettingLabel>
            <Toggle active={sfx} onClick={() => setSfx(!sfx)} />
          </SettingRow>
        </SettingCard>

        <SectionTitle>إعدادات أخرى</SectionTitle>
        <SettingCard as={motion.div} initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }} transition={{ delay: 0.2 }}>
          <SettingRow>
            <SettingLabel>
              <SettingIcon>🔔</SettingIcon>
              <SettingText>
                <SettingTitle>{t('settings.notifications')}</SettingTitle>
                <SettingDescription>تلقي الإشعارات</SettingDescription>
              </SettingText>
            </SettingLabel>
            <Toggle active={notifications} onClick={() => setNotifications(!notifications)} />
          </SettingRow>
          
          <SettingRow>
            <SettingLabel>
              <SettingIcon>🌙</SettingIcon>
              <SettingText>
                <SettingTitle>{t('settings.darkMode')}</SettingTitle>
                <SettingDescription>تفعيل الوضع الليلي</SettingDescription>
              </SettingText>
            </SettingLabel>
            <Toggle active={darkMode} onClick={() => setDarkMode(!darkMode)} />
          </SettingRow>
        </SettingCard>

        <Version>{t('settings.version')} 1.0.0</Version>
      </Content>
    </SettingsContainer>
  );
};
