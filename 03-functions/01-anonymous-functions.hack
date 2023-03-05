// Hack supports anonymous functions
$f = $x ==> $x + 1;
$two = $f(1); // result of 2

$f = ($x, $y) ==> $x + $y;
$three = $f(1, 2);  // result of 3

// Anonymous functions pass by value, not by reference. This is also true for any object property passed to an anonymous function.
$x = 5;
$f = $x ==> $x + 1;

$six = $f($x); // pass by value

echo($six); // result of 6
echo("\n");
echo($x); // $x is unchanged; result of 5

// Unlike named functions, type annotations are optional on anonymous functions. You can still add explicit types if you wish.
$f = (int $x): int ==> $x + 1;

// Fat arrow syntax
// ==> defines an anonymous function in Hack. An anonymous function can be a single expression, or a block.
$f1 = $x ==> $x + 1;
$f2 = $x ==> { return $x + 1; };