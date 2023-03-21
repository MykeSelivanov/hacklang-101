// Hack contains a mechanism to define generic—that is, type-less—classes, interfaces, and traits, 
// and to create type-specific instances of them via type parameters.
// Consider the following example in which Stack is a generic class having one type parameter, T, and that implements a stack:
class StackUnderflowException extends Exception {}

class Stack<T> {
  private vec<T> $stack;
  private int $stackPtr;

  public function __construct() {
    $this->stackPtr = 0;
    $this->stack = vec[];
  }

  public function push(T $value): void {
    $this->stack[] = $value;
    $this->stackPtr++;
  }

  public function pop(): T {
    if ($this->stackPtr > 0) {
      $this->stackPtr--;
      return $this->stack[$this->stackPtr];
    } else {
      throw new StackUnderflowException();
    }
  }
}

// Assuming we construct an instance for a Stack of ints, we can pass that to function use_int_stack, which can push values onto, 
// and pop values off, that stack, as shown. And in the same or different programs, we can have stacks of string, stacks of ?(int, float), 
// stacks of Employee, and so on, without have to write type-specific code for each kind of stack.
function use_int_stack(Stack<int> $stInt): void {
  $stInt->push(10);
  $stInt->push(20);
  $stInt->push(30);
  echo 'pop => '.$stInt->pop()."\n";
}