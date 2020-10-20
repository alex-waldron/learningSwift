
struct Enemy{
    var health: Int
    var attackStrength: Int
    init(health: Int, attackStrength: Int) {
        self.health = health
        self.attackStrength = attackStrength
    }
    mutating func takeDamage(amount: Int){
        health -= amount
    }
    
    func move(){
        print("walk forwards")
    }
    func attack(){
        print("hit has landed, does \(attackStrength) damage.")
    }
    
}
