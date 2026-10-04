#+test
package spelling

import "core:strings"
import "core:testing"

// Version recorded in README.md: "**Bound version:** X.Y.Z".
README :: #load("../README.md", string)

bound_version :: proc() -> (major, minor, micro: int, ok: bool) {
    marker :: "**Bound version:** "
    readme := README
    i := strings.index(readme, marker)
    if i < 0 do return
    rest := readme[i + len(marker):]
    end := strings.index_any(rest, " \n")
    if end < 0 do return
    parts := strings.split(rest[:end], ".", context.temp_allocator)
    if len(parts) != 3 do return
    nums: [3]int
    for p, n in parts {
        v := 0
        if len(p) == 0 do return
        for c in p {
            if c < '0' || c > '9' do return
            v = v * 10 + int(c - '0')
        }
        nums[n] = v
    }
    return nums[0], nums[1], nums[2], true
}

@(test)
test_readme_version_matches_header_macros :: proc(t: ^testing.T) {
    major, minor, micro, ok := bound_version()
    testing.expect(t, ok, "README.md has no '**Bound version:** X.Y.Z'")
    testing.expect_value(t, major, MAJOR_VERSION)
    testing.expect_value(t, minor, MINOR_VERSION)
    testing.expect_value(t, micro, MICRO_VERSION)
    testing.expect_value(t, VERSION_S, "0.2.0")
}

@(test)
test_library_loads_and_reports_types :: proc(t: ^testing.T) {
    testing.expect(t, checker_get_type() != 0, "no GType for SpellingChecker")
    testing.expect(t, provider_get_type() != 0, "no GType for SpellingProvider")
    testing.expect(t, language_get_type() != 0, "no GType for SpellingLanguage")
    testing.expect(t, text_buffer_adapter_get_type() != 0, "no GType for SpellingTextBufferAdapter")
}
