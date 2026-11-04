package spelling

import gsv "gtksourceview:gtksourceview"

// One typed pin per rule in scripts/postprocess.sh (docs/PATCHED.md). A regeneration that
// drops a rule changes the type here and the package stops compiling.

// `gchar *` is cstring, not ^char.
@(private)
pin_cstring_result: proc "c" (self: ^Checker) -> cstring = checker_get_language
@(private)
pin_cstring_param: proc "c" (self: ^Checker, language: cstring) = checker_set_language

// Typedef aliases are dropped and the Spelling prefix is trimmed from every type name.
@(private)
pin_type_names: proc "c" (provider: ^Provider, language: cstring) -> ^Checker = checker_new

// The version macros are numbers.
@(private)
pin_version: [3]int = {MAJOR_VERSION, MINOR_VERSION, MICRO_VERSION}

// GtkSourceBuffer is gsv.SourceBuffer.
@(private)
pin_source_buffer: proc "c" (self: ^TextBufferAdapter) -> ^gsv.SourceBuffer = text_buffer_adapter_get_buffer
