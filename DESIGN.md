# Date Quest - Design Documentation 🎨

This document outlines the complete design system and UI/UX guidelines for the Date Quest mobile game.

## 🎨 Color Palette

### Light Theme (Default)

#### Primary Colors
```css
primary: #D4A574        /* Dates Gold - Main brand color */
primaryDark: #B8894F    /* Darker gold for hover states */
secondary: #8B6F47      /* Dates Brown - Secondary actions */
accent: #F4D03F         /* Golden Yellow - Highlights and rewards */
```

#### Semantic Colors
```css
success: #5FB660        /* Oasis Green - Positive actions */
danger: #E74C3C         /* Red - Errors and wrong answers */
warning: #F39C12        /* Orange - Warnings */
```

#### Date-Inspired Colors
```css
datesBrown: #8B4513     /* Rich brown for date fruits */
datesGold: #D4A574      /* Golden dates */
datesBeige: #F5E6D3     /* Light beige */
sandLight: #F4E4C1      /* Desert sand light */
sandDark: #D2B48C       /* Desert sand dark */
oasisGreen: #6B8E23     /* Palm oasis */
palmGreen: #228B22      /* Palm leaves */
desertSky: #87CEEB      /* Sky blue */
```

#### Background Colors
```css
background: #FFF8E7             /* Warm cream */
backgroundSecondary: #FFF4E0    /* Slightly darker cream */
surface: #FFFFFF                /* Cards and modals */
surfaceHover: #FFF9F0          /* Hover state */
```

#### Text Colors
```css
text: #3E2723           /* Dark brown - Primary text */
textSecondary: #6D4C41  /* Medium brown - Secondary text */
textLight: #8D6E63      /* Light brown - Disabled text */
textInverse: #FFFFFF    /* White - Text on dark backgrounds */
```

#### Border & Shadow
```css
border: #E0C9A6                     /* Light border */
borderLight: #F0DCC0                /* Very light border */
shadow: rgba(139, 69, 19, 0.15)     /* Soft shadow */
shadowDark: rgba(139, 69, 19, 0.25) /* Darker shadow */
```

### Dark Theme

All light theme colors are adjusted for dark mode with inverted backgrounds and adjusted contrasts while maintaining the warm date-inspired palette.

## 📐 Typography

### Font Families
```css
primary: 'Cairo', 'Tajawal', sans-serif
secondary: 'Tajawal', 'Cairo', sans-serif
```

### Font Sizes
```css
xs: 0.75rem     /* 12px - Small labels */
sm: 0.875rem    /* 14px - Secondary text */
base: 1rem      /* 16px - Body text */
lg: 1.125rem    /* 18px - Large body */
xl: 1.25rem     /* 20px - Small headings */
2xl: 1.5rem     /* 24px - Medium headings */
3xl: 1.875rem   /* 30px - Large headings */
4xl: 2.25rem    /* 36px - Extra large */
5xl: 3rem       /* 48px - Hero text */
```

### Font Weights
- Regular: 400
- Medium: 500
- SemiBold: 600
- Bold: 700
- ExtraBold: 800
- Black: 900

## 📏 Spacing System

```css
xs: 0.25rem    /* 4px */
sm: 0.5rem     /* 8px */
md: 1rem       /* 16px */
lg: 1.5rem     /* 24px */
xl: 2rem       /* 32px */
2xl: 3rem      /* 48px */
3xl: 4rem      /* 64px */
```

## 🔲 Border Radius

```css
sm: 0.5rem     /* 8px - Small elements */
md: 1rem       /* 16px - Medium elements */
lg: 1.5rem     /* 24px - Large cards */
xl: 2rem       /* 32px - Modals */
full: 9999px   /* Fully rounded (pills, circles) */
```

## 🎭 Shadows

```css
sm: 0 2px 8px rgba(139, 69, 19, 0.1)    /* Subtle elevation */
md: 0 4px 16px rgba(139, 69, 19, 0.15)  /* Cards */
lg: 0 8px 24px rgba(139, 69, 19, 0.2)   /* Modals */
xl: 0 12px 32px rgba(139, 69, 19, 0.25) /* Maximum elevation */
```

## ⏱️ Transitions

```css
fast: 150ms ease    /* Quick feedback */
normal: 250ms ease  /* Default transitions */
slow: 350ms ease    /* Smooth, noticeable */
```

## 🎬 Animations

### Bounce
```css
@keyframes bounce {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-10px); }
}
```

### Wave (for mascot hand)
```css
@keyframes wave {
  0%, 100% { transform: rotate(0deg); }
  25% { transform: rotate(20deg); }
  75% { transform: rotate(-20deg); }
}
```

### Pulse
```css
@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}
```

### Slide In Right
```css
@keyframes slideInRight {
  from {
    transform: translateX(100%);
    opacity: 0;
  }
  to {
    transform: translateX(0);
    opacity: 1;
  }
}
```

## 🎯 Component Guidelines

### Buttons

**Primary Button**
- Background: Linear gradient (primary → primaryDark)
- Text: textInverse
- Padding: md xl (vertical horizontal)
- Border Radius: full
- Shadow: md
- Hover: Lift 2px, increase shadow to lg
- Active: Return to 0px

**Secondary Button**
- Background: secondary
- Similar styling to primary

**Outline Button**
- Background: transparent
- Border: 2px solid primary
- Text: primary
- Hover: Fill with primary, text becomes textInverse

### Cards

**Standard Card**
- Background: surface
- Border Radius: lg
- Padding: lg
- Shadow: md
- Hover (if clickable): Lift 4px

**Elevated Card**
- Shadow: lg
- Used for important content

### Progress Bar

- Container: borderLight background, full border radius
- Fill: Linear gradient (primary → accent)
- Height: 24px (default)
- Label: Shown on fill, right-aligned
- Animation: Shimmer effect on fill

### Modal

- Overlay: rgba(0, 0, 0, 0.7)
- Content: surface background, xl border radius, xl shadow
- Padding: 2xl
- Max Width: 400-500px
- Animation: Scale up from 0.8 with fade

## 🎮 Screen-Specific Guidelines

### Splash Screen
- Full viewport height
- Gradient background: desertSky → sandLight → datesBeige
- Centered content
- Animated decorations (floating circles)
- Bouncing mascot with wave animation

### Home Screen
- Gradient background with sky and oasis
- Cloud decorations with horizontal movement
- Central scene with palm trees and mascot
- Stats card at top with XP progress bar
- 2x2 grid of menu items
- Large primary button at bottom

### Levels Screen
- 3-column grid for levels
- Circular level indicators
- Palm tree icons for levels
- Progress bar at top
- Color coding: locked (gray), available (gold), completed (green)
- Star ratings on completed levels

### Game Screens
- Header with score, time, moves
- Central game area (max-width: 500px)
- Instruction text
- Interactive elements with hover/tap feedback
- Result modal with star animation

### Encyclopedia
- Searchable list
- Card-based layout
- Color-coded headers per variety
- Expandable details
- Images or emoji representations

### Profile
- Gradient header with avatar
- Stats grid (3 columns)
- Achievement badges (2-column grid)
- Locked/unlocked visual distinction

### Settings
- Grouped settings in cards
- Icon + label for each setting
- Toggle switches for boolean options
- Dropdown for language selection
- Version number at bottom

## 📱 Mobile Optimization

### Viewport
- Design for: 375x667 (iPhone SE) to 414x896 (iPhone 11 Pro Max)
- All touch targets: Minimum 44x44px
- Safe area insets respected

### Typography
- Base font size: 16px (prevents zoom on input focus in iOS)
- Line height: 1.5 for body text
- Generous letter spacing for Arabic text

### Interactions
- Touch-friendly buttons with minimum size
- Visual feedback on all interactive elements
- No hover-only interactions
- Swipe gestures for navigation where appropriate
- Pull-to-refresh on lists

### Performance
- Lazy load heavy images
- Optimize SVG icons
- Use CSS transforms for animations (hardware accelerated)
- Debounce search inputs

## 🌍 RTL Support

### Arabic (RTL)
- `direction: rtl` on html element
- Flexbox automatically reverses
- Margins/padding: Use logical properties where possible
- Icons: Some may need flipping (arrows)
- Text alignment: right by default

### LTR Languages
- `direction: ltr`
- Adjust alignment as needed

## 🎨 Illustration Style

### Date Character (Mascot)
- Brown ellipse body with gradient
- Green leaf on top with spreads
- Two circular eyes with white highlights
- Curved smile line (sad: inverted curve)
- Optional arm for waving
- Soft drop shadow

### Palm Tree
- Brown trunk with texture rings
- Green palm fronds radiating from center
- Brown date clusters
- Slight rotation animation for wind effect

### Icons
- Simple, bold, easily recognizable
- 2px stroke weight
- Rounded line caps and joins
- Consistent with mascot style

## 🏆 Gamification Elements

### Stars (0-3 per level)
- Gold filled star: ⭐
- Empty star outline: ☆
- Stagger animation on reveal
- Based on performance metrics

### XP Bar
- Gradient fill with shimmer
- Percentage label
- Smooth transition on gain
- Particle effect on level up

### Coins
- Gold circular icon
- Gradient fill
- Pop animation on collection
- Counter with comma separators

### Achievements
- Badge-style cards
- Large emoji icons
- Locked state: grayscale + lock icon
- Unlock animation: scale up with confetti

## 📐 Layout Patterns

### Screen Template
```
┌──────────────────┐
│      Header      │
│   (Fixed/Sticky) │
├──────────────────┤
│                  │
│                  │
│   Main Content   │
│   (Scrollable)   │
│                  │
│                  │
├──────────────────┤
│     Footer       │
│   (Optional)     │
└──────────────────┘
```

### Card Grid
- 2 columns: Menu items, achievements
- 3 columns: Level selection
- 1 column: Encyclopedia entries, settings

### Spacing
- Screen padding: lg (24px)
- Card gap: md (16px)
- Section gap: xl (32px)

## 🎵 Sound Design (Future)

### SFX
- Button tap: Soft click
- Correct answer: Chime
- Wrong answer: Buzz
- Star collect: Twinkle
- Level complete: Fanfare
- Card flip: Whoosh

### Music
- Main theme: Middle Eastern-inspired, upbeat
- Game music: Calm, focus-friendly
- Result screen: Triumphant or encouraging

## ♿ Accessibility

### Color Contrast
- Text on background: Minimum 4.5:1 (WCAG AA)
- Large text: Minimum 3:1
- Interactive elements: Clear focus states

### Touch Targets
- Minimum 44x44px
- Adequate spacing between targets

### Text
- Scalable fonts
- No text in images
- Clear, simple language

### Motion
- Respect prefers-reduced-motion
- Provide alternative to animations

## 🔄 State Management

### Loading States
- Animated mascot
- Progress indication
- Skeleton screens for lists

### Empty States
- Friendly illustration
- Clear message
- Action button

### Error States
- Sad mascot
- Error message
- Retry button

---

Last Updated: 2024
Version: 1.0.0
