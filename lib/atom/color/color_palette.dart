part of '../color.dart';

/// Collection of all possible colors that may be used across a Meku App.
class ColorPalette {
  /// Colors used for surfaces/containers.
  late final Hct surface;

  /// Colors used for highlights/successes.
  late final Hct highlight;

  /// Colors used for errors/warnings.
  late final Hct warning;

  /// Surface color with 0% tone.
  Hct get surface0 => surface.withTone(0);

  /// Surface color with 10% tone.
  Hct get surface10 => surface.withTone(10);

  /// Surface color with 20% tone.
  Hct get surface20 => surface.withTone(20);

  /// Surface color with 30% tone.
  Hct get surface30 => surface.withTone(30);

  /// Surface color with 40% tone.
  Hct get surface40 => surface.withTone(40);

  /// Surface color with 50% tone.
  Hct get surface50 => surface.withTone(50);

  /// Surface color with 60% tone.
  Hct get surface60 => surface.withTone(60);

  /// Surface color with 70% tone.
  Hct get surface70 => surface.withTone(70);

  /// Surface color with 80% tone.
  Hct get surface80 => surface.withTone(80);

  /// Surface color with 90% tone.
  Hct get surface90 => surface.withTone(90);

  /// Surface color with 100% tone.
  Hct get surface100 => surface.withTone(100);

  /// Highlight color with 0% tone.
  Hct get highlight0 => highlight.withTone(0);

  /// Highlight color with 10% tone.
  Hct get highlight10 => highlight.withTone(10);

  /// Highlight color with 20% tone.
  Hct get highlight20 => highlight.withTone(20);

  /// Highlight color with 30% tone.
  Hct get highlight30 => highlight.withTone(30);

  /// Highlight color with 40% tone.
  Hct get highlight40 => highlight.withTone(40);

  /// Highlight color with 50% tone.
  Hct get highlight50 => highlight.withTone(50);

  /// Highlight color with 60% tone.
  Hct get highlight60 => highlight.withTone(60);

  /// Highlight color with 70% tone.
  Hct get highlight70 => highlight.withTone(70);

  /// Highlight color with 80% tone.
  Hct get highlight80 => highlight.withTone(80);

  /// Highlight color with 90% tone.
  Hct get highlight90 => highlight.withTone(90);

  /// Highlight color with 100% tone.
  Hct get highlight100 => highlight.withTone(100);

  /// Warning color with 0% tone.
  Hct get warning0 => warning.withTone(0);

  /// Warning color with 10% tone.
  Hct get warning10 => warning.withTone(10);

  /// Warning color with 20% tone.
  Hct get warning20 => warning.withTone(20);

  /// Warning color with 30% tone.
  Hct get warning30 => warning.withTone(30);

  /// Warning color with 40% tone.
  Hct get warning40 => warning.withTone(40);

  /// Warning color with 50% tone.
  Hct get warning50 => warning.withTone(50);

  /// Warning color with 60% tone.
  Hct get warning60 => warning.withTone(60);

  /// Warning color with 70% tone.
  Hct get warning70 => warning.withTone(70);

  /// Warning color with 80% tone.
  Hct get warning80 => warning.withTone(80);

  /// Warning color with 90% tone.
  Hct get warning90 => warning.withTone(90);

  /// Warning color with 100% tone.
  Hct get warning100 => warning.withTone(100);

  /// Creates a color palette with specific colors.
  ColorPalette.custom({
    required Color surface,
    required Color highlight,
    required Color warning,
  }) {
    this.surface = HctUtils.fromColor(surface);
    this.highlight = HctUtils.fromColor(highlight);
    this.warning = HctUtils.fromColor(warning);
  }

  /// Generate a color palette from a seed color.
  ///
  /// ### Args
  /// - `minHueDist`, `maxHueDist`:Minimum/Maximum distance between any two
  /// color palette hues in deg.
  ///
  /// - `warningTarget`, `surfaceTarget`, and `highlightTarget`: Target colors
  /// for warning/surface/highlight colors (see Note).
  ///
  /// ### Note
  /// - If target colors are specified, the closest color to the target is used
  /// for the corresponding color-function.
  ///
  /// - If no target colors are specified, warning, surface and highlight color
  /// targets are set to red, blue and green respectively.
  ColorPalette.fromSeed(
    Color seedColor, {
    int minHueDist = 90,
    int maxHueDist = 120,
    Hct? warningTarget,
    Hct? surfaceTarget,
    Hct? highlightTarget,
  }) {
    var rng = Random(seedColor.value);

    var cc = <Hct>[HctUtils.fromColor(seedColor)];
    var hueDiff = maxHueDist - minHueDist;

    while (true) {
      var lstC = cc.last;
      var randWeight = rng.nextDouble();
      cc.add(
        lstC.withHue((lstC.hue + (minHueDist + (randWeight * hueDiff))) % 360),
      );

      if (cc.last.hueDifference(cc.first) < minHueDist) {
        break;
      }
    }

    warning = HctUtils.closestHue(
      targetColor: warningTarget ?? HctUtils.fromColor(const Color.fromARGB(255, 255, 0, 0)),
      candidateColors: cc,
    );

    var _ = cc.remove(warning);

    surface = HctUtils.closestHue(
      targetColor: surfaceTarget ?? HctUtils.fromColor(const Color.fromARGB(255, 0, 0, 255)),
      candidateColors: cc,
    );

    _ = cc.remove(surface);

    highlight = HctUtils.closestHue(
      targetColor: highlightTarget ?? HctUtils.fromColor(const Color.fromARGB(255, 0, 255, 0)),
      candidateColors: cc,
    );
  }
}
