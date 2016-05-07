//协议用于规范接口
protocol Pursuit {
    func GiveDolls()
    func GiveFlowes()
    func GiveChocolate()
    func kiss()
}
/// 定义一个妹纸的类
class SchoolGirl {
    private var name:String
    private var love = 0
    init (name:String) {
        self.name = name
    }
    func getLove() -> Int {
        return love
    }
    func GiveDolls() {
        print("\(name)收到了送的娃娃")
        love += 1
    }
    func GiveFlowes() {
        print("\(name)收到了你送的花")
        love += 1
    }
    func GiveChocolate() {
        print("\(name)收到了你送的巧克力")
        love += 1
    }
    func kiss() {
        print("你亲到了\(name)!")
        love = 50
    }

}

//定义追求者。
class Boy:Pursuit {
    private var name:String
    private var mm:Pursuit?
    init (name:String) {
        self.name = name
    }
    func pursuit(mm:Pursuit) {
        self.mm = mm
    }
    func GiveDolls() {
        print("你企图送妹纸娃娃：",terminator:"")
        mm?.GiveDolls()
    }
    func GiveFlowes() {
        print("你企图送妹花：",terminator:"")
        mm?.GiveFlowes()
    }
    func GiveChocolate() {
        print("你企图送妹纸巧克力：",terminator:"")
        mm?.GiveChocolate()
    }
    func kiss() {
        print("你企图法式湿吻妹纸：",terminator:"")
        mm?.kiss()
    }

}

/// 定义一个代理，用来保护妹纸,它控制色狼的动作；所有的追求行为都要通过代理来过滤。
class MMProxy:Pursuit {
    private let mm:SchoolGirl
    init (mm:SchoolGirl) {
        self.mm = mm
    }
    
    func GiveDolls() {
        mm.GiveDolls()
    }
    func GiveFlowes() {
        mm.GiveFlowes()
    }
    /**
     如果好感度不够高巧克力甩你一脸。
     */
    func GiveChocolate() {
        if mm.getLove() < 2 {
            print("Not now~")
        } else {
            mm.GiveChocolate()
        }
    }
    /**
     如果好感度不够高，就不能亲亲直接扭送公安局！
     */
    func kiss() {
        if mm.getLove() < 3 {
            print("流氓，报警!")
        } else {
            mm.kiss()
        }
    }
}



let jiaojiao = SchoolGirl(name: "李娇娇")

let boy = Boy(name: "香蕉")

let mm = MMProxy(mm: jiaojiao)

boy.pursuit(mm)
boy.kiss()
boy.GiveChocolate()
boy.GiveDolls()
boy.kiss()
boy.GiveFlowes()
boy.kiss()
boy.GiveChocolate()
boy.kiss()



