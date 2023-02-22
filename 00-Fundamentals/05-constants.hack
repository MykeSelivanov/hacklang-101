// A constant can be defined in one of two ways: using the const keyword at the top level, or inside a class or interface.

const int MAX_COUNT = 123;
class C {
  const float MAX_HEIGHT = 10.5;
  const float UPPER_LIMIT = C::MAX_HEIGHT - 1;
}

<<__EntryPoint>>
function main(): void {
  echo "MAX_COUNT = ".MAX_COUNT."\n";
  echo "MAX_HEIGHT = ".C::MAX_HEIGHT."\n";
  echo "UPPER_LIMIT = ".C::UPPER_LIMIT."\n";
}
