var Pursuit = {
    creatNew: function() {
        var pursuit = {};
        pursuit.giveDolls = function() {};
        pursuit.giveFlowers = function() {};
        pursuit.giveChocolate = function() {};
        pursuit.kiss = function() {};
        return pursuit;
    }
};

var SchoolGirl = {
    creatNew: function(name) {
        var schoolGirl = {};
        var privateLove = 0;
        schoolGirl.name = name;
        schoolGirl.getLove = function() {
            return privateLove;
        };
        schoolGirl.giveDolls = function() {
            privateLove += 1;
            console.log(this.name + "收到了娃娃");
        };
        schoolGirl.giveFlowers = function() {
            privateLove += 1;
            console.log(this.name + "收到了花");
        };
        schoolGirl.giveChocolate = function() {
            privateLove += 1;
            console.log(this.name + "收到了巧克力");
        };
        schoolGirl.kiss = function() {
            privateLove = 50;
            console.log(this.name + "被亲到了");
        };
        return schoolGirl;
    }
};

var Boy = {
    creatNew: function(name) {
        var boy = Pursuit.creatNew();
        var privateName = name;
        boy.pursuit = function(mm) {
            this.mm = mm;
        };
        boy.giveDolls = function() {
            console.log("你送了娃娃");
            this.mm.giveDolls();
        };
        boy.giveFlowers = function() {
            console.log("你送了花");
            this.mm.giveFlowers();
        };
        boy.giveChocolate = function() {
            console.log("你送了巧克力");
            this.mm.giveChocolate();
        };
        boy.kiss = function() {
            console.log("你上前亲吻");
            this.mm.kiss();
        };
        return boy;
    }
};

var MMProxy = {
    creatNew: function(mm) {
        var mmProxy = Pursuit.creatNew();
        mmProxy.giveDolls = function() {
            mm.giveDolls();
        };
        mmProxy.giveFlowers = function() {
            mm.giveFlowers();
        };
        mmProxy.giveChocolate = function() {
            (mm.getLove() < 2) ? console.log(mm.name + "说：你拿走，我不要"): mm.giveChocolate();
        };
        mmProxy.kiss = function() {
            (mm.getLove() < 3) ? console.log(mm.name + "说：去你的"): mm.kiss();
        };
        return mmProxy;
    }
};

var jiaojiao = SchoolGirl.creatNew("娇娇");
var banana = Boy.creatNew("香蕉");
var mm = MMProxy.creatNew(jiaojiao);

banana.pursuit(mm);
banana.kiss();
banana.giveDolls();
banana.giveChocolate();
banana.kiss();
banana.giveFlowers();
banana.kiss();
banana.giveChocolate();
banana.kiss();