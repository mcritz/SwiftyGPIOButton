import SwiftyGPIO

print("Startup")

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPiPlusZero)

enum HardwareError: Error {
    case noAccess, unknown
}

var maybegp = gpios[.P10]
guard var gp: GPIO = maybegp else { throw(HardwareError.noAccess) }
gp.direction = .IN
gp.pull = .down

gp.onChange { gpio in
    print("Value changed. Now: " + String(gpio.value))
}


