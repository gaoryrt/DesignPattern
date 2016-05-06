// 父类名为cashsuper，三个子类CashNormal、CashRebate、CashRebate，后面两个子类重写了acceptCash方法。
var CashSuper = {
    creatNew: function(){
        var cashSuper = {};
        cashSuper.acceptCash = function(money) {return money;};
        return cashSuper;
    }
};

var CashNormal = {
    creatNew: function(){
        var cashNormal = CashSuper.creatNew();
        return cashNormal;
    }
};

var CashRebate = {
    creatNew: function(){
        var cashRebate = CashSuper.creatNew();
        cashRebate.moneyRebate = 1;
        cashRebate.cashRebate = function(moneyRebate) {
            this.moneyRebate = moneyRebate;
        };
        cashRebate.acceptCash = function(money) {
            return money*this.moneyRebate;
        };
        return cashRebate;
    }
};

var CashReturn = {
    creatNew: function(){
        var cashReturn = CashSuper.creatNew();
        cashReturn.moneyCondition = 0;
        cashReturn.moneyReturn = 0;
        cashReturn.cashReturn = function(moneyCondition, moneyReturn) {
            this.moneyCondition = moneyCondition;
            this.moneyReturn = moneyReturn;
        };
        cashReturn.acceptCash = function(money) {
            // 三元运算符的条件
            var judge = (money >= this.moneyCondition);
            // 两个波浪号是取整
            return (judge ? (money - ~~(money/this.moneyCondition)*this.moneyReturn) : money);
        };
        return cashReturn;
    }
};

// 前面都跟简单工厂一样，下面把工厂分开了,耦合性进一步降低了。
// 这里专注实例化和返回值
var CashContex = {
    creatNew: function() {
        var cashContex = {};
        cashContex.cs = CashSuper.creatNew();
        cashContex.cashContex = function(csuper) {
            this.cs = csuper;
        };
        cashContex.getResult = function(money) {
            return this.cs.acceptCash(money);
        };
        return cashContex;
    }
};

// 在OK中定义相关参数，然后输出
OK = function(type, totalPrice) {
    var cc = CashContex.creatNew();
    switch (type) {
        case "normal":
            cc.cashContex(CashNormal.creatNew());
            break;
        case "rebate":
            var cr0 = CashRebate.creatNew();
            cr0.cashRebate(0.88);
            cc.cashContex(cr0);
            break;
        case "return":
            var cr1 = CashReturn.creatNew();
            cr1.cashReturn(299, 88);
            cc.cashContex(cr1);
            break;
        default: break;
    }
    console.log(totalPrice, cc.getResult(totalPrice));
};

OK("normal", 800);
OK("rebate", 800);
OK("return", 800);
