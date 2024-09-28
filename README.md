# Meku UI

__TL; DR__ A UI Kit for Flutter aimed at creative applications/workflows.

Most UI Libraries are aimed at very specific use cases. Both Microsoft's Fluent and Google's
Material3 are aimed for general purpose application where the primary interactions are data entry
and data display. Apple's Human Interface Guidelines are more of a collection of general principles
coupled with well designed components more than a dedicated UI library. IBM's Carbon design is
primarily targeted at enterprise level data analytics applications and it shows in Carbon Design's
focus on clarity in data presentation. Meku (The *romaji* for "make") is similarly primarily
targeted at creative workflows, it draws inspiration from the UIs of creative applications like Code
IDE's, Editing software like Premier Pro & Clip Studio Paint, and Game UIs. THe aim is to allow you
a foundational UI toolkit that allows you to create User Interfaces that look good and help users
create what they want without having to fight the application itself.

## Generating Full Documentation

```ps
dart doc --output docs
```

## Understanding Meku

Meku UI is organize along
[Atomic Design Principles](https://uxdesign.cc/grouping-components-in-atomic-design-systems-4d6e2095ea45),
this section serves as an idex to quickly locate the relevant documentation for various UI elements.
Everything is listed in alphabetical order.

### Key Ideas (Start With These)

- [Design Principles](#mekus-design-principles)

### Developer Considerations

- [Library Structure](#library-structure)

- [Documentation Guidelines](#documentation-guidelines)

### Atoms

These are the most fundamental, granular UI elements.

- [Design Principles](#mekus-design-principles)
- Color (see Library Docs under `atom/color`)

### Molecules

### Organisms

<!-- ### Templates -->

<!--
## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples to `/example` folder.

```dart
const like = 'sample';
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to contribute to the
package, how to file issues, what response they can expect from the package authors, and more. -->

## Meku's Design Principles

The is the third iteration of Design Principles for Meku. In my personal opinions, the first two
iterations were too abstract and high-flying rather than practical and useful. I would also like to
note that this iteration of Design Principles has a lot of overlap within itself. No single
principle takes precedence over the others. No single principle can be applied in pure isolation.

### 1. Organized Hierarchy, Flat Access

Some creative tool-sets might have many tools, it is practically a compulsory requirement to
organize them into nested sub-categories. However, this can make it difficult to discover, locate,
or access the tools you want.

Meku attempts to alleviate this problem by proving alternative means of accessing nested
details/tools that bypass the need to navigate through the organized hierarchy.

This principle is inspired in particular by VS Code's Command Palette.

### 2. Contextual Action

When dealing with an large and overlapping tool-set, the traditional method is to have the user
learn the tools and the many many relevant shortcuts to speed up their workflow. Not only is this a
very steep learning curve but it also requires the user to remember a lot of lengthy, intricate, and
often arbitrary shortcuts.

Meku attempts to alleviate this by linking the tools to the context of the user's actions. You can
have a small set of shortcuts that map to different but intuitive actions depending on the context.
This context based system would also reduce clutter but simply displaying relevant tools instead of
the entire tool-set all the time.

This is inspired by contextual UI that is common is Game UIs.

### 3. Obvious and Verifiable

The obvious part is fairly self-explanatory. In the chance that the purpose of something is not
clear, the user should have a way to verify if they interpretation is correct. Again, fairly
self-explanatory.

> There should be one -- and preferably only one -- obvious way to do something.
>
> *from [The Zen of Python](https://peps.python.org/pep-0020/)*

This is inspired by common sense.

### 4. Customizable/Flexible

Creative applications are just that -- tool-sets for creating things. THe actual workflow creators
use vary from person to person and from project to project. It makes sense that the user should be
able to setup the UI to suit their workflow.

No wold-changing inspiration here, just things applications like Blender and Clip Studio have been
doing forever.

### 5. Specialized and Uncluttered

The UI should be designed to help the user create what they want. For one, it makes no sense to
structure a wordprocessors UI like a digital art application. FOr another, I absolutely hate it when
theres so many toolbars that my work area is reduced to a tiny sliver of screen real estate. So,
specialize for the task at hand and maximize the work area.

## Library Structure

1. Each Element of the UI is organized as such (see example at point 4):

   ```text
   atom/molecule/organism/template
   ├─ element
   │  ├─ element_subpart1.dart
   │  ├─ element_subpart2.dart
   │  ├─ element_subpart3.dart
   |  └─ ...
   └─ element.dart (library level explanation/documentation goes here) 
   ```

2. Each subpart contains a single class.

3. Explicitly use the `library` keyword in the element.dart file.

4. Use the `part`/`part of` directive to split the element into multiple files. (see
   `lib/atom/color/...`)

   ```text
   <!-- Example color.dart library -->
   lib
   └─ atom
      ├─ color
      │  ├─ color_palette.dart     (uses color_swatch & mhct to generate color palette)
      │  ├─ color_swatch.dart      (color swatch class)
      │  └─ mhct.dart              (HCT wrapper with utility functions)
      |
      └─ color.dart                (collets color_palette, color_swatch, and mhct, has library documentation)
   ```

   - The `color_palette.dart`, `color_swatch.dart`, and `mhct.dart` files start with

     ```dart
     part of '../color.dart';
     ```

   - The `color.dart` file starts with

     ```dart
     /// Library Level Documentation
     library color;

     // Imports

     // Sub Parts
     part 'color/mhct.dart';
     part 'color/color_swatch.dart';
     part 'color/color_palette.dart';
     ```

## Documentation Guidelines

### Documentation Comments

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

### Logging

Consider using one of the following formats for traceability:

```text
LibraryName/ClassName/MethodName: Message

ClassName/MethodName: Message

ProcessName/MethodName: Message
```

### Misc

- Use dummy varirables like `_` or `__` when you need to use a variable but don't need its value.
  This is to avoid the `unused_local_variable` warning.
