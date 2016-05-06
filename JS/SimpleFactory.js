// 父类名为cashsuper，三个子类CashNormal、CashRebate、CashRebate，后面两个子类重写了acceptCash方法。
var CashSuper = {
    creatNew: function(){
        var cashSuper = {};
        cashSuper.acceptCash = function(money){return money;};
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
            this.moneyReturn = moneyReturn;
            this.moneyCondition = moneyCondition;
        };
        cashReturn.acceptCash = function(money) {
            var judge = (money >= this.moneyCondition);
            return (judge ? (money - ~~(money/this.moneyCondition)*this.moneyReturn) : money);
        };
        return cashReturn;
    }
};

// 提前在简单工厂中实例化
var CashFactory = {
    creatNew: function(){
        var cashFactory = {};
        cashFactory.creatCashAccept = function(type) {
            var cs;
            switch (type) {
                case "normal":
                    cs = CashNormal.creatNew();break;
                case "rebate":
                    cs = CashRebate.creatNew();
                    cs.cashRebate(0.88);
                    break;
                case "return":
                    cs = CashReturn.creatNew();
                    cs.cashReturn(299, 88);
                    break;
                default: break;
            }
            return cs;
        };
        return cashFactory;
    }
};

// 收银程序
var OK = function(type, totalPrice) {
    var csuper = CashFactory.creatNew().creatCashAccept(type);
    var total = csuper.acceptCash(totalPrice);
    console.log(totalPrice,total);
};

OK("normal", 800);
OK("rebate", 800);
OK("return", 800);
