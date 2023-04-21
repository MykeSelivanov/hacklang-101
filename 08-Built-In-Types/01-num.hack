// The type num can represent any int or float value. This type can be useful when specifying the interface to a function. 
// Consider the following function declarations from the math library:
function sqrt(num $arg): float;
function log(num $arg, ?num $base = null): float;
function abs<T as num>(T $number): T;
function mean(Container<num> $numbers): ?float;
// The square-root function sqrt takes a num and returns a float. The log-to-any-base function log takes a num and a 
// nullable-of-num and returns a float. The generic absolute-value function abs has one type parameter, T, 
// which is constrained to having type num or a subtype of num. abs takes an argument of type T and returns a value of the same type. 
// The arithmetic-mean function mean takes a generic type Container-of-type-num and returns a nullable-of-float.