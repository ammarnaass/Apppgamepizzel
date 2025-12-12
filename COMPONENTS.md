# Component Documentation 📦

Complete reference for all reusable components in Date Quest.

## 🎨 UI Components

### Button

A versatile button component with multiple variants and sizes.

**Props:**
```typescript
interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'success' | 'danger' | 'outline';
  size?: 'sm' | 'md' | 'lg';
  fullWidth?: boolean;
  disabled?: boolean;
  icon?: React.ReactNode;
  children: React.ReactNode;
  onClick?: () => void;
  className?: string;
}
```

**Usage:**
```tsx
import { Button } from '@/components/Button';

<Button variant="primary" size="lg" onClick={handleClick}>
  ابدأ اللعب
</Button>

<Button variant="outline" icon={<StarIcon />}>
  مع أيقونة
</Button>

<Button fullWidth disabled>
  معطل
</Button>
```

**Variants:**
- `primary`: Gold gradient background (default)
- `secondary`: Brown background
- `success`: Green background
- `danger`: Red background
- `outline`: Transparent with border

**Sizes:**
- `sm`: Small (8px 24px padding)
- `md`: Medium (16px 32px padding) - default
- `lg`: Large (24px 48px padding)

**Features:**
- Ripple effect on click
- Smooth hover animations
- Disabled state styling
- Icon support
- Fully accessible

---

### Card

A flexible container component for content.

**Props:**
```typescript
interface CardProps {
  children: React.ReactNode;
  elevated?: boolean;
  clickable?: boolean;
  onClick?: () => void;
  className?: string;
}
```

**Usage:**
```tsx
import { Card } from '@/components/Card';

<Card elevated>
  <h3>عنوان البطاقة</h3>
  <p>محتوى البطاقة</p>
</Card>

<Card clickable onClick={handleClick}>
  بطاقة قابلة للنقر
</Card>
```

**Features:**
- Standard or elevated shadow
- Clickable variant with hover effects
- Rounded corners
- Smooth transitions

---

### ProgressBar

An animated progress indicator.

**Props:**
```typescript
interface ProgressBarProps {
  progress: number;        // 0-100
  showLabel?: boolean;
  height?: number;         // in pixels
  color?: string;          // custom color
  className?: string;
}
```

**Usage:**
```tsx
import { ProgressBar } from '@/components/ProgressBar';

<ProgressBar progress={75} showLabel />

<ProgressBar 
  progress={50} 
  height={32}
  color="linear-gradient(90deg, #FF6B6B, #FF8E53)"
/>
```

**Features:**
- Smooth animation on value change
- Optional percentage label
- Customizable height and color
- Shimmer effect
- Gradient support

---

### Modal

A modal dialog component.

**Props:**
```typescript
interface ModalProps {
  isOpen: boolean;
  onClose: () => void;
  children: React.ReactNode;
  className?: string;
}
```

**Usage:**
```tsx
import { Modal } from '@/components/Modal';

const [isOpen, setIsOpen] = useState(false);

<Modal isOpen={isOpen} onClose={() => setIsOpen(false)}>
  <h2>عنوان النافذة</h2>
  <p>محتوى النافذة</p>
  <Button onClick={() => setIsOpen(false)}>إغلاق</Button>
</Modal>
```

**Features:**
- Backdrop overlay with blur
- Scale and fade animations
- Close on backdrop click
- Close button in top corner
- Scrollable content
- Prevents body scroll when open

---

### Loading

A loading indicator with animated mascot.

**Props:**
```typescript
interface LoadingProps {
  message?: string;
}
```

**Usage:**
```tsx
import { Loading } from '@/components/Loading';

<Loading message="جاري تحميل المستويات..." />
```

**Features:**
- Animated date character
- Custom message
- Animated dots
- Full-screen display

---

## 🎨 Icon Components

### DateCharacter

The main mascot character.

**Props:**
```typescript
interface DateCharacterProps {
  size?: number;           // in pixels
  isWaving?: boolean;
  isSad?: boolean;
  className?: string;
}
```

**Usage:**
```tsx
import { DateCharacter } from '@/assets/icons/DateCharacter';

<DateCharacter size={120} isWaving />
<DateCharacter size={100} isSad />
```

**Features:**
- Scalable SVG
- Waving animation (when isWaving=true)
- Happy or sad expression
- Gradient fill
- Drop shadow

---

### PalmTree

Palm tree illustration.

**Props:**
```typescript
interface PalmTreeProps {
  size?: number;
  className?: string;
}
```

**Usage:**
```tsx
import { PalmTree } from '@/assets/icons/PalmTree';

<PalmTree size={150} />
```

**Features:**
- Scalable SVG
- Gradient leaves
- Textured trunk
- Date clusters

---

### Star

Star icon for ratings.

**Props:**
```typescript
interface StarProps {
  size?: number;
  filled?: boolean;
  className?: string;
}
```

**Usage:**
```tsx
import { Star } from '@/assets/icons/Star';

<Star size={32} filled />
<Star size={24} filled={false} />
```

**Features:**
- Filled or outline
- Golden color
- Stroke and fill

---

### Coin

Coin icon for currency.

**Props:**
```typescript
interface CoinProps {
  size?: number;
  className?: string;
}
```

**Usage:**
```tsx
import { Coin } from '@/assets/icons/Coin';

<Coin size={28} />
```

**Features:**
- Gold gradient
- Layered circles
- Dollar symbol

---

## 📱 Screen Components

All screens follow a consistent structure:

### Common Patterns

**Header Section:**
```tsx
<Header>
  <BackButton onClick={() => navigate(-1)}>
    ← {t('common.back')}
  </BackButton>
  <Title>{t('screen.title')}</Title>
</Header>
```

**Content Section:**
```tsx
<Content>
  {/* Main screen content */}
</Content>
```

**Loading State:**
```tsx
{isLoading ? (
  <Loading message={t('common.loading')} />
) : (
  <Content>{/* ... */}</Content>
)}
```

**Error State:**
```tsx
{error ? (
  <ErrorView 
    message={error.message}
    onRetry={handleRetry}
  />
) : (
  <Content>{/* ... */}</Content>
)}
```

---

## 🎮 Game Components

### Game Header

Standard header for all game screens.

```tsx
<GameHeader>
  <HeaderLeft>
    <BackButton onClick={handleQuit}>←</BackButton>
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
```

---

### Result Modal

Modal shown on game completion.

```tsx
<Modal isOpen={showResult} onClose={handleClose}>
  <DateCharacter size={120} isSad={!isWin} />
  <ModalTitle>
    {isWin ? t('result.win.title') : t('result.lose.title')}
  </ModalTitle>
  <ModalMessage>
    {isWin ? t('result.win.message') : t('result.lose.message')}
  </ModalMessage>
  
  {isWin && (
    <StarsContainer>
      {[...Array(3)].map((_, i) => (
        <Star key={i} filled={i < stars} size={40} />
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
</Modal>
```

---

## 🎨 Styled Component Patterns

### Common Styled Components

**Container:**
```tsx
const Container = styled.div`
  width: 100%;
  min-height: 100vh;
  background: ${({ theme }) => theme.colors.background};
  padding: ${({ theme }) => theme.spacing.lg};
`;
```

**Flex Center:**
```tsx
const FlexCenter = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  gap: ${({ theme }) => theme.spacing.md};
`;
```

**Grid Layout:**
```tsx
const Grid = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: ${({ theme }) => theme.spacing.md};
`;
```

**Scrollable Content:**
```tsx
const ScrollContent = styled.div`
  flex: 1;
  overflow-y: auto;
  padding: ${({ theme }) => theme.spacing.lg};
  
  /* Hide scrollbar for cleaner look */
  &::-webkit-scrollbar {
    display: none;
  }
  -ms-overflow-style: none;
  scrollbar-width: none;
`;
```

---

## 🎬 Animation Patterns

### Framer Motion Variants

**Fade In:**
```tsx
<motion.div
  initial={{ opacity: 0 }}
  animate={{ opacity: 1 }}
  exit={{ opacity: 0 }}
>
  {content}
</motion.div>
```

**Slide In:**
```tsx
<motion.div
  initial={{ x: 100, opacity: 0 }}
  animate={{ x: 0, opacity: 1 }}
  exit={{ x: -100, opacity: 0 }}
  transition={{ duration: 0.3 }}
>
  {content}
</motion.div>
```

**Scale In:**
```tsx
<motion.div
  initial={{ scale: 0, opacity: 0 }}
  animate={{ scale: 1, opacity: 1 }}
  transition={{ type: 'spring', stiffness: 200 }}
>
  {content}
</motion.div>
```

**Stagger Children:**
```tsx
const container = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: {
      staggerChildren: 0.1
    }
  }
};

const item = {
  hidden: { opacity: 0, y: 20 },
  show: { opacity: 1, y: 0 }
};

<motion.div variants={container} initial="hidden" animate="show">
  {items.map(item => (
    <motion.div key={item.id} variants={item}>
      {item.content}
    </motion.div>
  ))}
</motion.div>
```

---

## 🌐 i18n Patterns

### Using Translation Hook

```tsx
import { useTranslation } from 'react-i18next';

const MyComponent = () => {
  const { t, i18n } = useTranslation();
  
  return (
    <>
      <h1>{t('screen.title')}</h1>
      <p>{t('screen.description', { name: 'Player' })}</p>
      
      <button onClick={() => i18n.changeLanguage('ar')}>
        العربية
      </button>
    </>
  );
};
```

### Dynamic Keys

```tsx
const gameType = 'matching';
<h2>{t(`game.${gameType}.title`)}</h2>
```

### Pluralization

```tsx
// In translation file:
{
  "level": "مستوى",
  "level_plural": "مستويات"
}

// In component:
{t('level', { count: levelCount })}
```

---

## 🎯 Best Practices

### Component Structure

1. **Imports** - Group by type (React, libraries, local)
2. **Types/Interfaces** - Define props interface
3. **Styled Components** - Define all styled components
4. **Component** - Main functional component
5. **Exports** - Named or default export

### Performance

- Use `React.memo()` for expensive components
- Lazy load screens with `React.lazy()`
- Debounce search inputs
- Virtualize long lists
- Optimize images (SVG when possible)

### Accessibility

- Use semantic HTML
- Add ARIA labels where needed
- Ensure keyboard navigation
- Maintain focus management
- Test with screen readers

### Testing

- Write unit tests for utilities
- Component tests for UI
- Integration tests for flows
- E2E tests for critical paths

---

## 📚 Resources

- [React Documentation](https://react.dev)
- [Styled Components](https://styled-components.com)
- [Framer Motion](https://www.framer.com/motion)
- [React Router](https://reactrouter.com)
- [i18next](https://www.i18next.com)

---

Last Updated: 2024
Version: 1.0.0
