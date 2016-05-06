class Originator {
    //这里吧三行写成一行了，private 直接暴露出来了，不好意思
    var State = ""
    func CreateMemento() -> Memento {
        return Memento(state: State)
    }
    func SetMemento(menmento:Memento) {
        State = menmento.state
    }
    func Show(){
        print("State=\(State)")
    }
}

class Memento {
    var state = ""
    init(state:String){
        self.state = state
    }
}

class Caretaker {
    var memento = Memento(state: "")
}

var o:Originator = Originator()
o.State = "On"
o.Show()
//初始状态

var c:Caretaker = Caretaker()
c.memento = o.CreateMemento()
//建立备忘c，如有需要还可以建立另外的

o.State = "Off"
o.Show()
//调整状态

o.SetMemento(c.memento)
o.Show()
//恢复