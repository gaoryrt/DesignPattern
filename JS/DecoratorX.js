function BasicBicycle(){}
BasicBicycle.prototype = {
    wash: function(){},
    ride: function(){},
    getPrice: function(){
        return 1000;
    }
};

function bicycleBell( bicycle ) {
    var price = bicycle.getPrice();
    bicycle.bell = function(){
        console.log("dindin");
    };
    bicycle.getPrice = function(){
        return price + 100;
    };
    return bicycle;
}

var bicycleA = new BasicBicycle();
bicycleA = bicycleBell( bicycleA );
console.log(bicycleA.getPrice());
bicycleA.bell();