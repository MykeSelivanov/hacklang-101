// The binary operator . creates a string that is the concatenation of the left-hand operand and the right-hand operand, in that order. 
// If either or both operands have types other than string, their values are converted to type string.
"foo"."bar"; // "foobar"

-10 . NAN;               // string result with value "-10NAN"
INF . "2e+5";            // string result with value "INF2e+5"
true . null;             // string result with value "1"