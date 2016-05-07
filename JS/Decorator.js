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
        finery.decorate = function(component) {
            this.component = component;
        };
        finery.show = function() {
            this.component.show();
        };
        return finery;
    }
};

var TShirt = {
    creatNew: function(name) {
        var tShirt = Finery.creatNew(name);
        tShirt.show = function(){
            console.log("T恤");
            tShirt.component.show();
        };
        return tShirt;
    }
};

var Trouser = {
    creatNew: function(name) {
        var trouser = Finery.creatNew(name);
        trouser.show = function(){
            console.log("毛衣");
            trouser.component.show();
        };
        return trouser;
    }
};

var Shoes = {
    creatNew: function(name) {
        var shoes = Finery.creatNew(name);
        shoes.show = function(){
            console.log("鞋子");
            shoes.component.show();
        };
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