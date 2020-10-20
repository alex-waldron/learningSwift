
struct MyOptional {
    var prop = 1234
    func method() {
        print("I am the struct method")
    }
}

let myOptional: MyOptional?

myOptional = MyOptional()

print(myOptional?.prop)
