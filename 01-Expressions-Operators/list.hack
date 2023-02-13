// list() is special syntax for unpacking tuples. It looks like a function, but it isn't one. 
// It can be used in positions that you would assign into.
// The list() will consume the tuple on the right and assign the variables inside of itself in turn. 
// If the types of the tuple elements differ, the list() syntax will make sure that the type information is preserved.

function takes_string(string $_): void {}
function takes_int(int $_): void {}
function takes_bool(bool $_): void {}

<<__EntryPoint>>
function main(): void {
  $tuple = tuple('string', 1, false);
  list($string, $int, $bool) = $tuple;
  takes_string($string);
  takes_int($int);
  takes_bool($bool);
  echo "The typechecker understands the types of list().\n";

// My personal favorite place to put a list() is inside a foreach($vec_of_tuples as list($one, $two, $three)).
  $vec_of_tuples = vec[
  tuple('A', 'B', 45),
  tuple(123.678, 'b', 'hello'),
  tuple('X', 'test', 'Z'),
];

foreach ($vec_of_tuples as list($first, $second, $third)) {
  echo "{$first} {$second} {$third}\n";
}
}



