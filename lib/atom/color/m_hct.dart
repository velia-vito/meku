part of '../color.dart';

/// Meku Hct, a wrapper around [Hct] that adds some Meku specific functionality.
class MHct implements Hct {
  /// The function that this color performs.
  late final ColorRole colorRole;

  /// The Hct color that this class wraps.
  late final Hct _hct;

  /// Hct Saturation, ranges from 0 ~ 120.
  @override
  double get chroma => _hct.chroma;

  /// Hct Hue, ranges from 0 — 360.
  @override
  double get hue => _hct.hue;

  /// Hct Brightness, ranges from 0 — 100.
  @override
  double get tone => _hct.tone;

  /// An exact identifier for the color.
  ColorCode get colorCode => _roleToCode[colorRole]![tone.toInt()]!;

  /// Get a color that satisfies W3 Contrast Guidelines (3:1).
  ///
  /// ### Note
  ///
  /// | OG TONE  | 00  | 10  | 20  | 30  | 40  | 50  | 60  | 70  | 80  | 90  | 100 |
  /// | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
  /// | NEW TONE | 30  | 40  | 50  | 00  | 10  | 20  | 30  | 50  | 60  | 70  | 80  |
  MHct get smallContrast => tone <= 20
      ? MHct.fromHct(_hct.withTone(_hct.tone + 30), colorRole)
      : MHct.fromHct(_hct.withTone(_hct.tone - 30), colorRole);

  /// Get a color that satisfies W3 Contrast Guidelines (4.5:1).
  ///
  /// ### Note
  ///
  /// | OG TONE  | 00  | 10  | 20  | 30  | 40  | 50  | 60  | 70  | 80  | 90  | 100 |
  /// | -------- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
  /// | NEW TONE | 50  | 60  | 70  | 80  | 90  | 00  | 10  | 20  | 30  | 40  | 50  |
  MHct get bigContrast => tone <= 40
      ? MHct.fromHct(_hct.withTone(_hct.tone + 50), colorRole)
      : MHct.fromHct(_hct.withTone(_hct.tone - 50), colorRole);

  @override
  set chroma(double newChroma) => throw UnimplementedError(
        'Chroma cannot be set, try using `Hct` instead.',
      );

  @override
  set hue(double newHue) => throw UnimplementedError(
        'Hue cannot be set, try using `Hct` instead.',
      );

  @override
  set tone(double newTone) => throw UnimplementedError(
        'Tone cannot be set, try using `Hct` instead.',
      );

  /// Create a MHct color from an ARGB Color.
  MHct.fromColor(Color color, ColorRole role) {
    _hct = Hct.fromInt(color.value);

    _hct.tone = _hct.tone ~/ 10 as double;

    role = role;
  }

  /// Create a MHct color from an Hct color.
  MHct.fromHct(Hct hct, ColorRole role) {
    _hct = hct;

    _hct.tone = _hct.tone ~/ 10 as double;
    role = role;
  }

  /// Create a custom MHct color.
  MHct.from(double hue, double chroma, double tone, ColorRole role) {
    _hct = Hct.from(hue, chroma, tone ~/ 10 as double);

    role = role;
  }

  @override
  Hct inViewingConditions(ViewingConditions vc) {
    return _hct.inViewingConditions(vc);
  }

  @override
  int toInt() {
    return _hct.toInt();
  }
}
