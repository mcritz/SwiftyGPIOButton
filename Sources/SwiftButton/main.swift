import SwiftyGPIO

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPiPlusZero)

var gp = gpios[.P10]
guard gp = gp else { throw("Couldn’t access GPIO P10") }
gp.direction = .IN
gp.pull = .down

gp.onChange { gpio in
    print("Value changed. Now: " + String(gpio.value))
}


