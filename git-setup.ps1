# moonbit-color 项目 Git 提交脚本（PowerShell版本）

cd D:\personal-project\MoonBit\moonbit-color
git init
git config core.hooksPath .githooks
git add .gitignore LICENSE moon.mod.json moon.pkg.json
git commit -m "Initial commit: Project setup

- Add moon.mod.json and moon.pkg.json
- Add LICENSE (Apache 2.0)
- Add .gitignore
- Setup GitHub Actions CI

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add color.mbt
git commit -m "feat: Add core color types and conversions

- Implement RGB, HSL, HSV color types
- Add RGB to/from hex conversion
- Add RGB<->HSL conversion
- Add RGB<->HSV conversion
- Handle edge cases (grayscale, black, white)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add interpolation.mbt
git commit -m "feat: Add color interpolation and gradient generation

- Implement RGB linear interpolation
- Implement HSL hue-aware interpolation
- Add gradient generation (2-color and multi-stop)
- Handle color wheel wraparound for HSL

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add contrast.mbt
git commit -m "feat: Add WCAG contrast calculations

- Implement relative luminance calculation with gamma correction
- Add WCAG contrast ratio computation
- Add WCAG AA/AAA compliance checks
- Support large text contrast checking

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add palette.mbt
git commit -m "feat: Add palette generation algorithms

- Implement complementary color generation
- Add analogous palette (adjacent colors)
- Add triadic palette (120° apart)
- Add tetradic/square palette (90° apart)
- Add monochromatic palette (varying lightness)
- Add split complementary palette

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add color_test.mbt
git commit -m "test: Add comprehensive test suite

- Add 18 unit tests covering all features
- Test color space conversions
- Test interpolation and gradients
- Test WCAG contrast calculations
- Test palette generation algorithms

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add README.md
git commit -m "docs: Add comprehensive documentation

- Add feature overview
- Add installation instructions
- Add API reference with examples
- Add use cases and project structure
- Add testing instructions

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add .github .githooks
git commit -m "ci: Setup GitHub Actions and git hooks

- Add CI workflow (check/test/build)
- Add pre-commit hook for quality checks
- Configure hooks directory

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add examples
git commit -m "docs: Add example program

- Add basic usage example
- Demonstrate color conversions
- Show gradient generation
- Show WCAG contrast checking
- Show palette generation

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git add PROPOSAL.md
git commit -m "docs: Add project proposal

- Add project description and motivation
- Add technical implementation details
- Add use cases and scenarios
- Add delivery scope and exclusions

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"

git remote add origin https://github.com/weedmind-6812/moonbit-color.git
git branch -M main
git push -u origin main

Write-Host "moonbit-color 项目完成！" -ForegroundColor Green
