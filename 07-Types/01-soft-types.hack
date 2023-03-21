// A soft type hint <<__Soft>> Foo allows you to add types to code without crashing if you get the type wrong.
function probably_int(<<__Soft>> int $x): @int {
  return $x + 1;
}

function definitely_int(int $x): int {
  return $x + 1;
}

// Calling definitely_int("foo") will produce an error at runtime, whereas probably_int("foo") will only log a warning.
// Soft type hints are useful when migrating partial code or very dynamic code to strict mode. 
// Once you've fixed your code, and you're not seeing any more warnings, then you can remove the <<__Soft>>.