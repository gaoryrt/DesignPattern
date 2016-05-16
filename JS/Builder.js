"use strict";
class PersonBuilder {
    constructor (g, p) {
        this.g = g;
        this.p = p;
    }
    BuildHead(){}
    BuildBody(){}
    BuildArmleft(){}
    BuildArmRight(){}
    BuildLegLeft(){}
    BuildLegRight(){}
}

class PersonThinBuilder extends PersonBuilder {
    BuildBody() {
        console.log("thinBody")
    }
    BuildHead() {
        console.log("thinHead")
    }
    BuildLegLeft() {
        console.log("legLeft")
    }
    BuildArmleft() {
        console.log("armLeft")
    }
    BuildArmRight() {
        console.log("armRight")
    }
    BuildLegRight() {
        console.log("legRight")
    }
}

class PersonFatBuiler extends PersonBuilder {
    BuildBody() {
        console.log("F-A-T-B-o-d-y")
    }
    BuildHead() {
        console.log("F-A-T-H-e-a-d")
    }
    BuildLegLeft() {
        console.log("l-e-g-L-e-f-t")
    }
    BuildArmleft() {
        console.log("a-r-m-L-e-f-t")
    }
    BuildArmRight() {
        console.log("a-r-m-R-i-g-h-t")
    }
    BuildLegRight() {
        console.log("l-e-g-R-i-g-h-t")
    }
}

class PersonDirector {
    CreatePerson(pb){
        pb.BuildLegRight()
        pb.BuildArmRight()
        pb.BuildArmleft()
        pb.BuildLegLeft()
        pb.BuildBody()
        pb.BuildHead()
    }
}

var p = "color.yellow";
var ptb = new PersonThinBuilder("pictureBox1.CreateGraphics", p);
var pdThin = new PersonDirector();
pdThin.CreatePerson(ptb);

var pfb = new PersonFatBuiler("pictureBox1.CreateGraphics", p);
var pdFat = new PersonDirector();
pdFat.CreatePerson(pfb);