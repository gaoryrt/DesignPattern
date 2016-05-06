//通知者，同一了接口notify用于批量通知，attach用于添加订阅者，detach用于取消订阅者
class Subject {
    func Attach(observer:Observer){}
    func Detach(observer:Observer){}
    func Notify(){}
    var SubjectState = ""
}

//订阅者，update为各自订阅者的订阅动作（更新方法）
class Observer {
    var name = ""
    var sub = Subject()
    init(name:String,sub:Subject){
        self.name = name
        self.sub = sub
    }
    func Update(){}
}

//两个订阅者
class StockObserver:Observer {
    override func Update() {
        print("\(sub.SubjectState)\(name) 关闭股票行情，继续工作！")
    }

}

class NBAObserver:Observer{
    override func Update() {
        print("\(sub.SubjectState)\(name) 关闭NBA直播，继续工作！")
    }
}

//通知者的实现，将有关状态存入具体观察者对象，在具体主题的内部状态改变时进行通知
class Boss:Subject {
    var observers:[Observer] = [Observer(name: "", sub: Subject())]
    var action = ""
    override func Attach(observer:Observer){
        observers.append(observer)
    }
    override func Detach(observer:Observer){
        observers.removeAtIndex(observers.indexOf({$0.name == observer.name})!)
    }
    override func Notify() {
        for o in observers{
            o.Update()
        }
    }
}

var huhansan = Boss()
//添加订阅
var tongshi1 = StockObserver(name: "未关己", sub: huhansan)
huhansan.Attach(tongshi1)
//添加订阅
var tongshi2 = NBAObserver(name: "易观察", sub: huhansan)
huhansan.Attach(tongshi2)
//！！取消订阅！！
huhansan.Detach(tongshi1)
huhansan.SubjectState = "我胡汉三又回来了！"
huhansan.Notify()


