class Point {
  private static int $pointCount = 0; // static property with initializer
  private float $x; // instance property
  private float $y; // instance property

  public function __construct(num $x = 0, num $y = 0) { // instance method
    $this->x = (float)$x; // access instance property
    $this->y = (float)$y; // access instance property
    ++Point::$pointCount; // include new Point in Point count
  }
}

function demo(): void {
  $p1 = new Point(2.3);
}

// Constructor parameter promotion
final class User {
  private int $id;
  private string $name;

  public function __construct(
    int $id,
    string $name,
  ) {
    $this->id = $id;
    $this->name = $name;
  }
}
// Constructor parameter promotion removes boilerplate code
final class User {
  public function __construct(
    private int $id,
    private string $name,
  ) {}
}

// All you do is put a visibility modifier in front of the constructor parameter and everything else in the previous example is 
// done automatically, including the actual creation of the property.

// Note: Promotion can only be used for constructor parameters with name and type that exactly match the respective class property. 
// For example, we couldn't use it in the Point class above because we wanted the properties to have type float, so any arithmetic 
// coordinate value can be represented, yet we wanted the constructor parameters to have type num, so either integer or floating-point 
// values can be passed in.

// "un-promote" contructor parameter if it later turns out that a different internal data representation would be better
final class User {
  private ParsedName $name;

  public function __construct(
    private int $id,
    string $name,
  ) {
    $this->name = parse_name($name);
  }
}

// Rules
// - A modifier of private, protected or public must precede the parameter declaration in the constructor.
// - Other, non-class-property parameters may also exist in the constructor, as normal.
// - Type annotations must go between the modifier and the parameter's name.
// - The parameters can have a default value.
// - Other code in the constructor is run after the parameter promotion assignment.
