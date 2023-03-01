// The binary pipe operator, |>, evaluates the result of a left-hand expression and stores the result in $$, 
// the pre-defined pipe variable. The right-hand expression must contain at least one occurrence of $$.

// With the pipe operator, you can chain function calls
$x = vec[2,1,3]
  |> Vec\map($$, $a ==> $a * $a) // $$ with value vec[2,1,3]
  |> Vec\sort($$); // $$ with value vec[4,1,9]

// Written in another way, the code above is syntactically equivalent to:
Vec\sort(Vec\map(vec[2, 1, 3], $a ==> $a * $a)); // Evaluates to vec[1,4,9]

// Await cannot be used as an expression to the right of the pipe operator.