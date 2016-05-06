//每个装饰对象只关心自己的功能，不需关心如何被添加到对象链中
class Person {
    init(){}
    private var name:String = ""
    init(name:String) {
        self.name = name
    }
    func Show() {
        print(self.name)
    }
}

//本应将component这个接口单独写
//由于只有一个需要考虑的装饰条件、且只有一个接口，就和装饰的父类写在一起
class Finery:Person {
    var component = Person()
    func Decorate(component:Person) {
        self.component = component
    }
    //注意这里的操作是被提出到了Person类中的Show()
    override func Show() {
        component.Show()
        }
}

//三个实例化的装饰
class TShirt:Finery {
    override func Show() {
        //先重写，再进行本类的功能，相当于进行了装饰
        print("TShirt")
        super.Show()
    }
    
}

class Trouser:Finery {
    override func Show() {
        print("Trouser")
        super.Show()
    }
}

class Shoes:Finery {
    override func Show() {
        print("Shoes")
        super.Show()
    }
}

var xiaocai = Person(name: "小菜")
var trouser = Trouser()
var tshirt = TShirt()
var shoes = Shoes()

//通过对象实例化时的互相包装使装饰有了顺序
tshirt.Decorate(xiaocai)
trouser.Decorate(tshirt)
shoes.Decorate(trouser)
shoes.Show()

