//
class Resume {
    private var name:String = ""
    private var sex:String = ""
    private var age:String = ""
    private var timeArea:String = ""
    private var company:String = ""
    
    init(name: String, sex:String, age:String, timeArea:String, company:String) {
        self.name = name
        self.sex = sex
        self.age = age
        self.timeArea = timeArea
        self.company = company
    }
    func SetPersonalInfo(sex:String, age:String) {
        self.sex = sex
        self.age = age
    }
    func SetWorkExperience(timeArea:String, company:String) {
        self.timeArea = timeArea
        self.company = company
    }
    func Display() {
        print("\(name) \(sex) \(age) \n工作经历：\(timeArea) \(company)")
    }
    //将自己的值用于初始化，完成克隆
    func Clone() -> Resume {
        return Resume(name: self.name, sex: self.sex, age: self.age, timeArea: self.timeArea, company: self.company)
    }
}

var a = Resume(name: "大鸟",sex: "",age: "",timeArea: "",company: "")
a.SetPersonalInfo("男", age: "29")
a.SetWorkExperience("1998-2000", company: "XX公司")

//这里都是从a克隆的，像是二叉树
var b = a.Clone()
b.SetWorkExperience("1998-2006", company: "YY公司")

var c = a.Clone()
c.SetPersonalInfo("男", age: "24")

//可以尝试c从b克隆，答案又不一样
a.Display()
b.Display()
c.Display()
