# odin-spelling cheat sheet

One screen per package: the calls a program makes, in the order it makes them, and the few
rules worth remembering. Every name here is a public declaration in [API.md](API.md), and
`make lint` fails when one is not. For the reasons behind a rule, follow the link to the README.

Conventions that hold everywhere: the library is the `spelling` collection
(`-collection:spelling=../odin-spelling`), imported as `spell`; the names are libspelling's
without the `spelling_` prefix; GLib and GObject come from `glib:` and are never redeclared
([Use](../README.md#use)); the adapter works on a `gsv.SourceBuffer` from
[odin-gtksourceview](https://github.com/Hyperquader-Coders/odin-gtksourceview). A program with no
GTK widgets, or that checks plain strings, wants odin-enchant.

## spell:spelling — underlines and suggestions in a source buffer

```odin
import spell "spelling:spelling"
import gsv "gtksourceview:gtksourceview"
import gtk "gtk4:gtk4"
import glib "glib:glib"
import gobj "glib:gobject"

spell.init()                                           // once, before any other call
checker := spell.checker_get_default()                 // the process-wide checker; borrowed, never unref'd
spell.checker_set_language(checker, "en_GB")           // pin it once; a code from provider_list_languages
spell.checker_ignore_word(checker, "Pipwick")          // this run only: the program's own words
spell.checker_add_word(checker, "Frogwort")            // into the user's personal list

adapter := spell.text_buffer_adapter_new(buf, checker) // buf: ^gsv.SourceBuffer; one adapter per buffer
defer gobj.object_unref((^gobj.Object)(adapter))       // at the buffer's end; the new adapter is yours
spell.text_buffer_adapter_set_enabled(adapter, true)   // the underlines: a property, so bind it to a toggle

// A right click: is the word under it underlined, and what could it be?
tag := spell.text_buffer_adapter_get_tag(adapter)      // the misspelling tag, borrowed
if bool(gtk.text_iter_has_tag(&iter, tag)) && !bool(spell.checker_check_word(checker, word, -1)) {   // -1: NUL-ended
	fixes := ([^]cstring)(spell.checker_list_corrections(checker, word))   // NULL-ended, or nil
	defer if fixes != nil { glib.strfreev((^cstring)(fixes)) }
	for i := 0; fixes != nil && fixes[i] != nil; i += 1 { _ = fixes[i] }
}

// A language picker: one row per installed dictionary.
langs := spell.provider_list_languages(spell.provider_get_default())   // ^glib.PtrArray of ^spell.LanguageInfo
for i in 0 ..< int(langs.len) {
	info := (^spell.LanguageInfo)(langs.pdata[i])
	_, _ = spell.language_info_get_name(info), spell.language_info_get_code(info)   // borrowed strings
}
glib.ptr_array_unref(langs)                            // the array only: the elements are the provider's

spell.text_buffer_adapter_set_language(adapter, "de_DE")   // re-checks this buffer's underlines now
spell.text_buffer_adapter_invalidate_all(adapter)          // after ignore_word: drops stale underlines
```

| remember | |
|---|---|
| `init` first, once | libspelling's own rule: before any other call |
| The default checker is shared | `checker_set_language` changes it for every buffer, but only `text_buffer_adapter_set_language` re-checks that buffer's existing underlines; the others re-check on their next edit |
| `ignore_word` lasts the run, `add_word` is kept | a program's own word list is fed through `ignore_word` at startup, and `invalidate_all` after one is added later |
| `list_corrections` and `provider_list_languages` return owned containers | `glib.strfreev` the first, `glib.ptr_array_unref` the second; the strings and elements inside are not yours |
| A menu of fixes is the program's to build | the adapter has `get_menu_model`, but a program with its own menus hit-tests with `get_tag`, then calls `check_word` and `list_corrections` |
| The adapter ignores the word at the caret | it is not tagged while typed, so probe with `check_word` rather than trusting the tag there |
