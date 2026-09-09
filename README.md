# moonbit-color

**Comprehensive color manipulation library for MoonBit**

[![CI](https://github.com/weedmind-6812/moonbit-color/actions/workflows/ci.yml/badge.svg)](https://github.com/weedmind-6812/moonbit-color/actions)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

A feature-rich color processing library for the MoonBit ecosystem, providing color space conversions, interpolation, WCAG contrast calculations, and palette generation.

*2026 MoonBit September Hackathon Entry*

## Features

### Color Spaces
- **RGB** - Red, Green, Blue (0.0-1.0 or 0-255)
- **HSL** - Hue, Saturation, Lightness
- **HSV** - Hue, Saturation, Value
- **Hex** - Hexadecimal color strings (#RRGGBB)

### Core Capabilities
- ✅ Color space conversions (RGB ↔ HSL ↔ HSV ↔ Hex)
- ✅ Color interpolation (linear, hue-aware)
- ✅ Gradient generation (2-color and multi-stop)
- ✅ WCAG 2.1 contrast ratio calculation
- ✅ Accessibility compliance checking (AA/AAA)
- ✅ Palette generation (analogous, complementary, triadic, tetradic, monochromatic, split-complementary)

## Installation

```bash
moon add weedmind-6812/moonbit-color
```

## Quick Start

### Basic Color Creation

```moonbit
// From RGB integers (0-255)
let orange = @color.RGB::from_int(255, 165, 0)

// From hex string
let blue = @color.RGB::from_hex("#0080FF")

// Convert to hex
println(orange.to_hex())  // "#FFA500"
```

### Color Space Conversions

```moonbit
let rgb = @color.RGB::from_int(255, 87, 51)

// RGB to HSL
let hsl = rgb.to_hsl()
println("H: " + hsl.h.to_string())  // Hue: 0-360

// HSL back to RGB
let rgb2 = hsl.to_rgb()

// RGB to HSV
let hsv = rgb.to_hsv()
```

### Color Interpolation

```moonbit
let red = @color.RGB::from_int(255, 0, 0)
let blue = @color.RGB::from_int(0, 0, 255)

// Linear interpolation
let purple = @color.RGB::lerp(red, blue, 0.5)

// Generate gradient
let gradient = @color.RGB::gradient(red, blue, 10)
for i = 0; i < gradient.length(); i = i + 1 {
  println(gradient[i].to_hex())
}

// Multi-stop gradient
let rainbow = @color.RGB::multi_gradient([
  @color.RGB::from_hex("#FF0000"),
  @color.RGB::from_hex("#00FF00"),
  @color.RGB::from_hex("#0000FF")
], 20)
```

### WCAG Contrast Checking

```moonbit
let white = @color.RGB::from_int(255, 255, 255)
let black = @color.RGB::from_int(0, 0, 0)

// Calculate contrast ratio
let ratio = @color.RGB::contrast_ratio(white, black)
println("Contrast: " + ratio.to_string() + ":1")  // ~21:1

// Check WCAG compliance
if @color.RGB::meets_wcag_aa(white, black) {
  println("Passes WCAG AA (4.5:1)")
}

if @color.RGB::meets_wcag_aaa(white, black) {
  println("Passes WCAG AAA (7:1)")
}
```

### Palette Generation

```moonbit
let base = @color.RGB::from_int(255, 100, 50)

// Complementary color (opposite on color wheel)
let comp = base.complementary()

// Analogous palette (adjacent colors)
let analogous = base.analogous(5)

// Triadic palette (120° apart)
let triadic = base.triadic()

// Tetradic/square palette (90° apart)
let tetradic = base.tetradic()

// Monochromatic (same hue, varying lightness)
let mono = base.monochromatic(7)

// Split complementary
let split = base.split_complementary()
```

## API Reference

### RGB

| Method | Description |
|--------|-------------|
| `RGB::from_int(r, g, b)` | Create from 0-255 integers |
| `RGB::from_hex(hex)` | Parse hex string (#RRGGBB) |
| `to_hex()` | Convert to hex string |
| `to_hsl()` | Convert to HSL |
| `to_hsv()` | Convert to HSV |
| `lerp(a, b, t)` | Linear interpolation |
| `gradient(start, end, steps)` | Generate gradient |
| `multi_gradient(colors, steps)` | Multi-stop gradient |
| `luminance()` | Calculate relative luminance |
| `contrast_ratio(a, b)` | WCAG contrast ratio |
| `meets_wcag_aa(fg, bg)` | Check AA compliance (4.5:1) |
| `meets_wcag_aaa(fg, bg)` | Check AAA compliance (7:1) |
| `complementary()` | Generate complement |
| `analogous(count)` | Analogous palette |
| `triadic()` | Triadic palette |
| `tetradic()` | Tetradic palette |
| `monochromatic(count)` | Monochromatic palette |
| `split_complementary()` | Split complementary |

### HSL / HSV

| Method | Description |
|--------|-------------|
| `HSL::to_rgb()` | Convert to RGB |
| `HSV::to_rgb()` | Convert to RGB |
| `HSL::lerp(a, b, t)` | Interpolate in HSL space |

## Use Cases

- **Data Visualization** - Generate color scales for charts and graphs
- **UI Design** - Create harmonious color palettes
- **Accessibility** - Ensure sufficient contrast for readability
- **Image Processing** - Color space transformations
- **Generative Art** - Procedural color generation
- **Theme Systems** - Build adaptive color schemes

## Project Structure

```
moonbit-color/
├── color.mbt              # Core types & conversions
├── interpolation.mbt      # Color interpolation & gradients
├── contrast.mbt           # WCAG contrast calculations
├── palette.mbt            # Palette generation algorithms
├── color_test.mbt         # 18 unit tests
├── moon.mod.json          # Package metadata
├── moon.pkg.json          # Package config
└── README.md
```

## Testing

```bash
moon test    # Run 18 unit tests
moon check   # Type check
moon build   # Compile
```

All tests pass and cover:
- RGB/HSL/HSV conversions
- Hex parsing and formatting
- Color interpolation
- Gradient generation
- Luminance calculation
- Contrast ratio computation
- WCAG compliance checking
- All palette generation modes

## References

**Color Theory & Algorithms:**
- W3C WCAG 2.1 Contrast Guidelines - https://www.w3.org/WAI/WCAG21/Understanding/contrast-minimum.html
- HSL/HSV conversion algorithms - https://en.wikipedia.org/wiki/HSL_and_HSV
- Color harmony theory - https://www.tigercolor.com/color-lab/color-theory/color-harmonies.htm

**Inspired by:**
- chroma.js - https://gka.github.io/chroma.js/ (BSD-3-Clause)
- colord - https://github.com/omgovich/colord (MIT)

All algorithms re-implemented from scratch in idiomatic MoonBit. No code was copied; only mathematical formulations and color theory principles were referenced.

## License

Apache License 2.0 - See [LICENSE](LICENSE)

## Author

Kai-Junhan - 2026 MoonBit September Hackathon

---

<div align="center">

**Built for the 2026 MoonBit Open Source Ecosystem Competition**

</div>
