import Foundation
import SwiftyGPIO

enum HardwareError: Error {
    case noAccess, unknown
}

print("Startup")

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPiPlusZero)

var maybegp = gpios[.P10]
guard var gp: GPIO = maybegp else {
    print("failed no access")
    throw(HardwareError.noAccess)
}

gp.direction = .OUT

for ii in 0...20 {
    gp.value = ii % 2
    sleep(2)
}

//gp.onChange { gpio in
//    print("Value changed. Now: " + String(gpio.value))
//}


