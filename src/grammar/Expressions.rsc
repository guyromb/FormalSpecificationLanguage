module grammar::Expressions

extend grammar::TypesAndLiterals;
extend grammar::Lexical;

syntax Expr
  = bracket "(" Expr ")"
  > non-assoc (	
    var : Var
    | functioncall : FunctionName "[" ExprList "]"
    | property: PropertyOfVar
    | oldproperty: "old" PropertyOfVar
    | literal: LiteralPlus
    | makeSet: "{" Expr "..." Expr "}"
  )
  > not: "!" Expr
  > left (
    mul: Expr lhs "*" Expr rhs
    | inset: Expr "in" Expr
    | div: Expr "/" Expr
    | modulo: Expr "%" Expr
  )
  > left (
    add: Expr "+" Expr
    | sub: Expr "-" Expr
  )
  > non-assoc (
    lt: Expr "\<" Expr
    | leq: Expr "\<=" Expr
    | gt: Expr "\>" Expr
    | geq: Expr "\>=" Expr
    | eq: Expr "==" Expr
    | neq: Expr "!=" Expr
  )
  > left and: Expr "&&" Expr
  > left or: Expr "||" Expr
  ;
    
syntax PropertyOfVar = 
    propertyOfVar : Var var Fields f
    | propertyOfVar : Var var Fields f "[" ExprList "]"
    ;
    
syntax Fields = DotField+ fields;
syntax DotField = "." Field f;
syntax ExprList = {Expr ","}* exprs;

syntax LiteralPlus =
  lit: Literal 
  | mapLit: "("  MapElements ")"
  | listLit: "[" ExprList  "]"
  | setLit: "{" ExprList "}"
  ;

syntax MapElements = {MapElement ","}* elems;
syntax MapElement = Expr key ":" Expr val;