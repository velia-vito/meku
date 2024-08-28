part of '../color.dart';

/// Meku Color, a wrapper around [Hct] that adds some Meku specific functionality.
class MHct {
  /// The Hct color that this class wraps.
  late final Hct _hct;

  /// Hct Saturation, ranges from 0 ~ 120.
  double get chroma => _hct.chroma;

  /// Hct Hue, ranges from 0 — 360.
  double get hue => _hct.hue;

  /// Hct Brightness, ranges from 0 — 100.
  double get tone => _hct.tone;

  /// Get the Hct equivalent of this color.
  Hct get asHct => _hct;

  /// Create a MHct color from an ARGB Color.
  MHct.fromColor(Color color) {
    _hct = Hct.fromInt(color.value);
  }

  /// Create a MHct color from an Hct color.
  MHct.fromHct(Hct hct) {
    _hct = hct;
  }

  /// Create a custom MHct color.
  MHct.from(double hue, double chroma, double tone) {
    _hct = Hct.from(hue, chroma, tone);
  }

  /// MHct color identical to this one, but with a different hue.
  MHct withHue(double newHue) {
    return MHct.from(newHue, chroma, tone);
  }

  // MHct color identical to this one, but with a different chroma.
  MHct withChroma(double newChroma) {
    return MHct.from(hue, newChroma, tone);
  }

  /// MHct color identical to this one, but with a different tone.
  MHct withTone(double newTone) {
    return MHct.from(hue, chroma, newTone);
  }

  MHct closestHue({required List<MHct> candidateColors}) {
    var closestColor = candidateColors.first;
    var closestDistance = double.infinity;

    for (var color in candidateColors) {
      var distance = hueDifference(color);

      if (distance < closestDistance) {
        closestColor = color;
        closestDistance = distance;
      }
    }

    return closestColor;
  }

  /// Find smallest Hue difference between this color and another color.
  double hueDifference(MHct other) {
    var lineDistance = (hue - other.hue).abs();
    var loopDistance = ((360 + hue) - other.hue).abs();

    return min(lineDistance, loopDistance);
  }

  /// How  this color would display in the given [ViewingConditions].
  MHct inViewingConditions(ViewingConditions vc) {
    return MHct.fromHct(_hct.inViewingConditions(vc));
  }

  /// Convert this color to an ARGB integer.
  int toInt() {
    return _hct.toInt();
  }
}
