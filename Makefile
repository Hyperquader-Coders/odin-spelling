# odin-spelling: Odin bindings for libspelling. Consumed via -collection:spelling=/path/to/odin-spelling
# What every runic binding does is in house/binding.mk, a copy of house-rules'
# scripts/binding/binding.mk: this repository is public, and its runner has no house-rules.
# project.toml names the kind, the packages, the siblings and the system packages.
include house/binding.mk

# The GTK the tests link is the suite's bundle, amber-gtk4 (libgtk-4 4.16.13, from
# amber-gtk4-dev), the one odin-gtk4 is generated from, in its own folder off the linker's path:
# a test links it from there with the run path every program built on the binding takes. The
# distro's libspelling-1 names GTK by its soname, so in a program that calls GTK itself it
# shares the bundle the run path loads. The tests call no GTK function themselves, so the linker
# would drop libgtk-4 (--as-needed) and libspelling-1, which has no run path, would load the
# distro's GTK 4.14: the test link keeps libgtk-4 (--no-as-needed), and the run path loads the
# bundle before libspelling-1 asks for it. generate reads the bundle's headers (GTK_INCLUDE).
GTK_LIB = /usr/lib/amber-gtk4
ODIN_TEST_FLAGS += -extra-linker-flags:"-L$(GTK_LIB) -Wl,-rpath,$(GTK_LIB) -Wl,--no-as-needed -lgtk-4 -Wl,--as-needed"
generate: export GTK_INCLUDE = $(GTK_LIB)/include
