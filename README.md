# Date Quest - لعبة أحجيات التمر 🌴

A fun, educational mobile puzzle game about date varieties, built with React, TypeScript, and styled-components.

![Date Quest](./public/date-icon.svg)

## 🎮 About

Date Quest is an educational mobile game designed to teach players about different types of dates (the fruit) in an engaging and interactive way. The game features multiple puzzle types, a comprehensive encyclopedia, and a progression system with XP and achievements.

## ✨ Features

### 🎯 Game Modes
- **Matching Game**: Drag and match date images with their names
- **Memory Game**: Flip cards to find matching pairs
- **Guess the Date**: Identify date varieties from images
- **Arrange Game**: Put date production stages in correct order

### 📱 Screens
1. **Splash Screen**: Animated introduction with mascot
2. **Onboarding**: 3-slide tutorial for new players
3. **Home Screen**: Main hub with stats and navigation
4. **Levels Screen**: 12+ levels with progression tracking
5. **Game Screens**: Interactive puzzle interfaces
6. **Encyclopedia**: Comprehensive date variety database
7. **Profile**: Player stats, XP, and achievements
8. **Settings**: Language, sound, and preferences
9. **Win/Lose Modals**: Animated results with star ratings

### 🎨 Design Features
- **Warm Color Palette**: Brown, gold, beige, sand, oasis green
- **Arabic-First Design**: RTL support with Cairo/Tajawal fonts
- **Cute Mascot**: Animated date character throughout the app
- **Smooth Animations**: Using Framer Motion for delightful interactions
- **Dark Mode**: Toggle between light and dark themes
- **Responsive**: Optimized for mobile portrait orientation

### 🌍 Internationalization
- Arabic (العربية) - Primary
- English
- French (Français)

## 🚀 Getting Started

### Prerequisites
- Node.js 18+ 
- npm or yarn

### Installation

```bash
# Install dependencies
npm install

# Start development server
npm run dev

# Build for production
npm run build

# Preview production build
npm run preview
```

## 📁 Project Structure

```
date-quest-mobile/
├── src/
│   ├── assets/
│   │   └── icons/           # SVG icons and illustrations
│   │       ├── DateCharacter.tsx
│   │       ├── PalmTree.tsx
│   │       ├── Star.tsx
│   │       └── Coin.tsx
│   ├── components/          # Reusable UI components
│   │   ├── Button.tsx
│   │   ├── Card.tsx
│   │   ├── ProgressBar.tsx
│   │   ├── Modal.tsx
│   │   └── Loading.tsx
│   ├── screens/             # Main app screens
│   │   ├── SplashScreen.tsx
│   │   ├── OnboardingScreen.tsx
│   │   ├── HomeScreen.tsx
│   │   ├── LevelsScreen.tsx
│   │   ├── GameScreen.tsx
│   │   ├── EncyclopediaScreen.tsx
│   │   ├── ProfileScreen.tsx
│   │   └── SettingsScreen.tsx
│   ├── styles/              # Theme and global styles
│   │   ├── theme.ts
│   │   └── GlobalStyles.ts
│   ├── i18n/                # Internationalization
│   │   ├── config.ts
│   │   └── translations/
│   │       ├── ar.json
│   │       ├── en.json
│   │       └── fr.json
│   ├── App.tsx              # Main app component
│   └── main.tsx             # Entry point
├── public/
│   └── date-icon.svg        # App icon
├── index.html               # HTML template
├── package.json
├── tsconfig.json
├── vite.config.ts
└── README.md
```

## 🎨 Design System

### Colors
- **Primary**: `#D4A574` (Dates Gold)
- **Secondary**: `#8B6F47` (Dates Brown)
- **Accent**: `#F4D03F` (Golden Yellow)
- **Success**: `#5FB660` (Oasis Green)
- **Background**: `#FFF8E7` (Warm Sand)

### Typography
- **Primary Font**: Cairo (Arabic-friendly)
- **Secondary Font**: Tajawal
- **Loaded via**: Google Fonts

### Components
- Rounded corners (`border-radius: 0.5rem - 2rem`)
- Soft shadows with brown tint
- Smooth transitions (250ms ease)
- Gradient backgrounds for depth

## 🔧 Technologies

- **React 18** - UI library
- **TypeScript** - Type safety
- **Vite** - Build tool
- **React Router** - Navigation
- **Styled Components** - Styling
- **Framer Motion** - Animations
- **i18next** - Internationalization
- **React DnD** - Drag and drop (for matching game)

## 📱 Progressive Web App

The app can be configured as a PWA for installation on mobile devices:

1. Add `manifest.json` for app metadata
2. Add service worker for offline support
3. Configure `vite-plugin-pwa`

## 🎯 Game Data Structure

### Level Schema
```typescript
{
  id: number;
  type: 'matching' | 'memory' | 'guess' | 'arrange';
  completed: boolean;
  stars: 0 | 1 | 2 | 3;
  unlocked: boolean;
}
```

### Date Variety Schema
```typescript
{
  id: number;
  name: string;
  nameEn: string;
  origin: string;
  taste: string;
  color: string;
  uses: string;
  nutrition: string;
}
```

## 🌟 Future Enhancements

- [ ] Sound effects and background music
- [ ] Online leaderboards
- [ ] Social sharing
- [ ] Daily challenges
- [ ] More date varieties
- [ ] Advanced game modes
- [ ] Multiplayer competitions
- [ ] AR mode for date recognition
- [ ] Recipe collection

## 📄 License

This project is created for educational purposes.

## 👥 Credits

- Design: Inspired by Middle Eastern oasis aesthetics
- Fonts: Cairo & Tajawal from Google Fonts
- Icons: Custom SVG illustrations
- Mascot: Original date character design

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

For questions or support, please open an issue in the repository.

---

Made with ❤️ for date enthusiasts everywhere 🌴
