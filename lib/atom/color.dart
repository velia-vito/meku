/// ## Color in Meku
///
/// Color in Meku primarily serves Obvious/Verifiable principles and minimalist aesthetic. At its
/// very core, Meku uses only three colors per color theme. One color is used to indicate surfaces
/// and for neutral applications, one color is used for warnings, errors, and negative situations,
/// and one color is used for highlights and positive situations. But before we dive into the
/// technicalities of how color is used across the UI, let's first look at the choice of color
/// system used by Meku.
///
/// ### The HCT Color System
///
/// Meku uses Google's [HCT Color System](https://material.io/blog/science-of-color-design) as it
/// trivializes achieving enough contrast for accessibility.
///
/// | HCT Element | HSL Equivalent | What does it mean?                                                                                                                                                                                                                                           |
/// | ----------- | -------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
/// | **H**ue     | **H**ue        | The color itself, indicated in degrees (0° — 360°). HCT hue and HSL Hue are analogous.                                                                                                                                                                       |
/// | **C**hroma  | **S**aturation | How Grey/Colorful the color is. HCT Chroma is perceptually accurate while HSL Saturation is mathematically accurate, because of this, HCT maximum chroma ranges from 100% to 120% depending on color, so 50 Chroma does not necessarily equal 50 Saturation. |
/// | **T**one    | **L**ightness  | How Light/Dark the color is. HCT Tone is perceptually accurate while HSL Lightness is mathematically accurate. 50 Tone does not necessarily equal 50 Lightness.                                                                                              |
///
/// ### Colors & Tones
///
/// Meku uses 3 Colors:
///
/// - **Neutral**: Used for surfaces and other neutral applications.
/// - **Positive**: Used for highlights and positive situations.
/// - **Negative**: Used for warnings, errors, and negative situations. Each color is divided into
///   11 tones, with 0 being the darkest (black) and 10 being the lightest (white).
///
/// <img src="../static-assets/color_palette_example.doc.jpg" alt="Color System Diagram" width="100%">
library color;

// Dart imports:
import 'dart:math';
import 'dart:ui' show Color;

// Package imports:
import 'package:material_color_utilities/hct/hct.dart' show Hct;
import 'package:material_color_utilities/hct/viewing_conditions.dart' show ViewingConditions;

// Sub-Parts.
part 'color/mhct.dart';
part 'color/color_swatch.dart';
part 'color/color_palette.dart';
