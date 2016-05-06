//父类雷锋
class LeiFeng {
    func Sweep() {
        print("扫地")
    }
    func Wash() {
        print("洗衣")
    }
    func BuyRice() {
        print("买米")
    }
}

//定义创建对象的接口
protocol IFactory {
    func  CreateLeiFeng() -> LeiFeng
}

class Undergraduate:LeiFeng {}

class Volunteer:LeiFeng {}

//两个实例工厂，使学雷锋的不同的人的实例化延迟到这里创建。
class UndergraduateFactory:IFactory {
    func CreateLeiFeng() -> LeiFeng {
        let a = Undergraduate()
        return a
    }
}

class VolunteerFactory:IFactory {
    func CreateLeiFeng() -> LeiFeng {
        let a = Volunteer()
        return a
    }
}

let factory = UndergraduateFactory()
//实例化并没有涉及到undergraduate这个类
let student = factory.CreateLeiFeng()

student.BuyRice()
student.Sweep()
student.Wash()
