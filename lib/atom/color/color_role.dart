part of '../color.dart';

/// The major roles that a color can perform.
enum ColorRole {
  /// A color that is used to highlight important information & positive
  /// actions or outcomes.
  highlight,

  /// A color that is used to warn the user & indicate negative actions or
  /// outcomes.
  warning,

  /// A color that is used as the background of the app.
  surface
}

/// Color Codes that indicate the color's specific role and shade.
///
/// ### Note
/// - See also: [ColorRole].
enum ColorCode {
  /// Highlight color, 0% tone.
  highlight0,

  /// Highlight color, 10% tone.
  highlight10,

  /// Highlight color, 20% tone.
  highlight20,

  /// Highlight color, 30% tone.
  highlight30,

  /// Highlight color, 40% tone.
  highlight40,

  /// Highlight color, 50% tone.
  highlight50,

  /// Highlight color, 60% tone.
  highlight60,

  /// Highlight color, 70% tone.
  highlight70,

  /// Highlight color, 80% tone.
  highlight80,

  /// Highlight color, 90% tone.
  highlight90,

  /// Highlight color, 100% tone.
  highlight100,

  /// Warning color, 0% tone.
  warning0,

  /// Warning color, 10% tone.
  warning10,

  /// Warning color, 20% tone.
  warning20,

  /// Warning color, 30% tone.
  warning30,

  /// Warning color, 40% tone.
  warning40,

  /// Warning color, 50% tone.
  warning50,

  /// Warning color, 60% tone.
  warning60,

  /// Warning color, 70% tone.
  warning70,

  /// Warning color, 80% tone.
  warning80,

  /// Warning color, 90% tone.
  warning90,

  /// Warning color, 100% tone.
  warning100,

  /// Surface color, 0% tone.
  surface0,

  /// Surface color, 10% tone.
  surface10,

  /// Surface color, 20% tone.
  surface20,

  /// Surface color, 30% tone.
  surface30,

  /// Surface color, 40% tone.
  surface40,

  /// Surface color, 50% tone.
  surface50,

  /// Surface color, 60% tone.
  surface60,

  /// Surface color, 70% tone.
  surface70,

  /// Surface color, 80% tone.
  surface80,

  /// Surface color, 90% tone.
  surface90,

  /// Surface color, 100% tone.
  surface100,
}

// See also: [MHct.colorCode]
//
// It's much simpler that creating a static class to map two different enums.
// ignore: prefer-static-class
const _roleToCode = {
  ColorRole.highlight: {
    0: ColorCode.highlight0,
    10: ColorCode.highlight10,
    20: ColorCode.highlight20,
    30: ColorCode.highlight30,
    40: ColorCode.highlight40,
    50: ColorCode.highlight50,
    60: ColorCode.highlight60,
    70: ColorCode.highlight70,
    80: ColorCode.highlight80,
    90: ColorCode.highlight90,
    100: ColorCode.highlight100,
  },
  ColorRole.warning: {
    0: ColorCode.warning0,
    10: ColorCode.warning10,
    20: ColorCode.warning20,
    30: ColorCode.warning30,
    40: ColorCode.warning40,
    50: ColorCode.warning50,
    60: ColorCode.warning60,
    70: ColorCode.warning70,
    80: ColorCode.warning80,
    90: ColorCode.warning90,
    100: ColorCode.warning100,
  },
  ColorRole.surface: {
    0: ColorCode.surface0,
    10: ColorCode.surface10,
    20: ColorCode.surface20,
    30: ColorCode.surface30,
    40: ColorCode.surface40,
    50: ColorCode.surface50,
    60: ColorCode.surface60,
    70: ColorCode.surface70,
    80: ColorCode.surface80,
    90: ColorCode.surface90,
    100: ColorCode.surface100,
  },
};
