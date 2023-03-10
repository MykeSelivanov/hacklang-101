// A property is a variable defined inside a class.
class IntBox {
  public int $value = 0;
}
// Instance properties are accessed with ->. Every instance has a separate value for an instance property.
// Note that there is no $ used when accessing ->value.
$b = new IntBox();
$b->value = 42;

// Initializing properties
class HasDefaultValue {
    public int $i = 0;
}

class SetInConstructor {
    public int $i;
    public function __construct() {
        $this->i = 0;
    }
}

// Properties with nullable values do not require initial values. They default to null if not set
class MyExample {
    public mixed $m;
    public ?string $s;
}

// Statis properties
// A static property is a property that is shared between all instances of a class and accessed with ::
class Example {
  public static int $val = 0;
}
Example::$val;

// The Property Namespace
// Properties and methods are in different namespaces. It's possible to have a method and a property with the same name.
class IntBox {
  public int $value = 0;

  public function value(): int {
    return $this->value;
  }
}
// If there are parentheses, Hack knows it's a method call.
$b = new IntBox();
$b->value(); // method call
$b->value; // property access

// If you have a callable value in a property, you will need to be explicit that you're accessing the property.
class FunctionBox {
  public function __construct(public (function(): void) $value) {}
}

$b = new FunctionBox(() ==> { echo "hello"; });
($b->value)();