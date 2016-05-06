class CashSuper{
    private init (){}
    func acceptCash(money:Double) -> Double{
        return money
    }
}

class CashNormal: CashSuper {}

class CashRebate: CashSuper {
    private var moneyRebate: Double = 1
    func CashRebate(moneyRebate:Double) {
        self.moneyRebate = moneyRebate
    }
    override func acceptCash(money: Double) -> Double {
        return money * moneyRebate
    }
}

class CashReturn: CashSuper {
    private var moneyCondition: Double = 0
    private var moneyReturn: Double = 0
    func CashReturn(moneyCondition:Double, moneyReturn:Double) {
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    override func acceptCash(money: Double) -> Double {
        var result = money
        if (money >= moneyCondition){
            result = money - Double(Int(money / moneyCondition)) * moneyReturn
        }
        return result
    }
}

class CashContext {
    private var cs:CashSuper = CashSuper()
    func CashContext(type:String){
        switch type{
        case "normal":
            let cs0 = CashNormal()
            cs = cs0
        case "rebate":
            let cs1 = CashRebate()
            cs1.CashRebate(0.88)
            cs = cs1
        case "return":
            let cs2 = CashReturn()
            cs2.CashReturn(299, moneyReturn: 88)
            cs = cs2
        default:break
        }
    }
    func GetResult(money:Double) -> Double {
        return cs.acceptCash(money)
    }
}

//这里是收银程序 AKA client
func OK(type:String,totalprice: Double) {
    //这里只关联了 CashContext一个类
    //对比工厂类型，少了CashSuper类
    //耦合度降低
    let cc = CashContext()
    //对比工厂，客户端的所有选择、变化都由context来承担
    cc.CashContext(type)
    print("原价\(totalprice)，折后\(cc.GetResult(totalprice))")
}

//开始收银
var name = ["normal","rebate","return"]
for i in name{
    OK(i, totalprice: 400)
}
