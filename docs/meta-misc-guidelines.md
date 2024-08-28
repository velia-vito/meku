# Miscalenous Guidelines

## Documentation Comments

- Format to be used is:

  ```dart
  /// A simple one/two-line description of the class/method
  ///
  /// ### Args (only when args are not self-explanatory)
  /// - `argName`: Description of the argument
  ///
  /// ### Errors (only when errors are explicitly thrown)
  /// - `ErrorType`: Cause of the error and potential solution
  ///
  /// ### Notes (as per develop descretion)
  /// - Note 1
  ///
  /// - Note 2
  ```

- Try to avoid using subheadings unless absolutely necessary, do not mentions specific args in the
  one line description either. Rely on the context provided by the method signature if possible.

  __Example 01__

  ```dart
  /// Find the the Color with the closest Hue to the target color from a collection of HCT colors.
  static Hct closestHue({required Hct targetColor, required List<Hct> candidateColors})
  ```

  Note how `targetColor` and `candidateColors` are not mentioned in the one line description, but
  you still know what they are. All documentation comments carry limited context, use it.

  __Example 02__

  ```dart
  /// Generate a color palette from a seed color.
  ///
  /// ### Args
  /// - `minHueDist`, `maxHueDist`: Minimum/Maximum distance between any two
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
  })
  ```

  `minHueDist`, `maxHueDist`, `warningTarget`, `surfaceTarget`, and `highlightTarget` are not
  clearly obvious from the method signature, so they are mentioned in the documentation comment.
  Similarly, only the target colors are mentioned in notes section, because the funcion of
  `minHueDist` and `maxHueDist` is from the arg-description. The default target colors are an
  addtional piece of information that may be important to users and hence is added under notes.

- Only use the `[ClassName]` style documentation linking when the specific class is not implied by
  the context.

  __Example 03__

  ```dart
  /// Convert an ARGB color to the HCT equivalent.
  static Hct fromColor(Color color) => Hct.fromInt(color.value);
  ```

  The one-liner could have been `/// Convert a [Color] to the [Hct] equivalent`, but both `Color`
  and `Hct` are implied by the context, so they are not mentioned.

## Logging

Consider using one of the following formats for traceability:

```text
LibraryName/ClassName/MethodName: Message

ClassName/MethodName: Message

ProcessName/MethodName: Message
```

## Misc

- Use dummy varirables like `_` or `__` when you need to use a variable but don't need its value.
  This is to avoid the `unused_local_variable` warning.
