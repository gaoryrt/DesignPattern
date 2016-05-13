var Stock = {
    creatNew: function(name){
        var stock = {};
        stock.name = name;
        stock.sell = function(){
            console.log("股票" + this.name + "卖出");
        };
        stock.buy = function(){
            console.log("股票" + this.name + "买入");
        };
        return stock;
    }
};

var NationalDebt = {
    creatNew: function(name){
        var nationalDebt = Stock.creatNew();
        nationalDebt.name = name;
        nationalDebt.sell = function(){
            console.log("国债" + this.name + "卖出");
        };
        nationalDebt.buy = function(){
            console.log("国债" + this.name + "买入");
        };
        return nationalDebt;
    }
};

var Realty = {
    creatNew: function(name){
        var realty = Stock.creatNew();
        realty.name = name;
        realty.sell = function(){
            console.log("房地产" + this.name + "卖出");
        };
        realty.buy = function(){
            console.log("房地产" + this.name + "买入");
        };
        return realty;
    }
};

var Fund = {
    creatNew: function(){
        var fund = {};
        var gu1 = Stock.creatNew("1");
        var gu2 = Stock.creatNew("2");
        var gu3 = Stock.creatNew("3");
        var nd1 = NationalDebt.creatNew("1");
        var rt1 = Realty.creatNew("1");
        fund.allsell = function(){
            gu1.sell();
            gu2.sell();
            gu3.sell();
            nd1.sell();
            rt1.sell();
        }
        fund.allbuy = function(){
            gu1.buy();
            gu2.buy();
            gu3.buy();
            nd1.buy();
            rt1.buy();
        };
        return fund;
    }
};

var jijin = Fund.creatNew();
jijin.allbuy();
jijin.allsell();