// Traits are a mechanism for code reuse that overcomes some limitations of Hack single inheritance model.
// In its simplest form a trait defines properties and method declarations. A trait cannot be instantiated with new, 
// but it can be used inside one or more classes, via the use clause. Informally, whenever a trait is used by a class, 
// the property and method definitions of the trait are inlined (copy/pasted) inside the class itself. The example below shows 
// a simple trait defining a method that returns even numbers. The trait is used by two, unrelated, classes.
trait T {
  public int $x = 0;

  public function return_even() : int {
    invariant($this->x % 2 == 0, 'error, not even\n');
    $this->x = $this->x + 2;
    return $this->x;
  }
}

class C1 {
  use T;

  public function foo() : void {
    echo "C1: " . $this->return_even() . "\n";
  }
}

class C2 {
  use T;

  public function bar() : void {
    echo "C2: " . $this->return_even() . "\n";
  }
}

<<__EntryPoint>>
function main() : void {
  (new C1()) -> foo();
  (new C2()) -> bar();
}

// A class can use multiple traits, and traits themselves can use one or more traits. 
// The example below uses three traits, to generate even numbers, to generate odd numbers given a generator of even numbers, 
// and to test if a number is odd:
trait T1 {
  public int $x = 0;

  public function return_even() : int {
    invariant($this->x % 2 == 0, 'error, not even\n');
    $this->x = $this->x + 2;
    return $this->x;
  }
}

trait T2 {
  use T1;

  public function return_odd() : int {
    return $this->return_even() + 1;
  }
}

trait T3 {
  public static function is_odd(int $x) : bool {
    if ($x % 2 == 1) {
      return true;
    } else {
      return false;
    }
  }
}

class C {
  use T2;
  use T3;

  public function foo() : void {
    echo static::is_odd($this->return_odd()) . "\n";
  }
}

<<__EntryPoint>>
function main() : void {
  (new C()) -> foo();
}

