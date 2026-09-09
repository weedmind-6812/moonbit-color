// Generate an analogous color palette (colors adjacent on color wheel)
pub fn RGB::analogous(self : RGB, count : Int) -> Array[RGB] {
  let hsl = self.to_hsl()
  let result = Array::new()
  let step = 30.0

  for i = 0; i < count; i = i + 1 {
    let offset = (i - count / 2).to_double() * step
    let h = (hsl.h + offset + 360.0) % 360.0
    result.push(HSL::to_rgb({ h, s: hsl.s, l: hsl.l }))
  }

  result
}

// Generate a complementary color (opposite on color wheel)
pub fn RGB::complementary(self : RGB) -> RGB {
  let hsl = self.to_hsl()
  let h = (hsl.h + 180.0) % 360.0
  HSL::to_rgb({ h, s: hsl.s, l: hsl.l })
}

// Generate a triadic color palette (120° apart)
pub fn RGB::triadic(self : RGB) -> Array[RGB] {
  let hsl = self.to_hsl()
  [
    self,
    HSL::to_rgb({ h: (hsl.h + 120.0) % 360.0, s: hsl.s, l: hsl.l }),
    HSL::to_rgb({ h: (hsl.h + 240.0) % 360.0, s: hsl.s, l: hsl.l })
  ]
}

// Generate a tetradic (square) color palette (90° apart)
pub fn RGB::tetradic(self : RGB) -> Array[RGB] {
  let hsl = self.to_hsl()
  [
    self,
    HSL::to_rgb({ h: (hsl.h + 90.0) % 360.0, s: hsl.s, l: hsl.l }),
    HSL::to_rgb({ h: (hsl.h + 180.0) % 360.0, s: hsl.s, l: hsl.l }),
    HSL::to_rgb({ h: (hsl.h + 270.0) % 360.0, s: hsl.s, l: hsl.l })
  ]
}

// Generate monochromatic palette (same hue, varying lightness)
pub fn RGB::monochromatic(self : RGB, count : Int) -> Array[RGB] {
  let hsl = self.to_hsl()
  let result = Array::new()

  for i = 0; i < count; i = i + 1 {
    let l = 0.2 + (i.to_double() / (count - 1).to_double()) * 0.6
    result.push(HSL::to_rgb({ h: hsl.h, s: hsl.s, l }))
  }

  result
}

// Generate split complementary palette
pub fn RGB::split_complementary(self : RGB) -> Array[RGB] {
  let hsl = self.to_hsl()
  [
    self,
    HSL::to_rgb({ h: (hsl.h + 150.0) % 360.0, s: hsl.s, l: hsl.l }),
    HSL::to_rgb({ h: (hsl.h + 210.0) % 360.0, s: hsl.s, l: hsl.l })
  ]
}
