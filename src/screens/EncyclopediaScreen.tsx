import React, { useState } from 'react';
import styled from 'styled-components';
import { motion } from 'framer-motion';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import { Card } from '@/components/Card';

const EncyclopediaContainer = styled.div`
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
  margin-bottom: ${({ theme }) => theme.spacing.md};
`;

const SearchBar = styled.input`
  width: 100%;
  padding: ${({ theme }) => theme.spacing.md};
  border-radius: ${({ theme }) => theme.borderRadius.full};
  border: 2px solid ${({ theme }) => theme.colors.border};
  font-size: ${({ theme }) => theme.fontSizes.base};
  font-family: ${({ theme }) => theme.fonts.primary};
  background: ${({ theme }) => theme.colors.backgroundSecondary};
  color: ${({ theme }) => theme.colors.text};
  
  &:focus {
    outline: none;
    border-color: ${({ theme }) => theme.colors.primary};
  }
  
  &::placeholder {
    color: ${({ theme }) => theme.colors.textLight};
  }
`;

const Content = styled.div`
  padding: ${({ theme }) => theme.spacing.lg};
`;

const DateCard = styled(Card)`
  margin-bottom: ${({ theme }) => theme.spacing.lg};
  overflow: hidden;
`;

const DateImage = styled.div<{ color: string }>`
  width: 100%;
  height: 150px;
  background: ${({ color }) => color};
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 80px;
  margin: -${({ theme }) => theme.spacing.lg};
  margin-bottom: ${({ theme }) => theme.spacing.lg};
`;

const DateName = styled.h3`
  font-size: ${({ theme }) => theme.fontSizes.xl};
  font-weight: 800;
  color: ${({ theme }) => theme.colors.datesBrown};
  margin-bottom: ${({ theme }) => theme.spacing.sm};
`;

const DateInfo = styled.div`
  display: flex;
  flex-direction: column;
  gap: ${({ theme }) => theme.spacing.sm};
`;

const InfoRow = styled.div`
  display: flex;
  gap: ${({ theme }) => theme.spacing.sm};
`;

const InfoLabel = styled.span`
  font-weight: 700;
  color: ${({ theme }) => theme.colors.primary};
  min-width: 80px;
`;

const InfoValue = styled.span`
  color: ${({ theme }) => theme.colors.textSecondary};
`;

const dates = [
  {
    id: 1,
    name: 'تمر المجهول',
    nameEn: 'Medjool',
    origin: 'المغرب',
    taste: 'حلو وطري',
    color: '#8B4513',
    uses: 'للأكل المباشر، الحلويات',
    nutrition: 'غني بالألياف والبوتاسيوم',
  },
  {
    id: 2,
    name: 'تمر العجوة',
    nameEn: 'Ajwa',
    origin: 'المدينة المنورة',
    taste: 'حلو ومميز',
    color: '#654321',
    uses: 'للأكل المباشر، فوائد صحية',
    nutrition: 'غني بمضادات الأكسدة',
  },
  {
    id: 3,
    name: 'تمر الصقعي',
    nameEn: 'Sukkari',
    origin: 'القصيم',
    taste: 'حلو جداً وطري',
    color: '#D4A574',
    uses: 'للأكل المباشر، الهدايا',
    nutrition: 'غني بالسكريات الطبيعية',
  },
  {
    id: 4,
    name: 'تمر البرحي',
    nameEn: 'Barhi',
    origin: 'العراق',
    taste: 'حلو ومقرمش',
    color: '#DAA520',
    uses: 'للأكل طازجاً أو مجففاً',
    nutrition: 'غني بالفيتامينات',
  },
  {
    id: 5,
    name: 'تمر الخضري',
    nameEn: 'Khudri',
    origin: 'المدينة المنورة',
    taste: 'حلو معتدل',
    color: '#8B6F47',
    uses: 'للطبخ والأكل المباشر',
    nutrition: 'غني بالحديد',
  },
];

export const EncyclopediaScreen: React.FC = () => {
  const navigate = useNavigate();
  const { t } = useTranslation();
  const [searchQuery, setSearchQuery] = useState('');

  const filteredDates = dates.filter(date =>
    date.name.includes(searchQuery) || date.nameEn.toLowerCase().includes(searchQuery.toLowerCase())
  );

  return (
    <EncyclopediaContainer>
      <Header>
        <BackButton onClick={() => navigate('/home')}>
          ← {t('common.back')}
        </BackButton>
        <Title>{t('encyclopedia.title')}</Title>
        <SearchBar
          type="text"
          placeholder={t('encyclopedia.search')}
          value={searchQuery}
          onChange={(e) => setSearchQuery(e.target.value)}
        />
      </Header>

      <Content>
        {filteredDates.map((date, index) => (
          <DateCard
            key={date.id}
            clickable
            as={motion.div}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: index * 0.1 }}
          >
            <DateImage color={date.color}>
              🌴
            </DateImage>
            <DateName>{date.name}</DateName>
            <DateInfo>
              <InfoRow>
                <InfoLabel>{t('encyclopedia.origin')}:</InfoLabel>
                <InfoValue>{date.origin}</InfoValue>
              </InfoRow>
              <InfoRow>
                <InfoLabel>{t('encyclopedia.taste')}:</InfoLabel>
                <InfoValue>{date.taste}</InfoValue>
              </InfoRow>
              <InfoRow>
                <InfoLabel>{t('encyclopedia.uses')}:</InfoLabel>
                <InfoValue>{date.uses}</InfoValue>
              </InfoRow>
              <InfoRow>
                <InfoLabel>{t('encyclopedia.nutrition')}:</InfoLabel>
                <InfoValue>{date.nutrition}</InfoValue>
              </InfoRow>
            </DateInfo>
          </DateCard>
        ))}
      </Content>
    </EncyclopediaContainer>
  );
};
