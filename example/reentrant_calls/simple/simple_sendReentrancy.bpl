// #LTLProperty: [](AP(__ltl_ap_finished_sendm0))
var __ltl_ap_finished_sendm0: bool;
type Ref = int;
type ContractName = int;
const unique null: Ref;
const unique IOtherContract: ContractName;
const unique OtherContract: ContractName;
const unique Reentrancy: ContractName;
function BoogieRefToInt(x: Ref) returns (ret: int);
function keccak256(x: int) returns (ret: int);
function abiEncodePacked1(x: int) returns (ret: int);
function _SumMapping_VeriSol(x: [Ref]int) returns (ret: int);
function abiEncodePacked2(x: int, y: int) returns (ret: int);
function abiEncodePacked1R(x: Ref) returns (ret: int);
function abiEncodePacked2R(x: Ref, y: int) returns (ret: int);
function {:smtdefined "((as const (Array Int Int)) 0)"} zeroRefintArr() returns (ret: [Ref]int);
function nonlinearMul(x: int, y: int) returns (ret: int);
function nonlinearDiv(x: int, y: int) returns (ret: int);
function nonlinearPow(x: int, y: int) returns (ret: int);
function nonlinearMod(x: int, y: int) returns (ret: int);
var Balance: [Ref]int;
var DType: [Ref]ContractName;
var Alloc: [Ref]bool;
var balance_ADDR: [Ref]int;
var __typed_memory_Ref_int: [Ref][Ref]int;
var __shadow__typed_memory_Ref_int: [Ref][Ref]int;
var Length: [Ref]int;
var revert: int;
var VS_errorMsg: int;
var now: int;
procedure FreshRefGenerator() returns (newRef: Ref);
modifies Alloc;
implementation FreshRefGenerator() returns (newRef: Ref)
{
havoc newRef;
assume ((Alloc[newRef]) == (false));
Alloc[newRef] := true;
assume ((newRef) != (null));
}

procedure do_something_OtherContract(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
implementation do_something_OtherContract(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call __ret_0_ := do_something_OtherContract__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call __ret_0_ := do_something_OtherContract__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
}

procedure do_something_OtherContract__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
implementation do_something_OtherContract__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
__ret_0_ := true;
return;
}

procedure do_something_OtherContract__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
implementation do_something_OtherContract__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
__ret_0_ := true;
return;
}

procedure OtherContract_OtherContract(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies Balance;
implementation OtherContract_OtherContract(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call OtherContract_OtherContract__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call OtherContract_OtherContract__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
}

procedure OtherContract_OtherContract_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
implementation OtherContract_OtherContract_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
// End of state variable initialization.
}

procedure OtherContract_OtherContract__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
implementation OtherContract_OtherContract__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call OtherContract_OtherContract_unchained__success(this, msgsender_MSG, msgvalue_MSG);
}

procedure OtherContract_OtherContract_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
implementation OtherContract_OtherContract_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
// End of state variable initialization.
}

procedure OtherContract_OtherContract__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
implementation OtherContract_OtherContract__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call OtherContract_OtherContract_unchained__fail(this, msgsender_MSG, msgvalue_MSG);
}

var {:access "this.x=__shadow_x_Reentrancy[this]"} __shadow_x_Reentrancy: [Ref]int;
var {:access "this.x=x_Reentrancy[this]"} x_Reentrancy: [Ref]int;
var {:access "this.other_contract=__shadow_other_contract_Reentrancy[this]"} __shadow_other_contract_Reentrancy: [Ref]Ref;
var {:access "this.other_contract=other_contract_Reentrancy[this]"} other_contract_Reentrancy: [Ref]Ref;
var __shadow_balance_Reentrancy: [Ref][Ref]int;
var balance_Reentrancy: [Ref][Ref]int;
procedure Reentrancy_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies Balance;
modifies Alloc;
modifies x_Reentrancy;
modifies balance_Reentrancy;
modifies other_contract_Reentrancy;
implementation Reentrancy_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call Reentrancy_Reentrancy__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call Reentrancy_Reentrancy__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
}

procedure Reentrancy_Reentrancy_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies x_Reentrancy;
modifies balance_Reentrancy;
modifies other_contract_Reentrancy;
modifies Alloc;
implementation Reentrancy_Reentrancy_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
var __var_2: Ref;
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
x_Reentrancy[this] := 0;
balance_Reentrancy[this] := zeroRefintArr();
// End of state variable initialization.
call __var_2 := FreshRefGenerator();
assume ((DType[__var_2]) == (OtherContract));
call OtherContract_OtherContract__success(__var_2, this, 0);
__var_1 := __var_2;
other_contract_Reentrancy[this] := __var_1;
x_Reentrancy[this] := 0;
}

procedure Reentrancy_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies x_Reentrancy;
modifies balance_Reentrancy;
modifies other_contract_Reentrancy;
modifies Alloc;
implementation Reentrancy_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call Reentrancy_Reentrancy_unchained__success(this, msgsender_MSG, msgvalue_MSG);
}

procedure Reentrancy_Reentrancy_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_x_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies Alloc;
implementation Reentrancy_Reentrancy_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_3: Ref;
var __var_4: Ref;
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
__shadow_x_Reentrancy[this] := 0;
__shadow_balance_Reentrancy[this] := zeroRefintArr();
// End of state variable initialization.
call __var_4 := FreshRefGenerator();
assume ((DType[__var_4]) == (OtherContract));
call OtherContract_OtherContract__fail(__var_4, this, 0);
__var_3 := __var_4;
__shadow_other_contract_Reentrancy[this] := __var_3;
__shadow_x_Reentrancy[this] := 0;
}

procedure Reentrancy_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_x_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies Alloc;
implementation Reentrancy_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call Reentrancy_Reentrancy_unchained__fail(this, msgsender_MSG, msgvalue_MSG);
}

procedure deposit~address~uint256_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, adr_p57: Ref, amt_p57: int);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies balance_Reentrancy;
implementation deposit~address~uint256_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, adr_p57: Ref, amt_p57: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call deposit~address~uint256_Reentrancy__fail(this, msgsender_MSG, msgvalue_MSG, adr_p57, amt_p57);
assume ((revert) != (0));
} else {
call deposit~address~uint256_Reentrancy__success(this, msgsender_MSG, msgvalue_MSG, adr_p57, amt_p57);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
}

procedure deposit~address~uint256_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, adr_p57: Ref, amt_p57: int);
modifies balance_Reentrancy;
implementation deposit~address~uint256_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, adr_p57: Ref, amt_p57: int)
{
var adr_s57: Ref;
var amt_s57: int;
adr_s57 := adr_p57;
amt_s57 := amt_p57;
balance_Reentrancy[this][adr_s57] := amt_s57;
}

procedure deposit~address~uint256_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, adr_p57: Ref, amt_p57: int);
modifies __shadow_balance_Reentrancy;
implementation deposit~address~uint256_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, adr_p57: Ref, amt_p57: int)
{
var adr_s57: Ref;
var amt_s57: int;
adr_s57 := adr_p57;
amt_s57 := amt_p57;
__shadow_balance_Reentrancy[this][adr_s57] := amt_s57;
}

procedure foo_untrusted~_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, untrusted_p79: Ref);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies x_Reentrancy;
implementation foo_untrusted~_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, untrusted_p79: Ref)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call foo_untrusted~_Reentrancy__fail(this, msgsender_MSG, msgvalue_MSG, untrusted_p79);
assume ((revert) != (0));
} else {
call foo_untrusted~_Reentrancy__success(this, msgsender_MSG, msgvalue_MSG, untrusted_p79);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
}

procedure foo_untrusted~_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, untrusted_p79: Ref);
modifies revert;
modifies x_Reentrancy;
implementation foo_untrusted~_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, untrusted_p79: Ref)
{
var untrusted_s79: Ref;
var __var_5: bool;
var __var_6: int;
var __var_7: int;
untrusted_s79 := untrusted_p79;
if ((DType[untrusted_s79]) == (Reentrancy)) {
call __var_5 := do_something_Reentrancy__success(untrusted_s79, this, __var_6);
} else if ((DType[untrusted_s79]) == (OtherContract)) {
call __var_5 := do_something_OtherContract__success(untrusted_s79, this, __var_6);
} else {
assume (false);
}
if ((revert) != (0)) {
return;
}
if (((x_Reentrancy[this]) < (1)) && (__var_5)) {
__var_7 := (x_Reentrancy[this]) + (1);
if (((__var_7) > (255)) || ((__var_7) < (0))) {
revert := 3;
return;
}
x_Reentrancy[this] := __var_7;
}
}

procedure foo_untrusted~_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, untrusted_p79: Ref);
modifies revert;
modifies __shadow_x_Reentrancy;
implementation foo_untrusted~_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, untrusted_p79: Ref)
{
var untrusted_s79: Ref;
var __var_8: bool;
var __var_9: int;
var __var_10: int;
untrusted_s79 := untrusted_p79;
if ((DType[untrusted_s79]) == (Reentrancy)) {
call __var_8 := do_something_Reentrancy__fail(untrusted_s79, this, __var_9);
} else if ((DType[untrusted_s79]) == (OtherContract)) {
call __var_8 := do_something_OtherContract__fail(untrusted_s79, this, __var_9);
} else {
assume (false);
}
if ((revert) != (0)) {
return;
}
if (((__shadow_x_Reentrancy[this]) < (1)) && (__var_8)) {
__var_10 := (__shadow_x_Reentrancy[this]) + (1);
if (((__var_10) > (255)) || ((__var_10) < (0))) {
revert := 3;
return;
}
__shadow_x_Reentrancy[this] := __var_10;
}
}

procedure sendm~uint_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amt_p112: int);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies balance_Reentrancy;
modifies Balance;
modifies x_Reentrancy;
implementation sendm~uint_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amt_p112: int)
{
var __ltl_old_var_0: int;
var __exception: bool;
__ltl_old_var_0 := balance_Reentrancy[this][msgsender_MSG];
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call sendm~uint_Reentrancy__fail(this, msgsender_MSG, msgvalue_MSG, amt_p112);
assume ((revert) != (0));
} else {
call sendm~uint_Reentrancy__success(this, msgsender_MSG, msgvalue_MSG, amt_p112);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := ((revert) == (0)) && (((amt_p112) >= (0)) && ((balance_Reentrancy[this][msgsender_MSG]) == ((__ltl_old_var_0) - (amt_p112))));
assume {:ltl_step} (true);
}

procedure sendm~uint_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amt_p112: int);
modifies balance_Reentrancy;
modifies Balance;
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies x_Reentrancy;
implementation sendm~uint_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amt_p112: int)
{
var amt_s112: int;
var success_s109: bool;
var ad_s109: int;
var __var_11: bool;
var __var_12: int;
amt_s112 := amt_p112;
if ((balance_Reentrancy[this][msgsender_MSG]) >= (amt_s112)) {
// Havoc data part because we do not currently handle it
call __var_11 := send(this, msgsender_MSG, amt_s112);
success_s109 := __var_11;
ad_s109 := __var_12;
balance_Reentrancy[this][msgsender_MSG] := (balance_Reentrancy[this][msgsender_MSG]) - (amt_s112);
}
}

procedure sendm~uint_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amt_p112: int);
modifies __shadow_balance_Reentrancy;
modifies Balance;
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies balance_Reentrancy;
modifies x_Reentrancy;
implementation sendm~uint_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amt_p112: int)
{
var amt_s112: int;
var success_s109: bool;
var ad_s109: int;
var __var_13: bool;
var __var_14: int;
amt_s112 := amt_p112;
if ((__shadow_balance_Reentrancy[this][msgsender_MSG]) >= (amt_s112)) {
// Havoc data part because we do not currently handle it
call __var_13 := send(this, msgsender_MSG, amt_s112);
success_s109 := __var_13;
ad_s109 := __var_14;
__shadow_balance_Reentrancy[this][msgsender_MSG] := (__shadow_balance_Reentrancy[this][msgsender_MSG]) - (amt_s112);
}
}

procedure do_something_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
implementation do_something_Reentrancy(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_x_Reentrancy := x_Reentrancy;
__shadow_other_contract_Reentrancy := other_contract_Reentrancy;
__shadow_balance_Reentrancy := balance_Reentrancy;
call __ret_0_ := do_something_Reentrancy__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call __ret_0_ := do_something_Reentrancy__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_finished_sendm0 := false;
assume {:ltl_step} (true);
}

procedure do_something_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
implementation do_something_Reentrancy__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
__ret_0_ := true;
return;
}

procedure do_something_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
implementation do_something_Reentrancy__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
__ret_0_ := true;
return;
}

procedure FallbackDispatch(from: Ref, to: Ref, amount: int);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies balance_Reentrancy;
modifies x_Reentrancy;
modifies Balance;
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (Reentrancy)) {
assume ((amount) == (0));
} else if ((DType[to]) == (OtherContract)) {
assume ((amount) == (0));
} else if ((DType[to]) == (IOtherContract)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(from, to, amount);
}
}

procedure Fallback_UnknownType(from: Ref, to: Ref, amount: int);
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies balance_Reentrancy;
modifies x_Reentrancy;
modifies Balance;
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var __ret_0_do_something: bool;
var adr_s57: Ref;
var amt_s57: int;
var untrusted_s79: Ref;
var amt_s112: int;
if ((choice) == (0)) {
revert := 1;
return;
}
if ((DType[from]) == (Reentrancy)) {
if ((choice) == (4)) {
assume ((msgvalue_MSG) == (0));
call __ret_0_do_something := do_something_Reentrancy(from, to, msgvalue_MSG);
} else if ((choice) == (3)) {
assume (((amt_s57) >= (0)) && ((amt_s57) < (115792089237316195423570985008687907853269984665640564039457584007913129639936)));
assume ((msgvalue_MSG) == (0));
call deposit~address~uint256_Reentrancy(from, to, msgvalue_MSG, adr_s57, amt_s57);
} else if ((choice) == (2)) {
assume ((msgvalue_MSG) == (0));
call foo_untrusted~_Reentrancy(from, to, msgvalue_MSG, untrusted_s79);
} else if ((choice) == (1)) {
assume (((amt_s112) >= (0)) && ((amt_s112) < (115792089237316195423570985008687907853269984665640564039457584007913129639936)));
assume ((msgvalue_MSG) == (0));
call sendm~uint_Reentrancy(from, to, msgvalue_MSG, amt_s112);
}
} else if ((DType[from]) == (OtherContract)) {
if ((choice) == (1)) {
assume ((msgvalue_MSG) == (0));
call __ret_0_do_something := do_something_OtherContract(from, to, msgvalue_MSG);
}
}
}

procedure send(from: Ref, to: Ref, amount: int) returns (success: bool);
modifies Balance;
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies balance_Reentrancy;
modifies x_Reentrancy;
implementation send(from: Ref, to: Ref, amount: int) returns (success: bool)
{
if ((Balance[from]) >= (amount)) {
// ---- Logic for payable function START 
Balance[from] := (Balance[from]) - (amount);
Balance[to] := (Balance[to]) + (amount);
// ---- Logic for payable function END 
call FallbackDispatch(from, to, amount);
success := true;
} else {
success := false;
}
}

procedure CorralChoice_Reentrancy(this: Ref);
modifies now;
modifies Alloc;
modifies revert;
modifies __ltl_ap_finished_sendm0;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies balance_Reentrancy;
modifies x_Reentrancy;
modifies Balance;
implementation CorralChoice_Reentrancy(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var __ret_0_do_something: bool;
var adr_s57: Ref;
var amt_s57: int;
var untrusted_s79: Ref;
var amt_s112: int;
var __now_offset: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc __ret_0_do_something;
havoc adr_s57;
havoc amt_s57;
havoc untrusted_s79;
havoc amt_s112;
havoc __now_offset;
havoc __now_offset;
assume ((__now_offset) > (0));
now := (now) + (__now_offset);
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (IOtherContract));
assume ((DType[msgsender_MSG]) != (OtherContract));
assume ((DType[msgsender_MSG]) != (Reentrancy));
Alloc[msgsender_MSG] := true;
if ((choice) == (4)) {
assume ((msgvalue_MSG) == (0));
call __ret_0_do_something := do_something_Reentrancy(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (3)) {
assume (((amt_s57) >= (0)) && ((amt_s57) < (115792089237316195423570985008687907853269984665640564039457584007913129639936)));
assume ((msgvalue_MSG) == (0));
call deposit~address~uint256_Reentrancy(this, msgsender_MSG, msgvalue_MSG, adr_s57, amt_s57);
} else if ((choice) == (2)) {
assume ((msgvalue_MSG) == (0));
call foo_untrusted~_Reentrancy(this, msgsender_MSG, msgvalue_MSG, untrusted_s79);
} else if ((choice) == (1)) {
assume (((amt_s112) >= (0)) && ((amt_s112) < (115792089237316195423570985008687907853269984665640564039457584007913129639936)));
assume ((msgvalue_MSG) == (0));
call sendm~uint_Reentrancy(this, msgsender_MSG, msgvalue_MSG, amt_s112);
}
}

procedure ULTIMATE.start();
modifies __ltl_ap_finished_sendm0;
modifies Alloc;
modifies revert;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies now;
modifies balance_Reentrancy;
modifies x_Reentrancy;
modifies Balance;
modifies other_contract_Reentrancy;
implementation ULTIMATE.start()
{
call ULTIMATE.ltl_entry_procedure();
}

procedure ULTIMATE.ltl_entry_procedure();
modifies __ltl_ap_finished_sendm0;
modifies Alloc;
modifies revert;
modifies __shadow_x_Reentrancy;
modifies __shadow_other_contract_Reentrancy;
modifies __shadow_balance_Reentrancy;
modifies now;
modifies balance_Reentrancy;
modifies x_Reentrancy;
modifies Balance;
modifies other_contract_Reentrancy;
implementation ULTIMATE.ltl_entry_procedure()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
__ltl_ap_finished_sendm0 := false;
assume ((null) == (0));
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((DType[this]) == (Reentrancy));
assume ((msgvalue_MSG) == (0));
call Reentrancy_Reentrancy(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
while (true)
{
call CorralChoice_Reentrancy(this);
}
}


