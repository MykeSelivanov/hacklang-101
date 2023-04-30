// A shape is a lightweight type with named fields. It's similar to structs or records in other programming languages.
$my_point = shape('x' => -3, 'y' => 6, 'visible' => true);

// A shape is created with the shape keyword, with a series of field names and values.
$server = shape('name' => 'db-01', 'age' => 365);
$empty = shape();

// Shape fields are accessed with array indexing syntax, similar to dict. Note that field names must be string literals.
// OK.
$n = $server['name'];

// Not OK (type error).
$field = 'name';
$n = $server[$field];

// Shapes are copy-on-write.
$s1 = shape('name' => 'db-01', 'age' => 365);
$s2 = $s1;

$s2['age'] = 42;
// $s1['age'] is still 365.

// A shape can be constructed incrementally. The type checker will infer a different type after each assignment.
// $s has type shape().
$s = shape();

// $s now has type shape('name' => string).
$s['name'] = 'db-01';

// $s now has type shape('name' => string, 'age' => int).
$s['age'] = 365;

