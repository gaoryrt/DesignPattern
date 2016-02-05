//模板方法 把不变的行为都版一到超类，去除子类的重复代码
class TestPaper {
    func TestQuestion1() {
        print("杨过得到，后来给了郭靖，炼成倚天剑、屠龙刀的玄铁可能是「」 a.球磨铸铁 b.马口铁 c.高速合金钢 d.碳素纤维")
        print("\(self.Answer1())")
    }
    func TestQuestion2() {
        print("杨过、陈英、陆无双铲除了情花，造成了「」 a.是这种植物不再害人 b.是一种珍惜物种灭绝 c.破坏了那个生物圈的生态平衡 d.造成该地区沙漠化")
        print("\(self.Answer2())")
    }
    func TestQuestion3() {
        print("蓝凤凰致使华山师徒、桃谷六仙呕吐不止，如果你是大夫，会给他们开什么药 [] a.阿司匹林 b.牛黄解毒片 c.氟哌酸 d.盒大量的生牛奶 e.以上全不对")
        print("\(self.Answer3())")
    }
    func Answer1() -> String {
        return ""
    }
    func Answer2() -> String {
        return ""
    }
    func Answer3() -> String {
        return ""
    }
}

//一下两个子类除了abcd的值不同，其他都都被放在了超类当中，简化了代码
class TestPaperA: TestPaper {
    override func Answer1() -> String {
        return "b"
    }
    override func Answer2() -> String {
        return "c"
    }
    override func Answer3() -> String {
        return "a"
    }
}

class TestPaperB: TestPaper {
    override func Answer1() -> String {
        return "c"
    }
    override func Answer2() -> String {
        return "a"
    }
    override func Answer3() -> String {
        return "a"
    }
}


print("学生A的答案")
var studentA = TestPaperA()
studentA.TestQuestion1()
studentA.TestQuestion2()
studentA.TestQuestion3()

print("学生B的答案")
var studentB = TestPaperB()
studentB.TestQuestion1()
studentB.TestQuestion2()
studentB.TestQuestion3()
