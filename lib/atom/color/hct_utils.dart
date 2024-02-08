part of '../color.dart';

/// Utility Functions for HCT Colors.
extension HctUtils on Hct {
  /// Convert an ARGB color to the HCT equivalent.
  static Hct fromColor(Color color) => Hct.fromInt(color.value);

  /// Find the the Color with the closest Hue to the target color from a
  /// collection of HCT colors.
  static Hct closestHue({
    required Hct targetColor,
    required List<Hct> candidateColors,
  }) {
    // Initialize defaults.
    var closestColor = candidateColors.first;
    var closestDistance = double.infinity;

    for (var color in candidateColors) {
      // Update closestColor as required.
      var distance = targetColor.hueDifference(color);

      if (distance < closestDistance) {
        closestColor = color;
        closestDistance = distance;
      }
    }

    return closestColor;
  }

  /// Find smallest Hue difference between this color and another color.
  double hueDifference(Hct other) {
    var lineDistance = (hue - other.hue).abs();
    var loopDistance = ((360 + hue) - other.hue).abs();

    return min(lineDistance, loopDistance);
  }

  /// The ARGB [Color] equivalent of this HCT color.
  Color get asColor => Color(toInt());
}
