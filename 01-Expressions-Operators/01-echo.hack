<<__EntryPoint>>
function main(): void {
    print("Hello, World!\n");

// This intrinsic function converts the value of an expression to string (if necessary) and writes the string to standard output.
$v1 = true;
$v2 = 123.45;
echo '>>'.$v1.'|'.$v2."<<\n"; // outputs ">>1|123.45<<"

$v3 = "abc{$v2}xyz";
echo "$v3\n";

}