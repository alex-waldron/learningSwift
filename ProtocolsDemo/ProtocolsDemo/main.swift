protocol CanFly {
    func fly()
}

extension CanFly {
    func fly(){
        print("the objext goes up")
    }
}

class Bird{
    var isFemale = true
    
    func layEgg(){
        if isFemale{
            print("lay an egg")
        }
    }

}

class Eagle: Bird, CanFly {
    func fly() {
        print("Eagle starts flying")
    }
    
    
    func soar(){
        print("glides through the air")
    }
}

class Penguin: Bird{
    func swim(){
        print("swim through the water")
    }
}

struct FlyingMuseum{
    func flyingDemo(flyingObject: CanFly){
        flyingObject.fly()
    }
}

struct Airplane: CanFly{


}

let myEagle = Eagle()
let myPenguin = Penguin()

myEagle.fly()
myEagle.layEgg()
myEagle.soar()

myPenguin.layEgg()
myPenguin.swim()

let museum = FlyingMuseum()
museum.flyingDemo(flyingObject: myEagle)

let myPlane = Airplane()
myPlane.fly()
