// Use an enum (enumerated type) to create a set of named, constant, immutable values.
// In Hack, enums are limited to int or string (as an Arraykey), or other enum values.

// By using the as operator to enforce type, you can initialize your enum with static expressions that reference other enum values.
enum BitFlags: int as int {
  F1 = 1; // value 1
  F2 = BitFlags::F1 << 1; // value 2
  F3 = BitFlags::F2 << 1; // value 4
  F4 = 4 + 3; // value 7
}

// With an enum, we can create a placement-direction system with names like Top, Bottom, Left, Right, and Center, 
// then direct output accordingly to write text to the top, bottom, left, right, or center of a window.
enum Position: int {
  Top = 0;
  Bottom = 1;
  Left = 2;
  Right = 3;
  Center = 4;
}

function writeText(string $text, Position $pos): void {
  switch ($pos) {
    case Position::Top:
      // ...
      break;
    case Position::Center:
      // ...
      break;
    case Position::Right:
      // ...
      break;
    case Position::Left:
      // ...
      break;
    case Position::Bottom:
      // ...
      break;
  }
}

<<__EntryPoint>>
function main(): void {
  writeText("Hello", Position::Bottom);
  writeText("Today", Position::Left);
}

// Library Methods
// All enums implement these public static methods.
// getValues() returns a dict where the keys are the enum names and the values are the enum constant values.
// getNames() returns a dict, but is flipped: the keys are the enum constant values and the values are the enum's named constants.
enum Position: int {
  Top = 0;
  Bottom = 1;
  Left = 2;
  Right = 3;
  Center = 4;
}

<<__EntryPoint>>
function main(): void {
  $names = Position::getNames();
  echo " Position::getNames() ---\n";
  foreach ($names as $key => $value) {
    echo "\tkey >$key< has value >$value<\n";
  }

  $values = Position::getValues();
  echo "Position::getValues() ---\n";
  foreach ($values as $key => $value) {
    echo "\tkey >$key< has value >$value<\n";
  }

  Dict\flip(Position::getValues()); // safe flip of values as keys
}

// assert($value) checks if a value exists in an enum, and if it does, returns the value; if the value does not exist, 
// throws an UnexpectedValueException.
// coerce($value) checks if a value exists in an enum, and if it does, returns the value; if the value does not exist, returns null.
enum Bits: int {
  B1 = 2;
  B2 = 4;
  B3 = 8;
 }

<<__EntryPoint>>
function main(): void {
  Bits::assert(2); // 2
  Bits::assert(16); // UnexpectedValueException

  Bits::coerce(2); // 2
  Bits::coerce(2.0); // null
  Bits::coerce(16); // null
}

// assertAll($traversable) calls assert($value) on every element of the traversable (e.g. Hack Arrays); 
// if at least one value does not exist, throws an UnexpectedValueException.
enum Bits: int {
  B1 = 2;
  B2 = 4;
  B3 = 8;
 }

<<__EntryPoint>>
function main(): void {
  $all_values = vec[2, 4, 8];
  $some_values = vec[2, 4, 16];
  $no_values = vec[32, 64, 128];

  Bits::assertAll($all_values); // vec[2, 4, 8]
  Bits::assertAll($some_values); // throws on 16, UnexpectedValueException
  Bits::assertAll($no_values); // throws on 32, UnexpectedValueException
}

// isValid($value) checks if a value exists in an enum, and if it does, returns true; if the value does not exist, it returns false.
enum Bits: int {
  B1 = 2;
  B2 = 4;
  B3 = 8;
 }

<<__EntryPoint>>
function main(): void {
  \var_dump(Bits::isValid(2));
  \var_dump(Bits::isValid(2.0));
  \var_dump(Bits::isValid("2.0"));
  \var_dump(Bits::isValid(8));
}

// The operators is and as/?as behave similarly, but not exactly, to isValid() (similar to is) and assert()/coerce() (similar to as/?as).
enum MyEnum: int {
  FOO = 1;
}

<<__EntryPoint>>
function main(): void {
1 is MyEnum; // true
1 as MyEnum; // 1

42 is MyEnum; // false
42 as MyEnum; // TypeAssertionException

'foo' is MyEnum; // false
'foo' as MyEnum; // TypeAssertionException

'1' is MyEnum; // CAUTION - true
'1' as MyEnum; // CAUTION - '1'
}

// Enum Inclusion
// You can define an enum to include all of the constants of another enum with the use keyword.
enum E1: int as int {
  A = 0;
}
enum E2: int as int {
  B = 1;
}
enum F: int {
  // same-line alternative: use E1, E2;
  use E1;
  use E2;
  C = 2;
}