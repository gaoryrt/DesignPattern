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

var CashContex = {
    creatNew: function() {
        var cashContex = {};
        cashContex.cs = CashSuper.creatNew();
        cashContex.cashContex = function(type) {
            switch (type) {
                case "normal":
                    var cs0 = CashNormal.creatNew();
                    this.cs = cs0;
                    break;
                case "rebate":
                    var cs1 = CashRebate.creatNew();
                    cs1.cashRebate(0.88);
                    this.cs = cs1;
                    break;
                case "return":
                    var cs2 = CashReturn.creatNew();
                    cs2.cashReturn(299, 88);
                    this.cs = cs2;
                    break;
                default: break;
            }
        };
        cashContex.getResult = function(money) {
            return this.cs.acceptCash(money);
        };
        return cashContex;
    }
};

OK = function(type, totalPrice) {
    var cc = CashContex.creatNew();
    cc.cashContex(type);
    console.log(totalPrice, cc.getResult(totalPrice));
};

OK("normal", 800);
OK("rebate", 800);
OK("return", 800);