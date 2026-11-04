package spelling

import gio "glib:gio"
import glib "glib:glib"
import gobj "glib:gobject"
import gsv "gtksourceview:gtksourceview"
import gtk "gtk4:gtk4"

MAJOR_VERSION :: (0)
MINOR_VERSION :: (2)
MICRO_VERSION :: (0)
VERSION :: `(0.2.0)`
VERSION_S :: "0.2.0"
VERSION_HEX :: `((((0)) << 24 | ((2)) << 16 | ((0)) << 8))`
VERSION_CUR_STABLE :: `((((0)) << 16 | (0) << 8))`
VERSION_1_0 :: `(((1) << 16 | (0) << 8))`
VERSION_PREV_STABLE :: `((((0) - 1) << 16 | (0) << 8))`
VERSION_MIN_REQUIRED :: `(((((0)) << 16 | (0) << 8)))`
VERSION_MAX_ALLOWED :: `((((((0)) << 16 | (0) << 8))))`
TYPE_CHECKER :: `(spelling_checker_get_type())`
TYPE_LANGUAGE :: `(spelling_language_get_type())`
TYPE_LANGUAGE_INFO :: `(spelling_language_info_get_type())`
TYPE_PROVIDER :: `(spelling_provider_get_type())`
TYPE_TEXT_BUFFER_ADAPTER :: `(spelling_text_buffer_adapter_get_type())`

Checker :: struct #packed {}
Language :: struct #packed {}
LanguageInfo :: struct #packed {}
Provider :: struct #packed {}
CheckerClass :: struct {
    parent_class: gobj.ObjectClass,
}
LanguageClass :: struct #packed {}
LanguageInfoClass :: struct {
    parent_class: gobj.ObjectClass,
}
ProviderClass :: struct #packed {}
TextBufferAdapter :: struct #packed {}
TextBufferAdapterClass :: struct {
    parent_class: gobj.ObjectClass,
}

@(default_calling_convention = "c")
foreign spelling_runic {
    @(link_name = "spelling_checker_get_type")
    checker_get_type :: proc() -> gobj.Type ---

    @(link_name = "spelling_checker_get_default")
    checker_get_default :: proc() -> ^Checker ---

    @(link_name = "spelling_checker_new")
    checker_new :: proc(provider: ^Provider, language: cstring) -> ^Checker ---

    @(link_name = "spelling_checker_get_provider")
    checker_get_provider :: proc(self: ^Checker) -> ^Provider ---

    @(link_name = "spelling_checker_get_language")
    checker_get_language :: proc(self: ^Checker) -> cstring ---

    @(link_name = "spelling_checker_set_language")
    checker_set_language :: proc(self: ^Checker, language: cstring) ---

    @(link_name = "spelling_checker_check_word")
    checker_check_word :: proc(self: ^Checker, word: cstring, word_len: glib.ssize) -> glib.boolean ---

    @(link_name = "spelling_checker_list_corrections")
    checker_list_corrections :: proc(self: ^Checker, word: cstring) -> ^cstring ---

    @(link_name = "spelling_checker_add_word")
    checker_add_word :: proc(self: ^Checker, word: cstring) ---

    @(link_name = "spelling_checker_ignore_word")
    checker_ignore_word :: proc(self: ^Checker, word: cstring) ---

    @(link_name = "spelling_checker_get_extra_word_chars")
    checker_get_extra_word_chars :: proc(self: ^Checker) -> cstring ---

    @(link_name = "spelling_init")
    init :: proc() ---

    @(link_name = "spelling_language_get_type")
    language_get_type :: proc() -> gobj.Type ---

    @(link_name = "spelling_language_get_code")
    language_get_code :: proc(self: ^Language) -> cstring ---

    @(link_name = "spelling_language_contains_word")
    language_contains_word :: proc(self: ^Language, word: cstring, word_len: glib.ssize) -> glib.boolean ---

    @(link_name = "spelling_language_list_corrections")
    language_list_corrections :: proc(self: ^Language, word: cstring, word_len: glib.ssize) -> ^cstring ---

    @(link_name = "spelling_language_add_word")
    language_add_word :: proc(self: ^Language, word: cstring) ---

    @(link_name = "spelling_language_ignore_word")
    language_ignore_word :: proc(self: ^Language, word: cstring) ---

    @(link_name = "spelling_language_get_extra_word_chars")
    language_get_extra_word_chars :: proc(self: ^Language) -> cstring ---

    @(link_name = "spelling_language_info_get_type")
    language_info_get_type :: proc() -> gobj.Type ---

    @(link_name = "spelling_language_info_get_group")
    language_info_get_group :: proc(self: ^LanguageInfo) -> cstring ---

    @(link_name = "spelling_language_info_get_name")
    language_info_get_name :: proc(self: ^LanguageInfo) -> cstring ---

    @(link_name = "spelling_language_info_get_code")
    language_info_get_code :: proc(self: ^LanguageInfo) -> cstring ---

    @(link_name = "spelling_provider_get_type")
    provider_get_type :: proc() -> gobj.Type ---

    @(link_name = "spelling_provider_get_default")
    provider_get_default :: proc() -> ^Provider ---

    @(link_name = "spelling_provider_get_default_code")
    provider_get_default_code :: proc(self: ^Provider) -> cstring ---

    @(link_name = "spelling_provider_get_display_name")
    provider_get_display_name :: proc(self: ^Provider) -> cstring ---

    @(link_name = "spelling_provider_supports_language")
    provider_supports_language :: proc(self: ^Provider, language: cstring) -> glib.boolean ---

    @(link_name = "spelling_provider_list_languages")
    provider_list_languages :: proc(self: ^Provider) -> ^glib.PtrArray ---

    @(link_name = "spelling_provider_get_language")
    provider_get_language :: proc(self: ^Provider, language: cstring) -> ^Language ---

    @(link_name = "spelling_text_buffer_adapter_get_type")
    text_buffer_adapter_get_type :: proc() -> gobj.Type ---

    @(link_name = "spelling_text_buffer_adapter_new")
    text_buffer_adapter_new :: proc(buffer: ^gsv.SourceBuffer, checker: ^Checker) -> ^TextBufferAdapter ---

    @(link_name = "spelling_text_buffer_adapter_get_buffer")
    text_buffer_adapter_get_buffer :: proc(self: ^TextBufferAdapter) -> ^gsv.SourceBuffer ---

    @(link_name = "spelling_text_buffer_adapter_get_enabled")
    text_buffer_adapter_get_enabled :: proc(self: ^TextBufferAdapter) -> glib.boolean ---

    @(link_name = "spelling_text_buffer_adapter_set_enabled")
    text_buffer_adapter_set_enabled :: proc(self: ^TextBufferAdapter, enabled: glib.boolean) ---

    @(link_name = "spelling_text_buffer_adapter_get_checker")
    text_buffer_adapter_get_checker :: proc(self: ^TextBufferAdapter) -> ^Checker ---

    @(link_name = "spelling_text_buffer_adapter_set_checker")
    text_buffer_adapter_set_checker :: proc(self: ^TextBufferAdapter, checker: ^Checker) ---

    @(link_name = "spelling_text_buffer_adapter_get_language")
    text_buffer_adapter_get_language :: proc(self: ^TextBufferAdapter) -> cstring ---

    @(link_name = "spelling_text_buffer_adapter_set_language")
    text_buffer_adapter_set_language :: proc(self: ^TextBufferAdapter, language: cstring) ---

    @(link_name = "spelling_text_buffer_adapter_invalidate_all")
    text_buffer_adapter_invalidate_all :: proc(self: ^TextBufferAdapter) ---

    @(link_name = "spelling_text_buffer_adapter_get_tag")
    text_buffer_adapter_get_tag :: proc(self: ^TextBufferAdapter) -> ^gtk.TextTag ---

    @(link_name = "spelling_text_buffer_adapter_get_menu_model")
    text_buffer_adapter_get_menu_model :: proc(self: ^TextBufferAdapter) -> ^gio.MenuModel ---

}

foreign import spelling_runic "system:spelling-1"

