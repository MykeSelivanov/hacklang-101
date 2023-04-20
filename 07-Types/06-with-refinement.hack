// Besides is-expressions, Hack supports another form of type refinements, which we refer to as with-refinements in this section. 
// This feature allows more precise typing of classes/interfaces/trait in a way 
// that specific type or context constant(s) are more specific (i.e., refined).

// For example, given the definition
interface Box {
  abstract const type T;
  abstract const ctx C super [defaults];
  public function get()[this::C]: this::T;
}
// one can write a function for which Hack statically guarantees the returned Set is valid, i.e., 
// it only contains integers and/or strings, and not objects of any other type:
function unwrap_as_singleton_set<Tb as arraykey>(
  Box with { type T = Tb } $int_or_string_box
): Set<Tb> {
  return Set { $int_or_string_box->get() };
}
// Independently, one can constrain context C in Box. For example, to work with Box subtypes which implement the 
// get method in a pure way (without side effects), with-refinements can be used as follows:
function unwrap_pure<Tb>(
  Box with { ctx C = []; type T = Tb } $box,
)[]: Tb {
  return $box->get(); // OK (type-checker knows `get` must have the empty context list)
}
// A notable use case unlocked by this feature is that a with-refinement can appear in return positions, e.g.:
// API
function wrap_number(num $x): Box with { type T = num } {
  return new IntBox($x);
}
// implementation details (subject to change):
class IntBox implements Box {
  const type T = num;
  const ctx C = [];

  public function __construct(private this::T $v) {}
  public function get()[]: this::T { return $this->v; }
}