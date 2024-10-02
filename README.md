# Meku UI

<center>

| UI Design System     | Use Case                                                                                                     | Visual Style                                                                                                          |
| -------------------- | ------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------- |
| Material 3           | Android-first Adaptive Applications with consistent experience across devices                                | Flat design with emphasis on color, typography, and spacing.                                                          |
| Fluent               | Windows-first Adaptive Applications with a focus on natural interaction and device specific controls/layouts | Acrylic effect (glass morphism), depth effects, and a focus on natural light and motion.                              |
| IBM Carbon           | Focus on simplicity, clarity, and accessibility. Especially for data visualization and documentation.        | Flat design with a focus on clean lines, neutral colors, and a sans-serif typeface.                                   |
| Ant Design           | Focus on efficiency, performance, and a responsive design for enterprise applications                        | Flat design with a focus on simplicity, clarity, and a consistent experience across different (desktop) screen sizes. |
| Foundation/Bootstrap | Responsivity & Modularity for web applications                                                               | Flat design with a focus on simplicity, clarity, and a consistent experience across different screen sizes.           |

*Table 1. Most UI Libraries are aimed at a very specific use case.*

</center>

> メイク /meɪkuː/ (*Romanji **me-ku***) **1. *verb*** form (something) by putting parts together or
> combining substances; create **2. *verb*** cause (something) to exist or come about; bring about.
> **3. *verb*** constitute; amount to; develop into.

As the definition implies, Meku is primarily targeted at applications meant for creating things. and
is inspired by the UIs of creative applications like:

- Code IDE's (eg. VS Code, Dreamweaver, Visual Studio)

- Editing software (eg. Photoshop, Premier Pro, Lightroom)

- Art software (eg. Clip Studio Paint, Blender, Krita)

- Engineering software (eg. SolidWorks, Ansys)

- Game UI (eg. Baldur's Gate 3, Cyberpunk 2077)

The aim is to allow you a minimal UI toolkit that allows you to create User Interfaces that look
good and help users create what they want without having to fight/learn the application itself —
**basically, good Creative Application UI made easy.**

## Understanding Meku

### Atomic Design

Meku is organized based on the
[Atomic Design Principles](https://bradfrost.com/blog/post/atomic-web-design/) where Atoms →
Molecules → Organisms → Templates → Pages:

1. **Atoms** The basic building blocks of the UI such as a form label, an input, or a button. Atoms
   can also include more abstract elements like color palettes, fonts and even more invisible
   aspects of an interface like animations.

2. **Molecules** Molecules are groups of atoms bonded together *to serve some purpose*. For example,
   a form label, input, and button aren’t too useful by themselves, but combine them together and
   you have a search box.

3. **Organisms** Organisms are groups of molecules joined together to form a *relatively complex,
   distinct section of an interface*. For example, a navigation bar.

4. **Templates** Templates are *page-level objects* that place components into a layout to
   communicate information or enable actions.

5. **Pages** Pages are specific instances of templates that show what a UI looks like with real
   content in place.

### Visual Design

### Functional Design Principles

### Design Rationale behind specific elements

The specific choices behind the design of almost every element in Meku is outlined in the
library-level documentation of the element. Use the below command to generate documentation with
minimal errors.

```ps
PS> dart doc --output docs
```

## Developing Meku

### Library Structure

Meku heavily relies on the `part`/`part of` directives to prevent colossally long files by splitting
libraries into multiple files. The folder/code structure is as follows:

1. Each Element of the UI is organized into one of 4 folders (atom, molecule, organism, template):

   ```text
   ===========================================
   == Example of the structure of a UI Atom ==
   ===========================================

   lib
   └─ atom
      ├─ element
      │  ├─ element_subpart_1.dart
      │  ├─ element_subpart_2.dart
      │  ├─ element_subpart_3.dart
      |  └─ ...
      |
      └─ element.dart (library level explanation/documentation goes here) 
   ```

2. Each subpart contains a ***single*** class or widget.

3. Explicitly use the `library` keyword in the element.dart file.

4. Use the `part`/`part of` directive to split the element into multiple files. (see
   `lib/atom/color/...` for more details)

   - Directory Structure

     ```text
     ================================
     == Example color.dart library ==
     ================================

     lib
     └─ atom
        ├─ color
        │  ├─ color_palette.dart     (uses color_swatch & mhct to generate color palette)
        │  ├─ color_swatch.dart      (color swatch class)
        │  └─ mhct.dart              (HCT wrapper with utility functions)
        |
        └─ color.dart                (combines everything, has library documentation)
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
     part 'color/mhct.dart';            // Code in mhct.dart is symbolically placed here
     part 'color/color_swatch.dart';    // Code in color_swatch.dart is symbolically placed here
     part 'color/color_palette.dart';   // Code in color_palette.dart is symbolically placed here
     ```

### Variable Naming Conventions

1. - Use dummy variables like `_` or `__` when you need to use a variable but don't need its value.
     This is to avoid the `unused_local_variable` warning.

### Documentation Comment Format

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

1. Try to avoid using `Args`, `Errors`, and `Notes` unless absolutely necessary, do not mentions
   specific args in the one line description either. Rely on the context provided by the method
   signature if possible.

   - **Example 1** When to avoid Documentation Sub-Sections.

     ```dart
     /// Find the the Color with the closest Hue to the target color from the given colors.
     static Hct closestHue({required Hct targetColor, required List<Hct> candidateColors})
     ```

     Note how `targetColor` and `candidateColors` are not mentioned in the one line description, but
     you still know what they are. All documentation comments carry limited context, use it.

   - **Example 2** When to use Documentation Sub-Sections.

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

     - `minHueDist`, `maxHueDist`, `warningTarget`, `surfaceTarget`, and `highlightTarget` are not
       clearly obvious from the method signature, so they are mentioned in the documentation
       comment.

     - Similarly, the default target colors are mentioned in notes section as they are an additional
       pieces of information that may be important to users and not directly relevant to the
       function.

2. Avoid using the `[ClassName]` style documentation linking when the specific class is implied by
   the context.

   - **Example 3**

     ```dart
     /// Convert an ARGB color to the HCT equivalent.
     static Hct fromColor(Color color) => Hct.fromInt(color.value);
     ```

     The one-liner could have been `/// Convert a [Color] to the [Hct] equivalent`, but both `Color`
     and `Hct` are implied by the context, so they are not mentioned.

### Logging Format

Use one of the following formats for all Debug Logging:

1. ```text
    LibraryName/ClassName/MethodName: Message
   ```

2. ```text
    ClassName/MethodName: Message
   ```

3. ```text
    ProcessName/MethodName: Message
   ```
<!-- 

## Meku's Visual Design

Mostly Inspired by Teenage Engineering's Minimal Retro-Futurism

- Thumb Wheels

- Buttons

- Sliders

- Knobs

- Geometric Shapes delimited by grooves

- clicky circles

1. Dense Functionality

2. Limited Color Palette -->
<!-- 
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
specialize for the task at hand and maximize the work area. -->
