test "RGB from_int and to_hex" {
  let color = RGB::from_int(255, 87, 51)
  assert_eq!(color.to_hex(), "#FF5733")
}

test "RGB from_hex" {
  let color = RGB::from_hex("#FF5733")
  assert_eq!(color.r > 0.99, true)
  assert_eq!(color.g > 0.33 && color.g < 0.35, true)
  assert_eq!(color.b > 0.19 && color.b < 0.21, true)
}

test "RGB to HSL conversion" {
  let rgb = RGB::from_int(255, 87, 51)
  let hsl = rgb.to_hsl()
  assert_eq!(hsl.h > 10.0 && hsl.h < 12.0, true)
  assert_eq!(hsl.s > 0.99, true)
  assert_eq!(hsl.l > 0.59 && hsl.l < 0.61, true)
}

test "HSL to RGB conversion" {
  let hsl = { h: 11.0, s: 1.0, l: 0.6 }
  let rgb = hsl.to_rgb()
  assert_eq!(rgb.r > 0.99, true)
}

test "RGB to HSV conversion" {
  let rgb = RGB::from_int(255, 87, 51)
  let hsv = rgb.to_hsv()
  assert_eq!(hsv.h > 10.0 && hsv.h < 12.0, true)
  assert_eq!(hsv.s > 0.79 && hsv.s < 0.81, true)
  assert_eq!(hsv.v > 0.99, true)
}

test "HSV to RGB conversion" {
  let hsv = { h: 11.0, s: 0.8, v: 1.0 }
  let rgb = hsv.to_rgb()
  assert_eq!(rgb.r > 0.99, true)
}

test "RGB lerp" {
  let red = RGB::from_int(255, 0, 0)
  let blue = RGB::from_int(0, 0, 255)
  let mid = RGB::lerp(red, blue, 0.5)
  assert_eq!(mid.r > 0.49 && mid.r < 0.51, true)
  assert_eq!(mid.g < 0.01, true)
  assert_eq!(mid.b > 0.49 && mid.b < 0.51, true)
}

test "RGB gradient" {
  let red = RGB::from_int(255, 0, 0)
  let blue = RGB::from_int(0, 0, 255)
  let gradient = RGB::gradient(red, blue, 5)
  assert_eq!(gradient.length(), 5)
  assert_eq!(gradient[0].r > 0.99, true)
  assert_eq!(gradient[4].b > 0.99, true)
}

test "Luminance calculation" {
  let white = RGB::from_int(255, 255, 255)
  let black = RGB::from_int(0, 0, 0)
  assert_eq!(white.luminance() > 0.99, true)
  assert_eq!(black.luminance() < 0.01, true)
}

test "Contrast ratio" {
  let white = RGB::from_int(255, 255, 255)
  let black = RGB::from_int(0, 0, 0)
  let ratio = RGB::contrast_ratio(white, black)
  assert_eq!(ratio > 20.0, true)
}

test "WCAG AA compliance" {
  let white = RGB::from_int(255, 255, 255)
  let black = RGB::from_int(0, 0, 0)
  assert_eq!(RGB::meets_wcag_aa(white, black), true)
  assert_eq!(RGB::meets_wcag_aaa(white, black), true)
}

test "Complementary color" {
  let red = RGB::from_int(255, 0, 0)
  let comp = red.complementary()
  let hsl = comp.to_hsl()
  assert_eq!(hsl.h > 179.0 && hsl.h < 181.0, true)
}

test "Triadic palette" {
  let red = RGB::from_int(255, 0, 0)
  let triadic = red.triadic()
  assert_eq!(triadic.length(), 3)
}

test "Analogous palette" {
  let red = RGB::from_int(255, 0, 0)
  let analogous = red.analogous(5)
  assert_eq!(analogous.length(), 5)
}

test "Monochromatic palette" {
  let blue = RGB::from_int(0, 100, 200)
  let mono = blue.monochromatic(5)
  assert_eq!(mono.length(), 5)
}

test "Tetradic palette" {
  let color = RGB::from_int(100, 150, 200)
  let tetradic = color.tetradic()
  assert_eq!(tetradic.length(), 4)
}

test "Split complementary palette" {
  let color = RGB::from_int(100, 150, 200)
  let split = color.split_complementary()
  assert_eq!(split.length(), 3)
}

test "Multi-gradient" {
  let colors = [
    RGB::from_int(255, 0, 0),
    RGB::from_int(0, 255, 0),
    RGB::from_int(0, 0, 255)
  ]
  let gradient = RGB::multi_gradient(colors, 10)
  assert_eq!(gradient.length() >= 10, true)
}
