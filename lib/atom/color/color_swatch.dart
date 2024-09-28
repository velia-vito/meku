part of '../color.dart';

/// A Color Swatch containing 10 tones of a base color (from white to black.)
class ColorSwatch {
  MHct baseColor;

  ColorSwatch(this.baseColor);

  MHct operator [](int toneIndex) {
    if (toneIndex < 0 || toneIndex > 10) {
      throw RangeError.range(toneIndex, 0, 10, 'toneIndex', 'toneIndex must be between 0 and 10');
    }

    return baseColor.withTone(toneIndex * 10);
  }
}
