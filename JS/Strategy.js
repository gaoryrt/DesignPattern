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
        cashReturn.acceptCash = function(monry) {
            var judge = (money >= this.moneyCondition);
            return (judge ? (money - ~~(money/this.moneyCondition)*this.moneyReturn) : money);
        };
    }
};