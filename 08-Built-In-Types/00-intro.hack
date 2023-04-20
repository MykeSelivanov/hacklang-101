// Primitive types
// Hack has the following primitive types: bool, int, float, string, and null.

// Union Types
// Hack supports union types, like:
// - num, where int and float are subtypes of num, and
// - arraykey, where int and string are subtypes of arraykey.

// The Syper Type
// Hack's super type is mixed, which represents any value. All other types are subtypes of mixed.
// A few things to know when working with mixed as a type:
// - The opposite of mixed is nothing, a special type at the "bottom" of all other types.
// - mixed is equivalent to ?nonnull. nonnull is a type that represents any value except null.

// Hack Arrays
// There are three types of Hack Arrays: vec, keyset and dict.
// Though not built-in as types, other alternatives exist in Hack Collections.

// Other Built-In Types
// Hack has other built-in types too, like: enum (with enum class and enum class labels), shape, and tuples.

// Function Return Types
// Other types like noreturn and void are only valid as function return types .

// Special Types
// These last few types are special in their utility and/or versatility: classname, dynamic, and this.
