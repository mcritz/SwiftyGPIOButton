import SwiftyGPIO

print("Startup")

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPiPlusZero)

var maybegp = gpios[.P10]
guard var gp: GPIO = maybegp else { throw("Couldn’t access GPIO P10") }
gp.direction = .IN
gp.pull = .down

gp.onChange { gpio in
    print("Value changed. Now: " + String(gpio.value))
}


