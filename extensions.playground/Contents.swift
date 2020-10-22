import UIKit

let button = UIButton(frame: CGRect(x:0, y:0, width: 50, height: 50))
button.backgroundColor = .red
extension UIButton{
    func makeCircular (){
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height/2
    }
}
button.makeCircular()
/*extension Double{
    func round(to places: Int) -> Double{
        let multiplier = pow(10, Double(places))
        var n = self
        n *= multiplier
        n.round()
        n /= multiplier
        return n
        
        
    }
}

let myDouble = 3.141592654

let myRoundedDouble = String(format: "%.1f", myDouble)
print(myDouble.round(to: 6))*/
