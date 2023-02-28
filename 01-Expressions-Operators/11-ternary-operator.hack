// The ternary operator ? : is a shorthand for if statements. It is an expression, so it evaluates to a value.
$days_in_feb = is_leap_year($year) ? 29 : 28;

// Elvis operator
// There is also a two operand version ?:, sometimes called the "elvis operator". 
// This results in the first operand if it evaluates to a truthy value.
$x = foo() ?: bar();

// Is equivalent to:
$tmp = foo();
$x = $tmp ? $tmp : bar();