// The new operator allocates memory for an object that is an instance of the specified class. 
// The object is initialized by calling the class's constructor passing it the optional argument list, 
// just like a function call. If the class has no constructor, the constructor that class inherits (if any) is used.

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

<<__EntryPoint>>
function main(): void {
  $p1 = new Point(); // create Point(0.0, 0.0)
  $p2 = new Point(5, 6.7); // create Point(5.0, 6.7)
}