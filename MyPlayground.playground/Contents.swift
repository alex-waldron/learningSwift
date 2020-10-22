
import UIKit

var array = [1,3,43,3,2,4]
func addOne(n1:Int) -> Int
{
    return n1 + 1
}
let arrayString = array.map{"\($0)"}
print(arrayString)
