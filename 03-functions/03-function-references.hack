// It is often useful to refer to a function (or a method) without actually calling it—for example, 
// as an argument for functions like Vec\map.
// To refer to a top-level (global) function named foo, you can write:

foo<>; // a reference to global function 'foo'
// You can think of it like it’s a function call with empty generics, but the list of arguments has been omitted (the missing parentheses).

// The following example stores a function reference in a variable and later calls the function. 
// Note that the type checker keeps track of the function's type and correctly checks all calls.
function foo(string $x): bool { ... }
$x = foo<>;     // $x:(function(string): bool)
$y = $x('bar'); // $y:bool
$_ = $x(-1);    // error!

// This syntax supports namespaced names the same way you would refer to them as part of a function call, 
// so the following function references are all equivalent:
$fun = \Foo\Bar\Baz\derp<>;

namespace Foo;
$fun = Bar\Baz\derp<>;

use namespace Foo\Bar\Baz;
$fun = Baz\derp<>;

use function Foo\Bar\Baz\derp;
$fun = derp<>;

// Static methods
// Similarly, you can refer to a static method bar on a class MyClass by using the familiar method call syntax, 
// without providing the call arguments. Just append type arguments (like <>) to the function call receiver (like MyClass::bar).
MyClass::bar<>; // a reference to static method 'MyClass::bar'

// Generics
// If you wish to pass along explicit generic arguments, either as a hint to the type checker, 
// or in the case of a function with reified type parameters when they are required
// Erased generics
function fizz<Ta as num, Tb>(Ta $a, Tb $b): mixed { ... }

$x = fizz<int, string>; // OK
$x(4, 'hello');
$x(-1, false); // error!

$y = fizz<>;
$y(3.14, new C()); // also OK
$y('yo', derp()); // error!

// OK as well
$z = fizz<int, _>;
$z = fizz<_, string>;
$z = fizz<_, _>;

// these all have errors!
fizz<_>;
fizz<string, _>;
fizz<string, int>;

// Reified generics
function buzz<reify T as arraykey>(T $x): mixed { ... }

$w = buzz<int>; // OK
$w(42);
$w("goodbye"); // error!

// these all have errors!
buzz<>;
buzz<_>;
buzz<mixed>;