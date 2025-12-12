export const lightTheme = {
  colors: {
    primary: '#D4A574',
    primaryDark: '#B8894F',
    secondary: '#8B6F47',
    accent: '#F4D03F',
    success: '#5FB660',
    danger: '#E74C3C',
    warning: '#F39C12',
    
    datesBrown: '#8B4513',
    datesGold: '#D4A574',
    datesBeige: '#F5E6D3',
    sandLight: '#F4E4C1',
    sandDark: '#D2B48C',
    oasisGreen: '#6B8E23',
    palmGreen: '#228B22',
    desertSky: '#87CEEB',
    
    background: '#FFF8E7',
    backgroundSecondary: '#FFF4E0',
    surface: '#FFFFFF',
    surfaceHover: '#FFF9F0',
    
    text: '#3E2723',
    textSecondary: '#6D4C41',
    textLight: '#8D6E63',
    textInverse: '#FFFFFF',
    
    border: '#E0C9A6',
    borderLight: '#F0DCC0',
    shadow: 'rgba(139, 69, 19, 0.15)',
    shadowDark: 'rgba(139, 69, 19, 0.25)',
  },
  
  fonts: {
    primary: '"Cairo", "Tajawal", sans-serif',
    secondary: '"Tajawal", "Cairo", sans-serif',
  },
  
  fontSizes: {
    xs: '0.75rem',
    sm: '0.875rem',
    base: '1rem',
    lg: '1.125rem',
    xl: '1.25rem',
    '2xl': '1.5rem',
    '3xl': '1.875rem',
    '4xl': '2.25rem',
    '5xl': '3rem',
  },
  
  spacing: {
    xs: '0.25rem',
    sm: '0.5rem',
    md: '1rem',
    lg: '1.5rem',
    xl: '2rem',
    '2xl': '3rem',
    '3xl': '4rem',
  },
  
  borderRadius: {
    sm: '0.5rem',
    md: '1rem',
    lg: '1.5rem',
    xl: '2rem',
    full: '9999px',
  },
  
  shadows: {
    sm: '0 2px 8px rgba(139, 69, 19, 0.1)',
    md: '0 4px 16px rgba(139, 69, 19, 0.15)',
    lg: '0 8px 24px rgba(139, 69, 19, 0.2)',
    xl: '0 12px 32px rgba(139, 69, 19, 0.25)',
  },
  
  transitions: {
    fast: '150ms ease',
    normal: '250ms ease',
    slow: '350ms ease',
  },
};

export const darkTheme = {
  ...lightTheme,
  colors: {
    ...lightTheme.colors,
    background: '#1A120B',
    backgroundSecondary: '#2D1B0E',
    surface: '#3E2723',
    surfaceHover: '#4E342E',
    
    text: '#F5E6D3',
    textSecondary: '#D7CCC8',
    textLight: '#BCAAA4',
    textInverse: '#1A120B',
    
    border: '#4E342E',
    borderLight: '#5D4037',
    shadow: 'rgba(0, 0, 0, 0.3)',
    shadowDark: 'rgba(0, 0, 0, 0.5)',
  },
};

export type Theme = typeof lightTheme;
