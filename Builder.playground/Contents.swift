//为了满足『必须继承这几个方法，而且初始化器的功能不能变』的功能
//这里不得不写成一个协议加一个父类
//下方的瘦builder和胖builder同时继承这俩
protocol PersonBuilder {
    var g:String {get set}
    var p:String {get set}
    init(g:String,p:String)
    func BuildHead()
    func BuildBody()
    func BuildArmleft()
    func BuildArmRight()
    func BuildLegLeft()
    func BuildLegRight()
}

class FatherPersonBuilder {
    var g = "看到这段字就说明你发现了新大陆"
    var p = "看到这段字就说明你发现了新大陆"
    required init(g:String,p:String){
        self.g = g
        self.p = p
    }
}

//构造的细节在这里面定义
class PersonThinBuilder:FatherPersonBuilder, PersonBuilder {
    func BuildBody() {
        print("thinBody")
    }
    func BuildHead() {
        print("thinHead")
    }
    func BuildLegLeft() {
        print("legLeft")
    }
    func BuildArmleft() {
        print("armLeft")
    }
    func BuildArmRight() {
        print("armRight")
    }
    func BuildLegRight() {
        print("legRight")
    }
}

class PersonFatBuilder:FatherPersonBuilder,PersonBuilder {
    func BuildBody() {
        print("F-A-T-B-o-d-y")
    }
    func BuildHead() {
        print("F-A-T-H-e-a-d")
    }
    func BuildLegLeft() {
        print("l-e-g-L-e-f-t")
    }
    func BuildArmleft() {
        print("a-r-m-L-e-f-t")
    }
    func BuildArmRight() {
        print("a-r-m-R-i-g-h-t")
    }
    func BuildLegRight() {
        print("l-e-g-R-i-g-h-t")
    }
}

//客户端只会解除到这个director类，不知道具体的实现
//这里将行为抽象出来，虽然不知道具体怎样操作，但是这一步是肯定要做的
class PersonDirector{
    func CreatePerson(pb:PersonBuilder){
        pb.BuildLegRight()
        pb.BuildArmRight()
        pb.BuildArmleft()
        pb.BuildLegLeft()
        pb.BuildBody()
        pb.BuildHead()
    }
}

//这里都是createperson的同一个createperson方法，但是效果却不一样
var p = "color.yellow"
var ptb = PersonThinBuilder(g: "pictureBox1.CreateGraphics", p: p)
var pdThin = PersonDirector()
pdThin.CreatePerson(ptb)

var pfb = PersonFatBuilder(g: "pictureBox1.CreateGraphics", p: p)
var pdFat = PersonDirector()
pdFat.CreatePerson(pfb)


