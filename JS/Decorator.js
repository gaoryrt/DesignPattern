var Person = {
    creatNew: function(name) {
        var person = {};
        var staticName = name;
        person.show = function() {
            console.log(staticName);
        };
        return person;
    }
};

var Finery = {
    creatNew: function(name) {
        var finery = Person.creatNew(name);
        finery.brand = "none";
        finery.decorate = function(component) {
            this.component = component;
        };
        finery.show = function() {
            console.log(this.brand);
            this.component.show();
        };
        return finery;
    }
};

var TShirt = {
    creatNew: function(name) {
        var tShirt = Finery.creatNew(name);
        tShirt.brand = "T恤";
        return tShirt;
    }
};

var Trouser = {
    creatNew: function(name) {
        var trouser = Finery.creatNew(name);
        trouser.brand = "毛衣";
        return trouser;
    }
};

var Shoes = {
    creatNew: function(name) {
        var shoes = Finery.creatNew(name);
        shoes.brand = "鞋子";
        return shoes;
    }
};

var xiaocai = Person.creatNew("小菜");
var tshe = TShirt.creatNew();
var mouyiyi = Trouser.creatNew();
var xiexie = Shoes.creatNew();

tshe.decorate(xiaocai);
mouyiyi.decorate(tshe);
xiexie.decorate(mouyiyi);
xiexie.show();