<<__EntryPoint>>
function main(): void {

// Boolean literals
// type bool
$val = true;
if ($val === false) {
    echo "Hello";
}

// Integer literals
// type int
$count = 10;      // decimal 10
0b101010 >> 4;    // binary 101010 and decimal 4
0XAf << 012;      // hexadecimal Af and octal 12

$amount = 394_493_392; // completely equivalent to 394493392
$address = 0x49AD_DF30;
$permission = 012_212_001;

// Floating point literals
// type float
// Floating-point literals typically have an integer part, a decimal point, and a fractional part. 
// They may also have an exponent part.
123.456 + 0.6E27 + 2.34e-3;
// The predefined constants INF and NAN provide access to the floating- point values for infinity and Not-a-Number, respectively.

// String literals
// type string
'Welcome to Hack!';
'Can embed a single quote (\') and a backslash (\\) like this';

"Welcome to Hack!";
"Can embed a double quote (\") and a backslash (\\) like this";

"First line 1\nSecond line 2\n\nFourth line\n";
"Can embed a double quote (\") and a backslash (\\) like this";

// Null literal
// There is one null-literal value, null, which has type null.
function has_default_arg(num $arg, ?num $base = null): void {}

// Variable substitution
// When a variable name is seen inside a double-quoted string, after that variable is evaluated, 
// its value is converted to string and is substituted into the string in place of the variable-substitution expression.
// Example:
$x = 123;
echo ">\$x.$x"."<\n";

$myC = new C();
echo "\$myC->p1 = >$myC->p1<\n";
}
// class C
class C {
  public int $p1 = 2;
}