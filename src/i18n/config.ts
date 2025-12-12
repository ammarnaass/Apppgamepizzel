import i18n from 'i18next';
import { initReactI18next } from 'react-i18next';
import ar from './translations/ar.json';
import en from './translations/en.json';
import fr from './translations/fr.json';

i18n
  .use(initReactI18next)
  .init({
    resources: {
      ar: { translation: ar },
      en: { translation: en },
      fr: { translation: fr },
    },
    lng: 'ar',
    fallbackLng: 'ar',
    interpolation: {
      escapeValue: false,
    },
  });

export default i18n;
