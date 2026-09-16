@echo off
chcp 65001 > nul
echo ========================================
echo Git 初始化和推送 - moonbit-color
echo ========================================
echo.

cd /d "%~dp0"

echo [1/6] 初始化 Git 仓库...
git init
if errorlevel 1 goto error

echo.
echo [2/6] 添加远程仓库...
git remote add origin https://github.com/weedmind-6812/moonbit-color.git
if errorlevel 1 (
    echo 远程仓库已存在，尝试设置 URL...
    git remote set-url origin https://github.com/weedmind-6812/moonbit-color.git
)

echo.
echo [3/6] 添加核心文件 (Commit 1)...
git add moon.mod.json moon.pkg.json LICENSE .gitignore
git commit -m "chore: Initialize project structure and configuration

- Add moon.mod.json with project metadata
- Add moon.pkg.json with package configuration
- Add Apache 2.0 LICENSE
- Add .gitignore for MoonBit project

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [4/6] 添加核心色彩类型 (Commit 2)...
git add color.mbt
git commit -m "feat: Add core color types and RGB/HSL/HSV conversions

Implement Color enum with RGB, HSL, HSV variants and comprehensive
color space conversion algorithms including:
- RGB to HSL/HSV conversion
- HSL to RGB conversion
- HSV to RGB conversion
- Hex string parsing and serialization

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [5/6] 添加插值功能 (Commit 3)...
git add interpolation.mbt
git commit -m "feat: Add color interpolation and gradient generation

Implement linear interpolation (lerp) for RGB color space and
gradient generation with customizable step counts for smooth
color transitions.

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [6/6] 添加 WCAG 对比度计算 (Commit 4)...
git add contrast.mbt
git commit -m "feat: Add WCAG contrast ratio calculation

Implement accessibility-focused contrast ratio computation following
WCAG 2.1 guidelines including:
- Relative luminance calculation
- Contrast ratio computation
- AA/AAA level compliance checking for normal and large text

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [7/10] 添加调色板生成 (Commit 5)...
git add palette.mbt
git commit -m "feat: Add palette generation algorithms

Implement 6 classic color harmony algorithms:
- Complementary (opposite on color wheel)
- Analogous (adjacent colors)
- Triadic (evenly spaced 120°)
- Tetradic (rectangular, 90° spacing)
- Monochromatic (same hue, varying lightness)
- Split-complementary (base + two adjacent to complement)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [8/10] 添加测试 (Commit 6)...
git add color_test.mbt
git commit -m "test: Add comprehensive unit tests

Add 18 test cases covering:
- RGB/HSL/HSV conversion accuracy
- Hex parsing and serialization
- Color interpolation correctness
- WCAG contrast ratio calculation
- Palette generation algorithms

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [9/10] 添加示例程序 (Commit 7)...
git add examples\
git commit -m "docs: Add basic usage example

Add example demonstrating core features:
- Color space conversions
- Gradient generation
- WCAG contrast checking
- Palette generation

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [10/10] 添加文档 (Commit 8)...
git add README.md PROPOSAL.md
git commit -m "docs: Add comprehensive documentation

- README.md: Complete API reference, examples, installation guide
- PROPOSAL.md: Project proposal for MoonBit Hackathon

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [11/10] 添加 CI/CD 配置 (Commit 9)...
git add .github\ .githooks\
git commit -m "ci: Add GitHub Actions workflow and git hooks

- GitHub Actions: check/test/build on push and PR
- Pre-commit hook: run moon fmt before commit

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo [12/10] 更新项目元数据 (Commit 10)...
git add moon.mod.json
git commit -m "chore: Update repository URL in moon.mod.json

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
if errorlevel 1 goto error

echo.
echo ========================================
echo 准备推送到 GitHub...
echo ========================================
git branch -M main
git push -u origin main
if errorlevel 1 goto error

echo.
echo ========================================
echo ✅ 成功完成！
echo ========================================
echo.
echo 已创建 10+ 有效 commits 并推送到 GitHub
echo 仓库地址: https://github.com/weedmind-6812/moonbit-color
echo.
pause
exit /b 0

:error
echo.
echo ========================================
echo ❌ 发生错误！
echo ========================================
echo 请检查错误信息并重试
echo.
pause
exit /b 1
