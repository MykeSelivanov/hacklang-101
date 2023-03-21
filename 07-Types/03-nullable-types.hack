// A type ?Foo is either a value of type Foo, or null.
function takes_nullable_str(?string $s): string {
  if ($s is null){
    return "default";
  } else {
    return $s;
  }
}

// nonnull is any value except null. You can use it to check if a value is not null:
function takes_nullable_str2(?string $s): string {
  if ($s is nonnull){
    return $s;
  } else {
    return "default";
  }
}

// This is slightly better than writing $s is string, as you don't need to repeat the type name.
// nonnull is also useful when using generics.
