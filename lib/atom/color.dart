// Dart imports:
import 'dart:math';
import 'dart:ui' show Color;

// Package imports:
import 'package:material_color_utilities/contrast/contrast.dart';
import 'package:material_color_utilities/hct/hct.dart';

// Sub-Parts
part 'color/hct_extension.dart';

class ColorPalette {
  late final Hct surface, highlight, warning;

  ColorPalette.custom({
    required Color surface,
    required Color highlight,
    required Color warning,
  }) {
    this.surface = HctUtils.fromColor(surface);
    this.highlight = HctUtils.fromColor(highlight);
    this.warning = HctUtils.fromColor(warning);
  }

  ColorPalette.fromSeed(Color seedColor) {
    var rng = Random(seedColor.value);

    var c1 = HctUtils.fromColor(seedColor);
    var c2 = c1.withHue((c1.hue + (90 + (rng.nextDouble() * 30))) % 360);
    var c3 = c2.withHue((c2.hue + (90 + (rng.nextDouble() * 30))) % 360);

    var cc = [c1, c2, c3];

    warning = HctUtils.closestHue(
      targetColor: HctUtils.fromColor(const Color.fromARGB(255, 255, 0, 0)),
      candidateColors: cc,
    );

    cc.remove(warning);

    surface = HctUtils.closestHue(
      targetColor: HctUtils.fromColor(const Color.fromARGB(255, 0, 255, 0)),
      candidateColors: cc,
    );

    cc.remove(surface);

    highlight = cc.first;
  }

  Hct get surface0 => surface.withTone(0);

  Hct get surface10 => surface.withTone(10);

  Hct get surface20 => surface.withTone(20);

  Hct get surface30 => surface.withTone(30);

  Hct get surface40 => surface.withTone(40);

  Hct get surface50 => surface.withTone(50);

  Hct get surface60 => surface.withTone(60);

  Hct get surface70 => surface.withTone(70);

  Hct get surface80 => surface.withTone(80);

  Hct get surface90 => surface.withTone(90);

  Hct get surface100 => surface.withTone(100);

  Hct get highlight0 => highlight.withTone(0);

  Hct get highlight10 => highlight.withTone(10);

  Hct get highlight20 => highlight.withTone(20);

  Hct get highlight30 => highlight.withTone(30);

  Hct get highlight40 => highlight.withTone(40);

  Hct get highlight50 => highlight.withTone(50);

  Hct get highlight60 => highlight.withTone(60);

  Hct get highlight70 => highlight.withTone(70);

  Hct get highlight80 => highlight.withTone(80);

  Hct get highlight90 => highlight.withTone(90);

  Hct get highlight100 => highlight.withTone(100);

  Hct get warning0 => warning.withTone(0);

  Hct get warning10 => warning.withTone(10);

  Hct get warning20 => warning.withTone(20);

  Hct get warning30 => warning.withTone(30);

  Hct get warning40 => warning.withTone(40);

  Hct get warning50 => warning.withTone(50);

  Hct get warning60 => warning.withTone(60);

  Hct get warning70 => warning.withTone(70);

  Hct get warning80 => warning.withTone(80);

  Hct get warning90 => warning.withTone(90);

  Hct get warning100 => warning.withTone(100);
}
