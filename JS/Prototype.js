var Resume = {
    creatNew: function(name, sex, age, timeArea, company){
        var resume = {};
        var resumeName = name, resumeSex = sex, resumeAge = age, resumeTimeArea = timeArea, resumeCompany = company;
        resume.setPersonalInfo = function(sex, age, name){
            resumeName = (name == undefined ? resumeName : name);
            resumeSex = sex;
            resumeAge = age;
        };
        resume.setWorkExperience = function(timeArea, company){
            resumeTimeArea = timeArea;
            resumeCompany = company;
        };
        resume.display = function(){
            console.log(resumeName, resumeSex, resumeAge, resumeTimeArea,resumeCompany);
        };
        resume.clone = function(){
            return Resume.creatNew(resumeName, resumeSex, resumeAge, resumeTimeArea,resumeCompany);
        };
        return resume;
    }
};

var a = Resume.creatNew("大鸟");
a.setPersonalInfo("男", "29");
a.setWorkExperience("1998-2006", "A公司");

var b = a.clone();
b.setPersonalInfo("男", "29", "小菜");
b.setWorkExperience("2005-2016","公司B");

var c = a.clone();
c.setPersonalInfo("女", "22", "小叽");

a.display();
b.display();
c.display();