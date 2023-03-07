// The Hack typechecker checks that format strings are being used correctly.
// Correct.
Str\format("First: %d, second: %s", 1, "foo");

// Typechecker error: Too few arguments for format string.
Str\format("First: %d, second: %s", 1);

// This requires that the format string argument is a string literal, not a variable.
$string = "Number is: %d";

// Typechecker error: Only string literals are allowed here.
Str\format($string, 1);