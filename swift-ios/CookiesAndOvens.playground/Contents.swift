import Darwin

enum CookieState {
    case Gooey, Done, Burnt
}

enum CookieBakingError : ErrorType {
    case WrongTemperature
}

class Cookie : CustomStringConvertible {
    class var totalBakeTime : Int { return 0 }
    class var bakeTemp : Int { return 350 }

    var timeBaked = 0
    var remainingTime : Int {
        return self.dynamicType.totalBakeTime - self.timeBaked
    }
    var description : String { return "🍪" }

    required init() {}

    func bake(time: Int, temp: Int) throws {
        guard temp == self.dynamicType.bakeTemp else {
            throw CookieBakingError.WrongTemperature
        }

        self.timeBaked += time
    }

    func status() -> CookieState {
        if remainingTime == 0 {
            return CookieState.Done
        } else if remainingTime > 0 {
            return CookieState.Gooey
        } else {
            return CookieState.Burnt
        }
    }

}

class ChocolateChip : Cookie {
    override class var totalBakeTime : Int { return 10 }
}

class Oatmeal : Cookie {
    override class var totalBakeTime : Int { return 12 }
}

class Snickerdoodle : Cookie {
    override class var totalBakeTime : Int { return 20 }
    override class var bakeTemp : Int { return 400 }
}

class Batch : CustomStringConvertible {
    var cookies : [Cookie] = []
    var description : String {
        get {
            var str = ""
            for cookie in cookies {
                str += cookie.description
            }
            return str
        }
    }

    init(cookieType: Cookie.Type, count: Int) {
        for _ in 1...count {
            self.cookies.append(cookieType.init())
        }
    }

    func sample() -> Cookie? {
        let randIndex = random() % self.cookies.count
        return self.cookies[randIndex]
    }
}

struct Oven {
    var contents : [Batch] = []
    var anyItems : Bool {
        get {
            return contents.count > 0
        }
    }
    var temp : Int = 0

    mutating func addBatch(batch: Batch) {
        contents.append(batch)
    }

    mutating func removeBatch(target: Batch) -> Batch? {
        if let idx = self.contents.indexOf({ $0 === target }) {
            self.contents.removeAtIndex(idx)
            return target
        }
        return nil
    }

    func setTimer(time: Int, temp: Int) {
        for batch in self.contents {
            for cookie in batch.cookies {
                do {
                    try cookie.bake(time, temp: temp)
                } catch is CookieBakingError {
                    print("Can't bake \(cookie.dynamicType) at \(temp)"); return
                } catch {
                    print("Something went wrong!"); return
                }
            }
        }
    }
}

let choc = Batch(cookieType: ChocolateChip.self, count: 12)
let oats = Batch(cookieType: Oatmeal.self, count: 18)
let snks = Batch(cookieType: Snickerdoodle.self, count: 8)

var myOven = Oven()

myOven.addBatch(choc)
myOven.setTimer(8, temp: 350)
choc.sample()?.status()

myOven.addBatch(oats)
myOven.setTimer(10, temp: 350)
choc.sample()?.status()
myOven.removeBatch(choc)
oats.sample()?.status()

myOven.addBatch(snks)
myOven.setTimer(10, temp: 400)
myOven.removeBatch(snks)

myOven.setTimer(2, temp: 350)
oats.sample()?.status()

myOven.removeBatch(oats)

myOven.anyItems

myOven.addBatch(snks)
myOven.setTimer(20, temp: 400)
snks.sample()?.timeBaked
snks.sample()?.status()
snks.sample()?.status()
