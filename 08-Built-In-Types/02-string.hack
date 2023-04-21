// A string is a sequence of bytes - they are not required to be valid characters in any particular encoding, for example, 
// they may contain null bytes, or invalid UTF-8 sequences.

// Basic operations
// Concatenation and byte indexing are built-in operations; for example:
// - "foo"."bar" results in "foobar"
// - "abc"[1] is "b"
// - if the source code is UTF-8, "a😀c"[1] is byte 0xf0, the first of the 4 bytes compromising the "😀" emoji in UTF-8

// Other operations are supported by the Str\ namespace in the Hack Standard Library, such as:
Str\length("foo") is 3
Str\length("foo\0") is 4
Str\length("a😀c") is 6
Str\join(vec['foo', 'bar', 'baz'], '!') is "foo!bar!baz"

// Use Str\to_int() to convert strings to integers; this will raise errors if the input contains additional data, 
// such as .0 or other trailing characters.

// Working with Regex\
// Functions in the Regex\ namespace operate on bytes. If the string being inspected is UTF-8, use a pattern with the u flag. 
// Failing to do so may result in one multi-byte character being interpreted as multiple characters. For example:
Regex\replace("\u{1f600}", re"/./", 'Char') is CharCharCharChar
Regex\replace("\u{1f600}", re"/./u", 'Char') is Char