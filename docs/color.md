# Color in Meku

Color in Meku primarily serves Organization/Heirarchy and the Obvious/Verifiable principles. At its
very core, Meku uses only three colors per color theme. One color is used to indicate surfaces and
for neutral applications, one color is used for warnings, errors, and negative situations, and one
color is used for highlights and positive situations.

But before we dive into the technicalitites of how color is used across the UI, let's first look at
the choice of color system used by Meku.

## The HCT Color System

Meku uses Google's [HCT Color System](https://material.io/blog/science-of-color-design) as it
trivializes acheiving enough contrast for accessibility.

| HCT Element | HSL Equivalent | What does it mean?                                                                                                                                                                                                                                          |
| ----------- | -------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| H (Hue)     | H (Hue)        | The color itself, indicated in deg. HCT hue and HSL Hue are ananlogous.                                                                                                                                                                                     |
| C (Chroma)  | S (Saturation) | How Grey/Colorful the color is. HCT Chroma is perceptually accurate while HSL Saturation is mathematically accurate. 50 Choroma does not necessarily equal 50 Saturation. The Max Chroma value changes from color to color but generally maxes out at ~120. |
| T (Tone)    | L (Lightness)  | How Light/Dark the color is. HCT Tone is perceptually accurate while HSL Lightness is mathematically accurate. 50 Tone does not necessarily equal 50 Lightness.                                                                                             |

<!-- 4 Colors + Tones:
    - Surfaces/Neutral
    - Positive
    - Negative
    - Highlight/Hierarchy -->
