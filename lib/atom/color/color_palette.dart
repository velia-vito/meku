part of '../color.dart';

/// Collection of all possible colors that may be used across a Meku App.
class ColorPalette {
  /// Colors used for surfaces/containers.
  late final ColorStrip surface;

  /// Colors used for highlights/successes.
  late final ColorStrip highlight;

  /// Colors used for errors/warnings.
  late final ColorStrip warning;

  /// Creates a color palette with specific colors.
  ColorPalette.custom({
    required Color surface,
    required Color highlight,
    required Color warning,
  }) {
    this.surface = ColorStrip(MHct.fromColor(surface));
    this.highlight = ColorStrip(MHct.fromColor(highlight));
    this.warning = ColorStrip(MHct.fromColor(warning));
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
  /// - If no target colors are specified, warning, highlight, and surface color
  /// targets are set to red, green, and blue respectively.
  ColorPalette.fromSeed(
    Color seedColor, {
    int minHueDist = 90,
    int maxHueDist = 120,
    Color warningTarget = const Color.fromARGB(255, 255, 0, 0),
    Color highlightTarget = const Color.fromARGB(255, 0, 225, 0),
    Color surfaceTarget = const Color.fromARGB(255, 0, 0, 255),
  }) {
    // Convert everything to MHct.
    var seedC = MHct.fromColor(seedColor);

    var warningT = MHct.fromColor(warningTarget);
    var highlightT = MHct.fromColor(highlightTarget);
    var surfaceT = MHct.fromColor(surfaceTarget);

    // Generate a color set such that  all hues are at least `minHueDist` apart and at most
    // `maxHueDist` apart.
    var colorSet = <MHct>[seedC];

    var randomEngine = Random(seedColor.value);
    var hueDelta = maxHueDist - minHueDist;

    do {
      var lastC = colorSet.last;
      var deltaFraction = randomEngine.nextDouble();

      colorSet.add(lastC.withHue((lastC.hue + minHueDist) + (deltaFraction * hueDelta) % 360));
    } while (colorSet.last.hueDifference(colorSet.first) >= minHueDist);

    // Find Warning Color.
    var warning = warningT.closestHue(candidateColors: colorSet);
    colorSet.remove(warning); //ignore: avoid-ignoring-return-values, return value unused
    this.warning = ColorStrip(warning);

    // Find Surface Color.
    var surface = surfaceT.closestHue(candidateColors: colorSet);
    colorSet.remove(surface); //ignore: avoid-ignoring-return-values, return value unused
    this.surface = ColorStrip(surface);

    // Find Highlight Color.
    var highlight = highlightT.closestHue(candidateColors: colorSet);
    colorSet.remove(highlight); //ignore: avoid-ignoring-return-values, return value unused
    this.highlight = ColorStrip(highlight);
  }
}
