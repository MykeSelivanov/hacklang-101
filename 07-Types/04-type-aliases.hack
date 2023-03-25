// We can create an alias name for a type, and it is common to do so for non-trivial tuple and shape types. 
// Once such a type alias has been defined, that alias can be used in almost all contexts in which a type specifier is permitted. 
// Any given type can have multiple aliases, and a type alias can itself have aliases.

// A type alias can be created in two ways: using type and newtype.
type Complex = shape('real' => float, 'imag' => float);
newtype Point = (float, float);
// A type alias can include Generics as parameters
