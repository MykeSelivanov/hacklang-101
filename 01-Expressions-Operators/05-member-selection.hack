// The operator -> is used to access instance properties and instance methods on objects.
// The operator ?-> allows access to objects that may be null.
class IntBox {
    private int $x;

    public function __construct(int $x) {
        $this->x = $x; // assigning to property
    }

    public function getX(): int {
        return $this->x; // accessing property
    }
}

function test(?IntBox $ib): ?int {
    return $ib->getX();
}

<<__EntryPoint>>
function main(): void {
    $ib = new IntBox(123);
    $x = $ib->getX();
}

