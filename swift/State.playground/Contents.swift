protocol State {
    func WriteProgram(w:Work)
}

// 面向对象设计其实就是希望做到代码的责任分解
class ForenoonState:State {
    func WriteProgram(w: Work) {
        if (w.Hour < 12){
            print("现在\(w.Hour)点，上午精神")
        }
        else {
            //递交给下一个类
            w.SetState(NoonState())
            w.WriteProgram()
        }
    }
}

class NoonState:State {
    func WriteProgram(w: Work) {
        if (w.Hour < 13){
            print("现在\(w.Hour)点，饿了午饭，犯困午休")
        }
        else {
            //递交给下一个类
            w.SetState(AfternoonState())
            w.WriteProgram()
        }
    }
}

class AfternoonState:State {
    func WriteProgram(w: Work) {
        if (w.Hour < 17){
            print("现在\(w.Hour)点，下午还行继续努力")
        }
        else {
            w.SetState(EveningState())
            w.WriteProgram()
        }
    }
}

class EveningState:State {
    func WriteProgram(w: Work) {
        if (w.TaskFinished){
            w.SetState(RestState())
            w.WriteProgram()
        }
        else{
            if (w.Hour < 21) {
                print("现在\(w.Hour)点，正在加班")
            }
            else {
                w.SetState(SleepingState())
                w.WriteProgram()
            }
        }
    }
}

class SleepingState:State {
    func WriteProgram(w: Work) {
        print("现在\(w.Hour)点，睡着了")
    }
}

class RestState:State {
    func WriteProgram(w: Work) {
        print("现在\(w.Hour)点，下班回家了")
    }
}

class Work {
    var Hour = 0
    var current:State
    init(){
        current = ForenoonState()
    }
    var TaskFinished:Bool = false
    func SetState(s:State){
        current = s
    }
    func WriteProgram(){
        current.WriteProgram(self)
    }
}

var emergency = Work()
for i in Range(start: 9,end: 20){
    emergency.Hour = i
    emergency.WriteProgram()
}
emergency.TaskFinished = true
for i in Range(start: 21,end: 24){
    emergency.Hour = i
    emergency.WriteProgram()
}
