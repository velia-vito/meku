part of '../color.dart';

extension HctUtils on Hct {
  static Hct fromColor(Color color) => Hct.fromInt(color.value);

  static Hct closestHue({
    required Hct targetColor,
    required List<Hct> candidateColors,
  }) {
    var closest = candidateColors.first;
    var closestDistance = double.infinity;

    for (var color in candidateColors) {
      var lineDistance = (targetColor.hue - color.hue).abs();
      var loopDistance = ((360 + targetColor.hue) - color.hue).abs();
      var distance = min(lineDistance, loopDistance);

      if (distance < closestDistance) {
        closest = color;
        closestDistance = distance;
      }
    }

    return closest;
  }

  Hct withTone(double newTone) => Hct.from(hue, chroma, newTone);

  Hct withChroma(double newChroma) => Hct.from(hue, newChroma, tone);

  Hct withHue(double newHue) => Hct.from(newHue, chroma, tone);

  Color get asColor => Color(toInt());
}
