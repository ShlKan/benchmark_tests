//#LTLVariables: oadr:address
//#LTLProperty: []((started(Reentrancy.deposit(adr, amt), oadr == adr && amt > 0)) ==> <> (finished(Reentrancy.deposit(adr, amt), oadr == adr && balance[adr] == amt)))

