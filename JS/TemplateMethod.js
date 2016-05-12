var TestPaper = {
    creatNew: function(){
      var testPaper = {};
      testPaper.testQuestion1 = function(){
        console.log("第一个问题");
        console.log(this.answer1);
      };
      testPaper.testQuestion2 = function(){
        console.log("第二个问题");
        console.log(this.answer2);
      };
      testPaper.testQuestion3 = function(){
        console.log("第三个问题");
        console.log(this.answer3);
      };
      testPaper.answer1 = "";
      testPaper.answer2 = "";
      testPaper.answer3 = "";
      return testPaper;
    }
};

var TestPaperA = {
    creatNew: function(){
        var studen = TestPaper.creatNew();
        studen.answer1 = "A";
        studen.answer2 = "B";
        studen.answer3 = "C";
        return studen;
    }
};

var TestPaperB = {
    creatNew: function(){
        var studen = TestPaper.creatNew();
        studen.answer1 = "C";
        studen.answer2 = "B";
        studen.answer3 = "D";
        return studen;
    }
};

var student1 = TestPaperA.creatNew();
student1.testQuestion1();
student1.testQuestion2();
student1.testQuestion3();

var student2 = TestPaperB.creatNew();
student2.testQuestion1();
student2.testQuestion2();
student2.testQuestion3();