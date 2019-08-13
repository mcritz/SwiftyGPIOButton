import SwiftyGPIO

let gpios = SwiftyGPIO.GPIOs(for:.RaspberryPiRevPlusZero)

gpios[.P10]!.direction = .OUT

