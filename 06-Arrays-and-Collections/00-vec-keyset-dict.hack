// vec, keyset and dict are value types. Any mutation produces a new value, and does not modify the original value.
// These types are referred to as 'Hack arrays'. Prefer using these types whenever you're unsure.

// vec
// A vec is an ordered, iterable data structure. It is created with the vec[] syntax.
// Creating a vec.
function get_items(): vec<string> {
  $items = vec['a', 'b', 'c'];
  return $items;
}

// vec can be accessed with a following syntax
$items = vec['a', 'b', 'c'];

// Accessing items by index.
$items[0]; // 'a'
$items[3]; // throws OutOfBoundsException

// Accessing items that might be out-of-bounds.
idx($items, 0); // 'a'
idx($items, 3); // null
idx($items, 3, 'default'); // 'default'

// Modifying items. These operations set $items
// to a modified copy, and do not modify the original value.
$items[0] = 'xx'; // vec['xx', 'b', 'c']
$items[] = 'd'; // vec['xx', 'b', 'c', 'd']

// Getting the length.
C\count($items); // 4

// Seeing if a vec contains a value or index.
C\contains($items, 'a'); // true
C\contains_key($items, 2); // true

// Iterating.
foreach ($items as $item) {
  echo $item;
}
// Iterating with the index.
foreach ($items as $index => $item) {
  echo $index; // e.g. 0
  echo $item;  // e.g. 'a'
}

// Equality checks. Elements are recursively compared with ===.
vec[1] === vec[1]; // true
vec[1, 2] === vec[2, 1]; // false

// Combining vecs.
Vec\concat(vec[1], vec[2, 3]); // vec[1, 2, 3]

// Removing items at an index.
$items = vec['a', 'b', 'c'];
$n = 1;
Vec\concat(Vec\take($items, $n), Vec\drop($items, $n + 1)); // vec['a', 'c']

// Converting from an Iterable.
vec(keyset[10, 11]); // vec[10, 11]
vec(Vector { 20, 21 }); // vec[20, 21]
vec(dict['key1' => 'value1']); // vec['value1']

// Type checks.
$items is vec<_>; // true