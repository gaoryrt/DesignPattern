var LeiFeng = {
    creatNew: function(){
        var leiFeng = {};
        leiFeng.sweep = function(){
            console.log("扫地");
        };
        leiFeng.wash = function(){
            console.log("洗衣服");
        };
        leiFeng.buy = function(){
            console.log("买米");
        };
        return leiFeng;
    }
};

var IFactory = {
    creatNew: function(){
        var iFactory = {};
        iFactory.creatLeiFeng = function(){};
        return iFactory;
    }
};

var Undergraduate = {
    creatNew: function(){
        var undergraduate = LeiFeng.creatNew();
        return undergraduate;
    }
};

var Volunteer = {
    creatNew: function(){
        var volunteer = LeiFeng.creatNew();
        return volunteer;
    }
};

var UndergraduateFactory = {
    creatNew: function(){
        var undergraduateFactory = IFactory.creatNew();
        undergraduateFactory.creatLeiFeng = function(){
            return Undergraduate.creatNew();
        };
        return undergraduateFactory;
    }
};

var VolunteerFactory = {
    creatNew: function(){
        var volunteerFactory = IFactory.creatNew();
        volunteerFactory.creatLeiFeng = function(){
            return Volunteer.creatNew();
        };
        return volunteerFactory;
    }
};

var factoryInstance = UndergraduateFactory.creatNew();
var studentInstance = factoryInstance.creatLeiFeng();

studentInstance.buy();
studentInstance.sweep();
studentInstance.wash();
