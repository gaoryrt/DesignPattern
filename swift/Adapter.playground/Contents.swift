protocol Player {
    var name:String {get set}
    init(name:String)
    func Attack()
    func Defense()
}

//同一使用attack和defense方法
class Forwards:Player {
    var name = ""
    required init(name: String) {
        self.name = name
    }
    func Attack() {
        print("前锋\(self.name)进攻")
    }
    func Defense() {
        print("前锋\(self.name)防守")
    }
}

class Center:Forwards {
    override func Attack() {
        print("中锋\(self.name)进攻")
    }
    override func Defense() {
        print("中锋\(self.name)防守")
    }
}

class Guards:Forwards {
    override func Attack() {
        print("后卫\(self.name)进攻")
    }
    override func Defense() {
        print("后卫\(self.name)防守")
    }
}

//外籍球员没有attack方法和defense方法
class ForeignCenter {
    var name = ""
    init(name: String) {
        self.name = name
    }
    func 进攻() {
        print("外籍中锋\(self.name)进攻")
    }
    func 防守() {
        print("外籍中锋\(self.name)防守")
    }
}

//使用translator将外籍球员和一般球员的接口同一起来
class Translator:Player {
    var name = ""
    required init(name: String) {
        self.name = name
    }
    func Attack() {
        let wjzf = ForeignCenter(name: self.name)
        wjzf.进攻()
    }
    func Defense() {
        let wjzf = ForeignCenter(name: self.name)
        wjzf.防守()
    }
}

//使用时不知道外籍球员的专业方法也能工作
var b = Forwards(name: "巴蒂尔")
b.Attack()
var m = Guards(name: "麦迪")
m.Attack()
var ym = Translator(name: "姚明")
ym.Attack()
ym.Defense()