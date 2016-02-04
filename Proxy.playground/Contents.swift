//协议用于规范接口
protocol GiveGift {
    func GiveDolls()
    func GiveFlowes()
    func GiveChocolate()
}

class SchoolGirl {
    private var name:String = ""
    func get() -> String {
        return self.name
    }
    func set(name:String) {
        self.name = name
    }
}

//原类，委托者，就是为了保护它的访问权
class Pursuit:GiveGift {
    var mm = SchoolGirl()
    func Pursuit(mm:SchoolGirl) {
        self.mm = mm
    }
    func GiveDolls() {
        print("\(mm.name),送你娃娃")
    }
    func GiveFlowes() {
        print("\(mm.name),送你花")
    }
    func GiveChocolate() {
        print("\(mm.name),送你巧克力")
    }
}

//委托的角色用于控制访问，这里并没有定义各个方法的功能
class Proxy:GiveGift {
    var gg = Pursuit()
    func Proxy(mm:SchoolGirl) {
        //实例化原类被放在委托中，保护了原类安全
        gg = Pursuit()
        gg.Pursuit(mm)
    }
    func GiveDolls() {
        gg.GiveDolls()
    }
    func GiveFlowes() {
        gg.GiveFlowes()
    }
    func GiveChocolate() {
        gg.GiveChocolate()
    }
}



let jiaojiao = SchoolGirl()
jiaojiao.name = "李娇娇"

//实例化一个代理角色
let daili = Proxy()
daili.Proxy(jiaojiao)
daili.GiveFlowes()
daili.GiveDolls()
daili.GiveChocolate()
