class Stock {
    var name = ""
    init (name:String) {
        self.name = name
    }
    func Sell() {
        print("股票\(self.name)卖出")
    }
    func Buy() {
        print("股票\(self.name)买入")
    }
}

class NationalDebt:Stock {
    override func Sell() {
        print("国债\(self.name)卖出")
    }
    override func Buy() {
        print("股票\(self.name)买入")
    }
}

class Realty:Stock {
    override func Sell() {
        print("房地产\(self.name)卖出")
    }
    override func Buy() {
        print("房地产\(self.name)买入")
    }
}

//将所有的功能放在一个facade之中
//facade作为中间类，客户端与原类交互不直接接触
//外观类需要了解所有的子系统的方法和属性，进行组合以备外界调用
class Fund {
    let gu1 = Stock(name: "1")
    let gu2 = Stock(name: "2")
    let gu3 = Stock(name: "3")
    let nd1 = NationalDebt(name: "1")
    let rt1 = Realty(name: "1")
    
    func BuyFund() {
        gu1.Buy()
        gu2.Buy()
        gu3.Buy()
        nd1.Buy()
        rt1.Buy()
    }
    
    func SellFund() {
        gu1.Sell()
        gu2.Sell()
        gu3.Sell()
        nd1.Sell()
        rt1.Sell()
    }
}

//这里客户端就完全和几个原类分离开了
var jijin = Fund()
jijin.BuyFund()
jijin.SellFund()

