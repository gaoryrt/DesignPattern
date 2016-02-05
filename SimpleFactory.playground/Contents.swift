//三个子类均继承cashsuper，然后集中在factory中，客户端调用
//定义一个不能被实例化的抽象类
//现金收取超类的抽象方法，正常收费，原价返回
class CashSuper{
    private init (){}
    func acceptCash(money:Double) -> Double{
        return money
    }
}

//定义三种收费方式，继承自上面的那个类
//收取现金，返回当前价格
class CashNormal: CashSuper {}

//打折收费，输入折扣率
class CashRebate: CashSuper {
    private var moneyRebate: Double = 1
    func CashRebate(moneyRebate:Double) {
        self.moneyRebate = moneyRebate
    }
    override func acceptCash(money: Double) -> Double {
        return money * moneyRebate
    }
}

//满-减收费，输入返利条件与返利值
class CashReturn: CashSuper {
    private var moneyCondition: Double = 0
    private var moneyReturn: Double = 0
    func CashReturn(moneyCondition:Double, moneyReturn:Double) {
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    override func acceptCash(money: Double) -> Double {
        var result = money
//        满足返利条件
        if (money >= moneyCondition){
            result = money - Double(Int(money / moneyCondition)) * moneyReturn
        }
        return result
    }
}

//调用工厂以完成实例化，用哪个，哪个被实例化
//现金收取工厂
class CashFactory {
//    根据条件返回对象
    func creatCashAccept(type:String) -> CashSuper {
        var cs: CashSuper = CashSuper()
        switch type{
        case "normal": cs = CashNormal()
        case "rebate": let cr: CashRebate = CashRebate()
            cr.CashRebate(0.88)
            cs = cr
        case "return": let cr: CashReturn = CashReturn()
            cr.CashReturn(299, moneyReturn: 88)
            cs = cr
        default: break
        }
        return cs
    }
}

//这里是收银程序
func OK(type:String , totalprice: Double) {
//    实例化
    let csuper: CashSuper = CashFactory().creatCashAccept(type)
//    多态得到折后价格
    let total = csuper.acceptCash(totalprice)
    print("原价\(totalprice),折后\(total)")
}

//开始收银
var name = ["normal","rebate","return"]
for i in name{
    OK(i, totalprice: 400)
}
