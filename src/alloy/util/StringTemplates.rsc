module alloy::util::StringTemplates

import grammar::SavingsAccount;

str getModuleName(SavingsAccountName sn) = "module <sn>\n";

str getImports(){
return "
	'open util/ordering[SavingsAccount]
	'open util/integer
	'open date
	'open period
	'open frequency
	'open percentage
\n";
}

str getSignature(){
return "sig SavingsAccount {
	'  balance : Date -\> lone Int,
	'  term  : one Int,
	'  startDate : one Date,
	'  payoutfreq: one Frequency,
	'  opened : lone Int,
	'  now : one Date
	'}{
	'  opened in {0+1}
	'  all d : prevs[now] + now | d in balance.Int
	'}
	'\n";
}

str predShow() = "pred show{} \nrun show <getCommandScope()>\n";

//TODO Set Scope self, Percentage over all Ints (2^7)
str getCommandScope() = "for 5 SavingsAccount, exactly 5 Date, 7 Int, exactly 128 Percentage";


str addComment(str com) = "// <com> \n";
str addMLComment(str com) = "/********************\n* <com>\n********************/\n\n";