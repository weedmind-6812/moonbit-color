// RGB color representation with floating-point components (0.0-1.0)
///|
pub struct RGB {
  r : Double
  g : Double
  b : Double
}

// HSL color representation (Hue: 0-360, Saturation: 0-1, Lightness: 0-1)

///|
pub struct HSL {
  h : Double
  s : Double
  l : Double
}

///|
pub fn HSL::new(h : Double, s : Double, l : Double) -> HSL {
  { h, s, l }
}

// HSV color representation (Hue: 0-360, Saturation: 0-1, Value: 0-1)

///|
pub struct HSV {
  h : Double
  s : Double
  v : Double
}

///|
pub fn HSV::new(h : Double, s : Double, v : Double) -> HSV {
  { h, s, v }
}

// Create RGB from 0-255 integer values

///|
pub fn RGB::from_int(r : Int, g : Int, b : Int) -> RGB {
  {
    r: r.to_double() / 255.0,
    g: g.to_double() / 255.0,
    b: b.to_double() / 255.0,
  }
}

// Create RGB from hex string (e.g., "#FF5733" or "FF5733")

///|
pub fn RGB::from_hex(hex : String) -> RGB {
  let h = if hex.has_prefix("#") { hex[1:].to_owned() } else { hex }
  let r = parse_hex_pair(h[0:2].to_owned())
  let g = parse_hex_pair(h[2:4].to_owned())
  let b = parse_hex_pair(h[4:6].to_owned())
  RGB::from_int(r, g, b)
}

///|
fn parse_hex_pair(s : String) -> Int {
  let c1 = hex_char_to_int(s[0].to_int().unsafe_to_char())
  let c2 = hex_char_to_int(s[1].to_int().unsafe_to_char())
  c1 * 16 + c2
}

///|
fn hex_char_to_int(c : Char) -> Int {
  match c {
    '0' => 0
    '1' => 1
    '2' => 2
    '3' => 3
    '4' => 4
    '5' => 5
    '6' => 6
    '7' => 7
    '8' => 8
    '9' => 9
    'a' | 'A' => 10
    'b' | 'B' => 11
    'c' | 'C' => 12
    'd' | 'D' => 13
    'e' | 'E' => 14
    'f' | 'F' => 15
    _ => 0
  }
}

// Convert RGB to hex string

///|
pub fn RGB::to_hex(self : RGB) -> String {
  let r = (self.r * 255.0).to_int()
  let g = (self.g * 255.0).to_int()
  let b = (self.b * 255.0).to_int()
  "#" + int_to_hex(r) + int_to_hex(g) + int_to_hex(b)
}

///|
fn int_to_hex(n : Int) -> String {
  let h1 = n / 16
  let h2 = n % 16
  String::from_array([hex_digit(h1), hex_digit(h2)])
}

///|
fn hex_digit(n : Int) -> Char {
  match n {
    0 => '0'
    1 => '1'
    2 => '2'
    3 => '3'
    4 => '4'
    5 => '5'
    6 => '6'
    7 => '7'
    8 => '8'
    9 => '9'
    10 => 'A'
    11 => 'B'
    12 => 'C'
    13 => 'D'
    14 => 'E'
    15 => 'F'
    _ => '0'
  }
}

// Convert RGB to HSL

///|
pub fn RGB::to_hsl(self : RGB) -> HSL {
  let r = self.r
  let g = self.g
  let b = self.b
  let max = r.max(g.max(b))
  let min = r.min(g.min(b))
  let delta = max - min

  let l = (max + min) / 2.0

  if delta == 0.0 {
    return { h: 0.0, s: 0.0, l }
  }

  let s = if l < 0.5 { delta / (max + min) } else { delta / (2.0 - max - min) }

  let h = if r == max {
    ((g - b) / delta + (if g < b { 6.0 } else { 0.0 })) * 60.0
  } else if g == max {
    ((b - r) / delta + 2.0) * 60.0
  } else {
    ((r - g) / delta + 4.0) * 60.0
  }

  { h, s, l }
}

// Convert HSL to RGB

///|
pub fn HSL::to_rgb(self : HSL) -> RGB {
  let h = self.h
  let s = self.s
  let l = self.l

  if s == 0.0 {
    return { r: l, g: l, b: l }
  }

  let q = if l < 0.5 { l * (1.0 + s) } else { l + s - l * s }
  let p = 2.0 * l - q

  let r = hue_to_rgb(p, q, h + 120.0)
  let g = hue_to_rgb(p, q, h)
  let b = hue_to_rgb(p, q, h - 120.0)

  { r, g, b }
}

///|
fn hue_to_rgb(p : Double, q : Double, t : Double) -> Double {
  let mut t = t
  if t < 0.0 {
    t = t + 360.0
  }
  if t > 360.0 {
    t = t - 360.0
  }

  if t < 60.0 {
    return p + (q - p) * t / 60.0
  }
  if t < 180.0 {
    return q
  }
  if t < 240.0 {
    return p + (q - p) * (240.0 - t) / 60.0
  }
  p
}

// Convert RGB to HSV

///|
pub fn RGB::to_hsv(self : RGB) -> HSV {
  let r = self.r
  let g = self.g
  let b = self.b
  let max = r.max(g.max(b))
  let min = r.min(g.min(b))
  let delta = max - min

  let v = max
  let s = if max == 0.0 { 0.0 } else { delta / max }

  if delta == 0.0 {
    return { h: 0.0, s: 0.0, v }
  }

  let h = if r == max {
    ((g - b) / delta + (if g < b { 6.0 } else { 0.0 })) * 60.0
  } else if g == max {
    ((b - r) / delta + 2.0) * 60.0
  } else {
    ((r - g) / delta + 4.0) * 60.0
  }

  { h, s, v }
}

// Convert HSV to RGB

///|
pub fn HSV::to_rgb(self : HSV) -> RGB {
  let h = self.h
  let s = self.s
  let v = self.v

  if s == 0.0 {
    return { r: v, g: v, b: v }
  }

  let h_i = (h / 60.0).to_int() % 6
  let f = h / 60.0 - h_i.to_double()
  let p = v * (1.0 - s)
  let q = v * (1.0 - f * s)
  let t = v * (1.0 - (1.0 - f) * s)

  match h_i {
    0 => { r: v, g: t, b: p }
    1 => { r: q, g: v, b: p }
    2 => { r: p, g: v, b: t }
    3 => { r: p, g: q, b: v }
    4 => { r: t, g: p, b: v }
    _ => { r: v, g: p, b: q }
  }
}
