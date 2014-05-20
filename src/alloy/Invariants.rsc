module alloy::Invariants

import grammar::Invariants;
import grammar::SavingsAccount;
import alloy::util::StringTemplates;
import List;

alias InvariantMap = map[InvariantName name, Invariant inv];


str invariants2alloy(I_Invariants i_invs, Invariants invs){
	InvariantMap invMap = getInvariantMap(invs);
	return ("" | it + invariant2alloy(invMap[inv.name]) + "\n" | inv <- i_invs.invariants);
}

str invariant2alloy(Invariant inv){
	return "assert <inv.name> {
	'  <inv.decl.scope> <inv.decl.e>
	'}";
}

str invariant2alloycommand(I_Invariant inv) = "check <inv.name> <getCommandScope()>";

InvariantMap getInvariantMap(Invariants invs) = ( () | it + (inv.name : inv) | inv <- invs.invariants);