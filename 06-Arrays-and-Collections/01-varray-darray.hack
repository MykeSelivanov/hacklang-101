// varray, darray and varray_or_darray are legacy value types for storing iterable data.. 
// They are also called 'PHP arrays' and will eventually be removed.
// PHP arrays are immutable value types, just like Hack arrays. 
// Unlike Hack arrays, they include legacy behaviors from PHP that can hide bugs.

// varray
// As of HHVM 4.103, varray is aliased to vec. Use vec.
// Creating a varray.
function get_items(): varray<string> {
  $items = varray['a', 'b', 'c'];
  return $items;
}

// Accessing items by index.
$items[0]; // 'a'
$items[3]; // throws OutOfBoundsException

// Accessing items that might be out-of-bounds.
idx($items, 0); // 'a'
idx($items, 3); // null
idx($items, 3, 'default'); // 'default'

// Modifying items. These operations set $items
// to a modified copy, and do not modify the original value.
$items[0] = 'xx'; // varray['xx', 'b', 'c']
$items[] = 'd'; // varray['xx', 'b', 'c', 'd']

// Getting the length.
C\count($items); // 4

// Iterating.
foreach ($items as $item) {
  echo $item;
}
// Iterating with the index.
foreach ($items as $index => $item) {
  echo $index; // e.g. 0
  echo $item;  // e.g. 'a'
}

// Equality checks.
varray[1] === varray[1]; // true
varray[1, 2] === varray[2, 1]; // false

// Converting from an Iterable.
varray(vec[10, 11]); // varray[10, 11]
varray(keyset[10, 11]); // varray[10, 11]

// darray
// As of HHVM 4.103, darray is aliased to dict. Use dict.
// A darray is an ordered key-value data structure.
// Creating a darray.
function get_items(): darray<string, int> {
  $items = darray['a' => 1, 'b' => 3];
  return $items;
}

// Accessing items by key.
$items['a']; // 1
$items['foo']; // throws OutOfBoundsException

// Accessing keys that may be absent.
idx($items, 'a'); // 1
idx($items, 'z'); // null
idx($items, 'z', 'default'); // 'default'

// Inserting, updating or removing values in a darray. These operations
// set $items to a modified copy, and do not modify the original value.
$items['a'] = 42; // darray['a' => 42, 'b' => 3]
$items['z'] = 100; // darray['a' => 42, 'b' => 3, 'z' => 100]
unset($items['b']); // darray['a' => 42, 'z' => 100]

// Getting the keys.
Vec\keys(darray['a' => 1, 'b' => 3]); // vec['a', 'b']

// Getting the values.
vec(darray['a' => 1, 'b' => 3]); // vec[1, 3]

// Getting the length.
C\count($items); // 2

// Checking if a dict contains a key or value.
C\contains_key($items, 'a'); // true
C\contains($items, 3); // true

// Iterating values.
foreach ($items as $value) {
  echo $value; // e.g. 1
}
// Iterating keys and values.
foreach ($items as $key => $Value) {
  echo $key;   // e.g. 'a'
  echo $value; // e.g. 1
}

// Equality checks. === returns false if the order does not match.
darray[] === darray[]; // true
darray[0 => 10, 1 => 11] === darray[1 => 11, 0 => 10]; // false

// Converting from an Iterable.
darray(vec['a', 'b']); // darray[0 => 'a', 1 => 'b']
darray(Map {'a' => 5}); // darray['a' => 5]