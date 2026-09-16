// Linear interpolation between two RGB colors
///|
pub fn RGB::lerp(a : RGB, b : RGB, t : Double) -> RGB {
  {
    r: a.r + (b.r - a.r) * t,
    g: a.g + (b.g - a.g) * t,
    b: a.b + (b.b - a.b) * t,
  }
}

// Linear interpolation between two HSL colors

///|
pub fn HSL::lerp(a : HSL, b : HSL, t : Double) -> HSL {
  let h = lerp_hue(a.h, b.h, t)
  { h, s: a.s + (b.s - a.s) * t, l: a.l + (b.l - a.l) * t }
}

// Interpolate hue taking shortest path around color wheel

///|
fn lerp_hue(h1 : Double, h2 : Double, t : Double) -> Double {
  let diff = h2 - h1
  let adjusted_diff = if diff > 180.0 {
    diff - 360.0
  } else if diff < -180.0 {
    diff + 360.0
  } else {
    diff
  }

  let result = h1 + adjusted_diff * t
  if result < 0.0 {
    result + 360.0
  } else if result >= 360.0 {
    result - 360.0
  } else {
    result
  }
}

// Generate a gradient of n colors between start and end

///|
pub fn RGB::gradient(start : RGB, end : RGB, steps : Int) -> Array[RGB] {
  let result = Array::new()
  for i in 0..<steps {
    let t = i.to_double() / (steps - 1).to_double()
    result.push(RGB::lerp(start, end, t))
  }
  result
}

// Generate a multi-stop gradient

///|
pub fn RGB::multi_gradient(colors : Array[RGB], steps : Int) -> Array[RGB] {
  if colors.length() < 2 {
    return colors
  }

  let result = Array::new()
  let segments = colors.length() - 1
  let steps_per_segment = steps / segments

  for i in 0..<segments {
    let start = colors[i]
    let end = colors[i + 1]

    for j in 0..<steps_per_segment {
      let t = j.to_double() / steps_per_segment.to_double()
      result.push(RGB::lerp(start, end, t))
    }
  }

  result.push(colors[colors.length() - 1])
  result
}
