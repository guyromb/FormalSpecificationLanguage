module lang::specifications::alloy::TypesAndLiterals

import lang::specifications::\syntax::Lexical;
import lang::specifications::\syntax::TypesAndLiterals;
import lang::specifications::alloy::utils::Info;
import String; 
import util::Math;

str literal2alloy((Int)`Inf`,VarMap vm) = "max[Int]";
str literal2alloy(Int i,VarMap vm){
	if(toInt("<i>") > pow(2,8)){throw "Due to limited bounds the Integer can not be higher than 2^8";} 
	else return "<i>";
}
str literal2alloy(Period p,VarMap vm) = "<p>";

str literal2alloy((Literal)`<Int i>`,VarMap vm) = literal2alloy(i,vm);
str literal2alloy((Literal)`<Period p>`,VarMap vm) = literal2alloy(p,vm);
str literal2alloy((Literal)`<Frequency f>`,VarMap vm) = "<f>";
str literal2alloy((Literal)`True`,VarMap vm) = "{}";
str literal2alloy((Literal)`False`,VarMap vm) = "!{}";
str literal2alloy((Literal)`<Date d>`,VarMap vm) = "getDate[<d.day>,<month2Int(d.month)>,0]";
str literal2alloy((Literal)`<Percentage p>`,VarMap vm)= "getPercentage[" + replaceAll("<p>","%","") + "]";


str type2alloy((Type)`Boolean`) = "Bool";
str type2alloy((Type)`Integer`) = "Int";
str type2alloy((Type)`Date`) = "Date";
str type2alloy((Type)`Period`) = "Period";
str type2alloy((Type)`Percentage`) = "Percentage";
str type2alloy((Type)`map[<Type key> : <Type val>]`) = "<type2alloy(key)> -\> <type2alloy(val)>";
str type2alloy((Type)`list[ <Type t>]`) = "seq <type2alloy(t)>";
str type2alloy((Type)`set[ <Type t>]`) = "set <type2alloy(t)>";
str type2alloy((Type)`Freq`) = "Frequency";
str type2alloy((Type)`<CustomType t>`) = "<t>";

int month2Int(Month m){
  str month = "<m>";
  switch(month){
    case "Jan" : return 1;
    case "Feb" : return 2;
    case "Mar" : return 3;
    case "Apr" : return 4;
    case "May" : return 5;
    case "Jun" : return 6;
    case "Jul" : return 7;
    case "Aug" : return 8;
    case "Sep" : return 9;
    case "Oct" : return 10;
    case "Nov" : return 11;
    case "Dec" : return 12;
  }
}




