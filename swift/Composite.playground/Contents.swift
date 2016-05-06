//提供统一接口
protocol Component {
    var name:String {get}
    init(name:String)
    func Add(c:Component)
    func Remove(c:Component)
    func Display(depth:Int)
}

class Leaf:Component {
    var name = ""
    required init(name: String) {
        self.name = name
    }
    func Add(c: Component) {
        print("Cannot add to a leaf")
    }
    func Remove(c: Component) {
        print("Cannot remove from a leaf")
    }
    func Display(depth:Int) {
        //暂时没有找到一种简单的方法重复输出，就用了for in
        for _ in 1...depth {
            print("-", separator: "", terminator: "")
        }
        print("\(name)")
    }
}

class Composite:Component {
    var children:[Component] = []
    var name = ""
    required init(name: String) {
        self.name = name
    }
    func Add(c: Component) {
        children.append(c)
    }
    func Remove(c: Component) {
        children.removeAtIndex(children.indexOf({$0.name == c.name})!)
    }
    func Display(depth:Int) {
        for _ in 1...depth {
            print("-", separator: "", terminator: "")
        }
        print("\(name)")
        //输出之后的树
        for component in children {
            component.Display(depth+2)
        }
    }
}

var root = Composite(name: "root")
root.Add(Leaf(name: "Leaf A"))
root.Add(Leaf(name: "Leaf B"))

var comp = Composite(name: "Composite X")
comp.Add(Leaf(name: "Leaf XA"))
comp.Add(Leaf(name: "Leaf XB"))

root.Add(comp)

var comp2 = Composite(name: "Composite XY")
comp2.Add(Leaf(name: "Leaf XYA"))
comp2.Add(Leaf(name: "Leaf XYB"))

comp.Add(comp2)

root.Add(Leaf(name: "Leaf C"))

var leaf = Leaf(name: "Leaf D")
root.Add(leaf)
//又不要d了
root.Remove(leaf)

root.Display(1)



