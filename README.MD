# ION - An OS for the Taleä system

ION   is   the   official   operating   system   for   the    [Taleä    Computer
System](https://github.com/uri-nyx/Talea)

## STYLE

The Ion OS codebase follows  the  Linux  Kernel  style  conventions,  with  some
tweaks:

- Spaces (8) instead of tabs.
- Everything is snake case, but global variables keep are capitalized

### Semantic naming conventions

If not otherwise noted, every name shall be snake_case.

Identifiers in driver code (under  kernel/drivers)  shall  be  prefixed  by  the
driver name (e.g: disk_).

Identifiers in OS modules (under kernel/ion) shall be prefixed by ion_


#### Structures and types

structures are prefered to typedefs. Typedefs shall not be  prepended  by  POSIX
_t. The only exception will be function pointer types.

