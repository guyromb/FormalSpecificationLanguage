module lang::specifications::alloy::utils::StringTemplates

import lang::specifications::\syntax::Specifications;

str getModuleName(Specification sn) = "module <sn>\n";

str getImports(){
return "
	'open util/ordering[SavingsAccount]
	'open util/integer
	'open types/date
	'open types/period
	'open types/frequency
	'open types/percentage
\n";
}

str predShow() = "pred show{} \nrun show <getCommandScope()>\n";
//TODO Set Scope self, Percentage over all Ints (2^7)
str getCommandScope() = "for 5 SavingsAccount, exactly 5 Date, 7 Int, exactly 128 Percentage";
str balancePropertyCondition(str old, str new) = "<old>.balance in <new>.balance";

str addComment(str com) = "// <com> \n";
str addMLComment(str com) = "/********************\n* <com>\n********************/\n\n";