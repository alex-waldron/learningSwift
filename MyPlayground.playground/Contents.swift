import Foundation

let currentDate = Date()
print(currentDate)
for i in 1...100000{
    print(i)
}

let newDate = Date()

let timeInterval = NSDateInterval(start: currentDate, end: newDate)
print(timeInterval.duration)

