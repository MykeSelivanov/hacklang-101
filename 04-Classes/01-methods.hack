// A method is a function defined in a class.
// You can access the current instance with $this inside a method
class Person {
    public string $name = "anonymous";

    public function greeting(): string {
        return "Hi, my name is ".$this->name;
    }
}

// To call an instance method, you can use ->
$p = new Person();
echo $p->greeting();

// Static methods
// A static method is a function in a class that is called without an instance. Since there's no instance, $this is not available.
class Person2 {
    public static function typicalGreeting(): string {
        return "Hello";
    }
}

// To call a statis method, use ::
echo Person::typicalGreeting();
