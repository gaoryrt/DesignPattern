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
    func CashContext(csuper:CashSuper){
        self.cs = csuper
    }
    func GetResult(money:Double) -> Double {
        return cs.acceptCash(money)
    }
}

//这个是收银程序
func OK(type:String , totalprice: Double) {
    //    生成相应对象
    let cc = CashContext()
    switch type{
        case "normal":
            cc.CashContext(CashNormal())
        case "rebate":
            let cr0 = CashRebate()
            cr0.CashRebate(0.88)
            cc.CashContext(cr0)
        case "return":
            let cr1 = CashReturn()
            cr1.CashReturn(299, moneyReturn: 88)
            cc.CashContext(cr1)
        default:break
    }
    print("原价\(totalprice)，折后\(cc.GetResult(totalprice))")
}

//开始收银
var name = ["normal","rebate","return"]
for i in name{
    OK(i, totalprice: 800)
}
