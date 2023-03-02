// The foreach statement iterates over the set of elements in a given collection, starting at the beginning, 
// executing a single statement each iteration. On each iteration, the value of the current element is assigned 
// to the corresponding variable, as specified. The loop body is executed zero or more times.
$colors = vec["red", "white", "blue"];
foreach ($colors as $color) {
  // ...
}

// As each array element has an index as well as a value, we can access both.
// The as clause gives us access to the array key.
$colors = vec["red", "white", "blue"];
foreach ($colors as $key => $color) {
  // ...
}

// We can cause each element's value to be ignored, using $_
 $a = dict['a' => 10, 'f' => 30];
  foreach ($a as $key => $_) { // 10 and 30 are ignored
    // ...
  }