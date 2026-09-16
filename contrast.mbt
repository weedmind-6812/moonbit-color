// Calculate relative luminance for WCAG contrast calculations
///|
pub fn RGB::luminance(self : RGB) -> Double {
  let r = gamma_correct(self.r)
  let g = gamma_correct(self.g)
  let b = gamma_correct(self.b)
  0.2126 * r + 0.7152 * g + 0.0722 * b
}

///|
fn gamma_correct(c : Double) -> Double {
  if c <= 0.03928 {
    c / 12.92
  } else {
    @math.pow((c + 0.055) / 1.055, 2.4)
  }
}

// Calculate WCAG contrast ratio between two colors

///|
pub fn RGB::contrast_ratio(a : RGB, b : RGB) -> Double {
  let l1 = a.luminance()
  let l2 = b.luminance()
  let lighter = l1.max(l2)
  let darker = l1.min(l2)
  (lighter + 0.05) / (darker + 0.05)
}

// Check if contrast meets WCAG AA standard (4.5:1 for normal text)

///|
pub fn RGB::meets_wcag_aa(fg : RGB, bg : RGB) -> Bool {
  RGB::contrast_ratio(fg, bg) >= 4.5
}

// Check if contrast meets WCAG AAA standard (7:1 for normal text)

///|
pub fn RGB::meets_wcag_aaa(fg : RGB, bg : RGB) -> Bool {
  RGB::contrast_ratio(fg, bg) >= 7.0
}

// Check if contrast meets WCAG AA for large text (3:1)

///|
pub fn RGB::meets_wcag_aa_large(fg : RGB, bg : RGB) -> Bool {
  RGB::contrast_ratio(fg, bg) >= 3.0
}
