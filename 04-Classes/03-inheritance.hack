// Hack supports single inheritance between classes.
// Classes can access things defined in the parent class, unless they are private.
class IntBox {
  public function __construct(protected int $value) {}

  public function get(): int {
    return $this->value;
  }
}

class MutableIntBox extends IntBox {
  public function set(int $value): void {
    $this->value = $value;
  }
}

// Overriding methods
// You can override methods in subclasses by defining a method with the same name
// If a method is intended to override a method in a parent class, you should annotate it with <<__Override>>. 
// This has no runtime effect, but ensures you get a type error if the parent method is removed.
class IntBox {
  public function __construct(protected int $value) {}

  public function get(): int {
    return $this->value;
  }
}

class IncrementedIntBox extends IntBox {
  <<__Override>>
  public function get(): int {
    return $this->value + 1;
  }
}

// Hack does not support method overloading. Subclasses methods must have a return type, 
// parameters and visibility that is compatible with the parent class.
class NumBox {
  public function __construct(protected num $value) {}

  protected function get(): num {
    return $this->value;
  }
}

class FloatBox extends NumBox {
  <<__Override>>
  public function get(): float {
    return (float)$this->value;
  }
}

// The only exception is constructors, which may have incompatible signatures with the parent class. 
// You can use <<__ConsistentConstruct>> to require subclasses to have compatible types.
class User {
  // This constructor takes one argument.
  public function __construct(protected string $name) {}
}

class Player extends User {
  // But this constructor takes two arguments.
  <<__Override>>
  public function __construct(protected int $score, string $name) {
    parent::__construct($name);
  }
}

// Calling Overridden Methods
// You can use parent:: to call an overridden method in the parent class.
class IntBox {
  public function __construct(protected int $value) {}

  public function get(): int {
    return $this->value;
  }
}

class IncrementedIntBox extends IntBox {
  <<__Override>>
  public function get(): int {
    return parent::get() + 1;
  }
}

// This also works for statis methods
class MyParent {
  public static function foo(): int {
    return 0;
  }
}

class MyChild extends MyParent {
  <<__Override>>
  public static function foo(): int {
    return parent::foo() + 1;
  }
}

// Abstract classes
// An abstract class cannot be instantiated
// Abstract classes are similar to interfaces, but they can include implementations of methods.
// This allows new Dog() but not new Animal()
abstract class Animal {
  public abstract function greet(): string;
}

class Dog extends Animal {
  <<__Override>>
  public function greet(): string {
    return "woof!";
  }
}

// Final classes
// A final class cannot have subclasses
final class Dog {
  public function greet(): string {
    return "woof!";
  }
}
// You can also combine final and abstract on classes. This produces a class that cannot be instantiated or have subclasses. 
// The class is effectively a namespace of grouped functionality.
abstract final class Example {
  public static function callMe(int $i): int {
    return static::helper($i);
  }

  private static function helper(int $i): int {
    return $i + 1;
  }
}

// If your class has subclasses, but you want to prevent additional subclasses, use <<__Sealed>>.
// If you want to inherit from a final class for testing, use <<__MockClass>>.

// Final Methods
// A final method cannot be overriden in subclasses
class IntBox {
    public function __construct(protected int $value) {}

    final public function get(): int {
        return $this->value;
    }
}
