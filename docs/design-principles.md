# Meku's Design Principles

The is the third iteration of Design Principles for Meku. In my personal opinions, the first two
iterations were too abstract and high-flying rather than practical and useful. I would also like to
note that this iteration of Design Principles has a lot of overlap within itself. No single
principle takes precedence over the others. No single principle can be applied in pure isolation.

## Organized Hierarchy, Flat Access

Some creative tool-sets might have many tools, it is practically a compulsory requirement to
organize them into nested sub-categories. However, this can make it difficult to discover, locate,
or access the tools you want.

Meku attempts to alleviate this problem by proving alternative means of accessing nested
details/tools that bypass the need to navigate through the organized hierarchy.

This principle is inspired in particular by VS Code's Command Palette.

## Contextual Action

When dealing with an large and overlapping tool-set, the traditional method is to have the user
learn the tools and the many many relevant shortcuts to speed up their workflow. Not only is this a
very steep learning curve but it also requires the user to remember a lot of lengthy, intricate, and
often arbitrary shortcuts.

Meku attempts to alleviate this by linking the tools to the context of the user's actions. You can
have a small set of shortcuts that map to different but intuitive actions depending on the context.
This context based system would also reduce clutter but simply displaying relevant tools instead of
the entire tool-set all the time.

This is inspired by contextual UI that is common is Game UIs.

## Obvious and Verifiable

The obvious part is fairly self-explanatory. In the chance that the purpose of something is not
clear, the user should have a way to verify if they interpretation is correct. Again, fairly
self-explanatory.

> There should be one -- and preferably only one -- obvious way to do something.
>
> *from [The Zen of Python](https://peps.python.org/pep-0020/)*

This is inspired by common sense.

## Customizable/Flexible

Creative applications are just that -- tool-sets for creating things. THe actual workflow creators
use vary from person to person and from project to project. It makes sense that the user should be
able to setup the UI to suit their workflow.

No wold-changing inspiration here, just things applications like Blender and Clip Studio have been
doing forever.

## Specialized and Uncluttered

The UI should be designed to help the user create what they want. For one, it makes no sense to
structure a wordprocessors UI like a digital art application. FOr another, I absolutely hate it when
theres so many toolbars that my work area is reduced to a tiny sliver of screen real estate. So,
specialize for the task at hand and maximize the work area.
