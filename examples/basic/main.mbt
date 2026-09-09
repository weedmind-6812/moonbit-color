fn main {
  println("=== MoonBit Color Library Demo ===\n")

  // Basic color creation
  println("1. Color Creation:")
  let orange = @color.RGB::from_int(255, 165, 0)
  println("  Orange RGB: " + orange.to_hex())

  let blue = @color.RGB::from_hex("#0080FF")
  println("  Blue from hex: " + blue.to_hex())

  // Color space conversions
  println("\n2. Color Space Conversions:")
  let red = @color.RGB::from_int(255, 87, 51)
  let hsl = red.to_hsl()
  println("  RGB to HSL - H: " + hsl.h.to_string() + " S: " + hsl.s.to_string() + " L: " + hsl.l.to_string())

  let hsv = red.to_hsv()
  println("  RGB to HSV - H: " + hsv.h.to_string() + " S: " + hsv.s.to_string() + " V: " + hsv.v.to_string())

  // Color interpolation
  println("\n3. Color Interpolation:")
  let color1 = @color.RGB::from_int(255, 0, 0)
  let color2 = @color.RGB::from_int(0, 0, 255)
  let mid = @color.RGB::lerp(color1, color2, 0.5)
  println("  Red to Blue (50%): " + mid.to_hex())

  // Gradient
  println("\n4. Gradient Generation:")
  let gradient = @color.RGB::gradient(color1, color2, 5)
  println("  5-step gradient:")
  for i = 0; i < gradient.length(); i = i + 1 {
    println("    Step " + i.to_string() + ": " + gradient[i].to_hex())
  }

  // WCAG contrast
  println("\n5. WCAG Contrast Check:")
  let white = @color.RGB::from_int(255, 255, 255)
  let black = @color.RGB::from_int(0, 0, 0)
  let ratio = @color.RGB::contrast_ratio(white, black)
  println("  White vs Black contrast: " + ratio.to_string() + ":1")
  println("  Meets WCAG AA: " + @color.RGB::meets_wcag_aa(white, black).to_string())
  println("  Meets WCAG AAA: " + @color.RGB::meets_wcag_aaa(white, black).to_string())

  // Palette generation
  println("\n6. Palette Generation:")
  let base = @color.RGB::from_int(255, 100, 50)
  println("  Base color: " + base.to_hex())

  let comp = base.complementary()
  println("  Complementary: " + comp.to_hex())

  println("  Triadic palette:")
  let triadic = base.triadic()
  for i = 0; i < triadic.length(); i = i + 1 {
    println("    " + triadic[i].to_hex())
  }

  println("\n  Analogous palette (5 colors):")
  let analogous = base.analogous(5)
  for i = 0; i < analogous.length(); i = i + 1 {
    println("    " + analogous[i].to_hex())
  }

  println("\n  Monochromatic palette:")
  let mono = base.monochromatic(5)
  for i = 0; i < mono.length(); i = i + 1 {
    println("    " + mono[i].to_hex())
  }

  println("\n=== Demo Complete ===")
}
