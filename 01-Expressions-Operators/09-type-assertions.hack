// The is operator checks whether a value has the type specified, and returns a boolean result.
1 is int;        // true
'foo' is int;    // false

1 is num;        // true
1.5 is num;      // true
'foo' is num;    // false

// The type checker understands is and refines values inside conditionals or after invariant calls.
function transport(Vehicle $v): void {
  if ($v is Car) {
    $v->drive();
  } else if ($v is Plane) {
    $v->fly();
  } else {
    invariant($v is Boat, "Expected a boat");
    $v->sail();
  }
}

// A common pattern with is refinement is to use nonnull rather than an explicit type.
function transport(?Car $c): void {
  if ($c is nonnull) {
    // Infers that $c is Car, but saves us
    // repeating the name of the type.
    $c->drive();
  }
}

// Enums
enum MyEnum: int {
  FOO = 1;
}

function demo(): void {
  1 is MyEnum;       // true
  42 is MyEnum;      // false
  'foo' is MyEnum;   // false
}

// Generics
// Since is provides a runtime check, it cannot be used with erased generics. 
// For generic types, you must use _ placeholders for type parameters.
$v = vec[1, 2, 3];

// We can't use `is vec<int>` here.
$v is vec<_>; // true

// Tuples
// For tuples and shapes, is validates the size and recursively validates every field in the value.
$x = tuple(1, 2.0, null);
$x is (int, float, ?bool); // true

$y = shape('foo' => 1);
$y is shape('foo' => int); // true

// Enforcing Types with as and ?as
// as performs the same checks as is.