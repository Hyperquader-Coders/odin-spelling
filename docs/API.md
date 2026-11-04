# odin-spelling API

Every public declaration of every package, generated from the source by `make api`; do not
edit. The reference is the [README](../README.md); the short form is the
[cheat sheet](CHEATSHEET.md).

## spelling:spelling

```text
package spelling
	constants
		MAJOR_VERSION :: 0
		MICRO_VERSION :: 0
		MINOR_VERSION :: 2
		TYPE_CHECKER :: `(spelling_checker_get_type())`
		TYPE_LANGUAGE :: `(spelling_language_get_type())`
		TYPE_LANGUAGE_INFO :: `(spelling_language_info_get_type())`
		TYPE_PROVIDER :: `(spelling_provider_get_type())`
		TYPE_TEXT_BUFFER_ADAPTER :: `(spelling_text_buffer_adapter_get_type())`
		VERSION :: `(0.2.0)`
		VERSION_1_0 :: `(((1) << 16 | (0) << 8))`
		VERSION_CUR_STABLE :: `((((0)) << 16 | (0) << 8))`
		VERSION_HEX :: `((((0)) << 24 | ((2)) << 16 | ((0)) << 8))`
		VERSION_MAX_ALLOWED :: `((((((0)) << 16 | (0) << 8))))`
		VERSION_MIN_REQUIRED :: `(((((0)) << 16 | (0) << 8)))`
		VERSION_PREV_STABLE :: `((((0) - 1) << 16 | (0) << 8))`
		VERSION_S :: "0.2.0"

	procedures
		checker_add_word :: proc(self: ^Checker, word: cstring) ---
		checker_check_word :: proc(self: ^Checker, word: cstring, word_len: glib.ssize) -> glib.boolean ---
		checker_get_default :: proc() -> ^Checker ---
		checker_get_extra_word_chars :: proc(self: ^Checker) -> cstring ---
		checker_get_language :: proc(self: ^Checker) -> cstring ---
		checker_get_provider :: proc(self: ^Checker) -> ^Provider ---
		checker_get_type :: proc() -> gobj.Type ---
		checker_ignore_word :: proc(self: ^Checker, word: cstring) ---
		checker_list_corrections :: proc(self: ^Checker, word: cstring) -> ^cstring ---
		checker_new :: proc(provider: ^Provider, language: cstring) -> ^Checker ---
		checker_set_language :: proc(self: ^Checker, language: cstring) ---
		init :: proc() ---
		language_add_word :: proc(self: ^Language, word: cstring) ---
		language_contains_word :: proc(self: ^Language, word: cstring, word_len: glib.ssize) -> glib.boolean ---
		language_get_code :: proc(self: ^Language) -> cstring ---
		language_get_extra_word_chars :: proc(self: ^Language) -> cstring ---
		language_get_type :: proc() -> gobj.Type ---
		language_ignore_word :: proc(self: ^Language, word: cstring) ---
		language_info_get_code :: proc(self: ^LanguageInfo) -> cstring ---
		language_info_get_group :: proc(self: ^LanguageInfo) -> cstring ---
		language_info_get_name :: proc(self: ^LanguageInfo) -> cstring ---
		language_info_get_type :: proc() -> gobj.Type ---
		language_list_corrections :: proc(self: ^Language, word: cstring, word_len: glib.ssize) -> ^cstring ---
		provider_get_default :: proc() -> ^Provider ---
		provider_get_default_code :: proc(self: ^Provider) -> cstring ---
		provider_get_display_name :: proc(self: ^Provider) -> cstring ---
		provider_get_language :: proc(self: ^Provider, language: cstring) -> ^Language ---
		provider_get_type :: proc() -> gobj.Type ---
		provider_list_languages :: proc(self: ^Provider) -> ^glib.PtrArray ---
		provider_supports_language :: proc(self: ^Provider, language: cstring) -> glib.boolean ---
		text_buffer_adapter_get_buffer :: proc(self: ^TextBufferAdapter) -> ^gsv.SourceBuffer ---
		text_buffer_adapter_get_checker :: proc(self: ^TextBufferAdapter) -> ^Checker ---
		text_buffer_adapter_get_enabled :: proc(self: ^TextBufferAdapter) -> glib.boolean ---
		text_buffer_adapter_get_language :: proc(self: ^TextBufferAdapter) -> cstring ---
		text_buffer_adapter_get_menu_model :: proc(self: ^TextBufferAdapter) -> ^gio.MenuModel ---
		text_buffer_adapter_get_tag :: proc(self: ^TextBufferAdapter) -> ^gtk.TextTag ---
		text_buffer_adapter_get_type :: proc() -> gobj.Type ---
		text_buffer_adapter_invalidate_all :: proc(self: ^TextBufferAdapter) ---
		text_buffer_adapter_new :: proc(buffer: ^gsv.SourceBuffer, checker: ^Checker) -> ^TextBufferAdapter ---
		text_buffer_adapter_set_checker :: proc(self: ^TextBufferAdapter, checker: ^Checker) ---
		text_buffer_adapter_set_enabled :: proc(self: ^TextBufferAdapter, enabled: glib.boolean) ---
		text_buffer_adapter_set_language :: proc(self: ^TextBufferAdapter, language: cstring) ---

	types
		Checker :: struct #packed {}
		CheckerClass :: struct {parent_class: gobj.ObjectClass}
		Language :: struct #packed {}
		LanguageClass :: struct #packed {}
		LanguageInfo :: struct #packed {}
		LanguageInfoClass :: struct {parent_class: gobj.ObjectClass}
		Provider :: struct #packed {}
		ProviderClass :: struct #packed {}
		TextBufferAdapter :: struct #packed {}
		TextBufferAdapterClass :: struct {parent_class: gobj.ObjectClass}

	files:
		patched.odin
		spelling.odin
```
