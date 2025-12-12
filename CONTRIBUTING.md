# Contributing to Date Quest 🤝

Thank you for your interest in contributing to Date Quest! This document provides guidelines and instructions for contributing to the project.

## 🌟 Ways to Contribute

- 🐛 Report bugs
- 💡 Suggest new features
- 📝 Improve documentation
- 🎨 Design improvements
- 🌍 Add translations
- 🧪 Write tests
- 💻 Submit code changes

## 🚀 Getting Started

### Prerequisites

- Node.js 18 or higher
- npm or yarn
- Git
- Code editor (VS Code recommended)

### Setup Development Environment

1. **Fork the repository**
   ```bash
   # Click the "Fork" button on GitHub
   ```

2. **Clone your fork**
   ```bash
   git clone https://github.com/YOUR-USERNAME/date-quest-mobile.git
   cd date-quest-mobile
   ```

3. **Add upstream remote**
   ```bash
   git remote add upstream https://github.com/ORIGINAL-OWNER/date-quest-mobile.git
   ```

4. **Install dependencies**
   ```bash
   npm install
   ```

5. **Start development server**
   ```bash
   npm run dev
   ```

6. **Open in browser**
   - Navigate to `http://localhost:3000`

## 📋 Development Workflow

### Before You Start

1. **Check existing issues**
   - Look for duplicate issues
   - Comment on the issue you want to work on

2. **Create a new branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/bug-description
   ```

### While Working

1. **Follow code style**
   - Use TypeScript
   - Follow ESLint rules
   - Use styled-components for styling
   - Write clean, readable code
   - Add comments for complex logic

2. **Test your changes**
   - Test on mobile viewport
   - Test RTL languages (Arabic)
   - Test all screen sizes
   - Check accessibility

3. **Commit regularly**
   ```bash
   git add .
   git commit -m "feat: add new feature"
   ```

### Commit Message Guidelines

We follow [Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>): <subject>

<body>

<footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Code style (formatting, etc.)
- `refactor`: Code refactoring
- `perf`: Performance improvement
- `test`: Adding tests
- `chore`: Maintenance tasks

**Examples:**
```bash
feat(game): add memory game mode
fix(settings): correct language switch behavior
docs(readme): update installation instructions
style(button): improve hover animation
```

## 🎨 Code Style Guidelines

### TypeScript

```typescript
// ✅ Good
interface UserProps {
  name: string;
  age: number;
  isActive: boolean;
}

const UserCard: React.FC<UserProps> = ({ name, age, isActive }) => {
  return (
    <Card>
      <h3>{name}</h3>
      <p>Age: {age}</p>
    </Card>
  );
};

// ❌ Bad
const UserCard = (props: any) => {
  return <div>{props.name}</div>;
};
```

### Styled Components

```typescript
// ✅ Good
const Button = styled.button<{ variant?: 'primary' | 'secondary' }>`
  padding: ${({ theme }) => theme.spacing.md};
  background: ${({ variant, theme }) =>
    variant === 'secondary' ? theme.colors.secondary : theme.colors.primary};
  border-radius: ${({ theme }) => theme.borderRadius.full};
  transition: all ${({ theme }) => theme.transitions.normal};
`;

// ❌ Bad
const Button = styled.button`
  padding: 16px;
  background: #D4A574;
  border-radius: 9999px;
`;
```

### React Hooks

```typescript
// ✅ Good
const [count, setCount] = useState<number>(0);

useEffect(() => {
  // Effect logic
  return () => {
    // Cleanup
  };
}, [dependency]);

// ❌ Bad
const [count, setCount] = useState(0); // No type
useEffect(() => {
  // Effect with missing dependencies
});
```

### Imports

```typescript
// ✅ Good - Organized imports
import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import { useTranslation } from 'react-i18next';
import styled from 'styled-components';

import { Button } from '@/components/Button';
import { Card } from '@/components/Card';
import { DateCharacter } from '@/assets/icons/DateCharacter';

// ❌ Bad - Disorganized
import { Button } from '@/components/Button';
import React from 'react';
import styled from 'styled-components';
import { useNavigate } from 'react-router-dom';
```

## 📱 Mobile-First Development

### Viewport Testing

Test on these breakpoints:
- 375px (iPhone SE)
- 414px (iPhone 11 Pro Max)
- 360px (Samsung Galaxy)
- 768px (iPad)

### Touch Targets

- Minimum size: 44x44px
- Adequate spacing between targets
- Visual feedback on tap

### Performance

- Optimize images
- Lazy load components
- Minimize bundle size
- Use CSS transforms for animations

## 🌍 Adding Translations

### Adding a New Language

1. **Create translation file**
   ```bash
   src/i18n/translations/[lang-code].json
   ```

2. **Add translations**
   ```json
   {
     "app": {
       "title": "Date Quest"
     }
   }
   ```

3. **Register in config**
   ```typescript
   // src/i18n/config.ts
   import es from './translations/es.json';
   
   i18n.use(initReactI18next).init({
     resources: {
       ar: { translation: ar },
       en: { translation: en },
       es: { translation: es }, // New
     }
   });
   ```

4. **Update settings**
   ```json
   // translations/[lang].json
   "settings": {
     "languages": {
       "es": "Español"
     }
   }
   ```

### Translation Guidelines

- Keep keys consistent across languages
- Use placeholders for dynamic content
- Maintain proper grammar and context
- Test RTL languages thoroughly
- Use native speakers for review

## 🧪 Testing

### Manual Testing Checklist

- [ ] Screen renders correctly
- [ ] All interactive elements work
- [ ] Animations are smooth
- [ ] Text is readable
- [ ] RTL layout works (Arabic)
- [ ] No console errors
- [ ] Mobile viewport works
- [ ] Touch interactions work
- [ ] Back button works
- [ ] Loading states display
- [ ] Error states display

### Writing Tests (Future)

```typescript
// Component.test.tsx
import { render, screen } from '@testing-library/react';
import { Button } from './Button';

describe('Button', () => {
  it('renders with text', () => {
    render(<Button>Click me</Button>);
    expect(screen.getByText('Click me')).toBeInTheDocument();
  });

  it('calls onClick when clicked', () => {
    const onClick = jest.fn();
    render(<Button onClick={onClick}>Click</Button>);
    screen.getByText('Click').click();
    expect(onClick).toHaveBeenCalled();
  });
});
```

## 📤 Submitting Changes

### Create Pull Request

1. **Push your branch**
   ```bash
   git push origin feature/your-feature-name
   ```

2. **Create PR on GitHub**
   - Go to your fork on GitHub
   - Click "Pull Request"
   - Select your branch
   - Fill in the PR template

### PR Template

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Testing
Describe testing done

## Screenshots
Add screenshots for UI changes

## Checklist
- [ ] Code follows style guidelines
- [ ] Self-reviewed code
- [ ] Commented complex code
- [ ] Updated documentation
- [ ] No new warnings
- [ ] Tested on mobile
- [ ] Tested RTL layout
```

### Code Review Process

1. **Automated checks**
   - Linting passes
   - Type checking passes
   - Build succeeds

2. **Manual review**
   - Code quality
   - Design patterns
   - Performance
   - Accessibility

3. **Feedback**
   - Address review comments
   - Make requested changes
   - Re-request review

4. **Merge**
   - Approved by maintainer
   - Squash and merge
   - Delete branch

## 🐛 Reporting Bugs

### Before Reporting

- Search existing issues
- Test on latest version
- Reproduce consistently

### Bug Report Template

```markdown
## Bug Description
Clear description of the bug

## Steps to Reproduce
1. Go to '...'
2. Click on '...'
3. Scroll to '...'
4. See error

## Expected Behavior
What should happen

## Actual Behavior
What actually happens

## Screenshots
Add screenshots if applicable

## Environment
- Device: [e.g. iPhone 12]
- OS: [e.g. iOS 15]
- Browser: [e.g. Safari]
- Version: [e.g. 1.0.0]

## Additional Context
Any other relevant information
```

## 💡 Feature Requests

### Feature Request Template

```markdown
## Feature Description
Clear description of the feature

## Problem it Solves
What problem does this solve?

## Proposed Solution
How should it work?

## Alternatives Considered
Other solutions you've thought of

## Additional Context
Mockups, examples, etc.
```

## 📚 Resources

### Documentation
- [React Documentation](https://react.dev)
- [TypeScript Handbook](https://www.typescriptlang.org/docs/)
- [Styled Components](https://styled-components.com)
- [Framer Motion](https://www.framer.com/motion/)

### Design Resources
- [Material Design](https://material.io)
- [Apple HIG](https://developer.apple.com/design/)
- [Color Palette Tools](https://coolors.co)

### Arabic Typography
- [Google Fonts Arabic](https://fonts.google.com/?subset=arabic)
- [Arabic Typography Guidelines](https://www.arabictypography.com)

## 🎓 Learning Resources

### For Beginners
- [React Tutorial](https://react.dev/learn)
- [TypeScript for Beginners](https://www.typescriptlang.org/docs/handbook/typescript-from-scratch.html)
- [Git Basics](https://git-scm.com/book/en/v2/Getting-Started-Git-Basics)

### For Advanced
- [React Patterns](https://reactpatterns.com)
- [TypeScript Advanced Types](https://www.typescriptlang.org/docs/handbook/advanced-types.html)
- [Performance Optimization](https://react.dev/learn/render-and-commit)

## 🤔 Questions?

- Open an issue with the `question` label
- Join our Discord (if available)
- Email maintainers

## 📜 Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of:
- Age
- Body size
- Disability
- Ethnicity
- Gender identity
- Level of experience
- Nationality
- Personal appearance
- Race
- Religion
- Sexual identity and orientation

### Our Standards

**Positive behavior:**
- Using welcoming language
- Being respectful
- Accepting constructive criticism
- Focusing on what's best for the community
- Showing empathy

**Unacceptable behavior:**
- Trolling or insulting comments
- Public or private harassment
- Publishing others' private information
- Other unprofessional conduct

### Enforcement

Violations can be reported to maintainers. All complaints will be reviewed and investigated.

## 🎉 Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Given appropriate credit

## 📄 License

By contributing, you agree that your contributions will be licensed under the project's license.

---

Thank you for contributing to Date Quest! 🌴

Every contribution, no matter how small, makes a difference.

Happy coding! 💻✨
