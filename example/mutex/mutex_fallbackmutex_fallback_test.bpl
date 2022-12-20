// #LTLProperty: []((AP(__ltl_ap_will_succeed_withdraw0) ==> <>(AP(__ltl_ap_finished_withdraw1))))
var __ltl_ap_finished_withdraw1: bool;
var __ltl_ap_will_succeed_withdraw0: bool;
type Ref = int;
type ContractName = int;
const unique null: Ref;
const unique mutex_fallback_test: ContractName;
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
var gas: int;
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

var __shadow_balances_mutex_fallback_test: [Ref][Ref]int;
var balances_mutex_fallback_test: [Ref][Ref]int;
var {:access "this.lockBalances=__shadow_lockBalances_mutex_fallback_test[this]"} __shadow_lockBalances_mutex_fallback_test: [Ref]bool;
var {:access "this.lockBalances=lockBalances_mutex_fallback_test[this]"} lockBalances_mutex_fallback_test: [Ref]bool;
procedure deposit_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
implementation deposit_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_balances_mutex_fallback_test := balances_mutex_fallback_test;
__shadow_lockBalances_mutex_fallback_test := lockBalances_mutex_fallback_test;
call __ret_0_ := deposit_mutex_fallback_test__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call __ret_0_ := deposit_mutex_fallback_test__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
}

procedure deposit_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
modifies VS_errorMsg;
modifies revert;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
implementation deposit_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
if (!(!(lockBalances_mutex_fallback_test[this]))) {
havoc VS_errorMsg;
revert := 1;
return;
}
lockBalances_mutex_fallback_test[this] := true;
balances_mutex_fallback_test[this][msgsender_MSG] := (balances_mutex_fallback_test[this][msgsender_MSG]) + (msgvalue_MSG);
lockBalances_mutex_fallback_test[this] := false;
__ret_0_ := true;
return;
}

procedure deposit_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool);
modifies VS_errorMsg;
modifies revert;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies __shadow_balances_mutex_fallback_test;
implementation deposit_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int) returns (__ret_0_: bool)
{
if (!(!(__shadow_lockBalances_mutex_fallback_test[this]))) {
havoc VS_errorMsg;
revert := 1;
return;
}
__shadow_lockBalances_mutex_fallback_test[this] := true;
__shadow_balances_mutex_fallback_test[this][msgsender_MSG] := (__shadow_balances_mutex_fallback_test[this][msgsender_MSG]) + (msgvalue_MSG);
__shadow_lockBalances_mutex_fallback_test[this] := false;
__ret_0_ := true;
return;
}

procedure fbug_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies lockBalances_mutex_fallback_test;
implementation fbug_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_balances_mutex_fallback_test := balances_mutex_fallback_test;
__shadow_lockBalances_mutex_fallback_test := lockBalances_mutex_fallback_test;
call fbug_mutex_fallback_test__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call fbug_mutex_fallback_test__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
}

procedure fbug_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies lockBalances_mutex_fallback_test;
implementation fbug_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
lockBalances_mutex_fallback_test[this] := false;
}

procedure fbug_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies __shadow_lockBalances_mutex_fallback_test;
implementation fbug_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
__shadow_lockBalances_mutex_fallback_test[this] := false;
}

procedure withdraw~uint_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amount_p100: int) returns (__ret_0_: bool);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
modifies Balance;
modifies gas;
implementation withdraw~uint_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amount_p100: int) returns (__ret_0_: bool)
{
var __ltl_old_var_0: int;
var __ltl_old_var_1: int;
var __exception: bool;
__ltl_old_var_0 := balances_mutex_fallback_test[this][msgsender_MSG];
__ltl_old_var_1 := balances_mutex_fallback_test[this][msgsender_MSG];
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := (!(__exception)) && (true);
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_balances_mutex_fallback_test := balances_mutex_fallback_test;
__shadow_lockBalances_mutex_fallback_test := lockBalances_mutex_fallback_test;
call __ret_0_ := withdraw~uint_mutex_fallback_test__fail(this, msgsender_MSG, msgvalue_MSG, amount_p100);
assume ((revert) != (0));
} else {
call __ret_0_ := withdraw~uint_mutex_fallback_test__success(this, msgsender_MSG, msgvalue_MSG, amount_p100);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := ((revert) == (0)) && (((balances_mutex_fallback_test[this][msgsender_MSG]) == ((__ltl_old_var_1) - (amount_p100))) || ((balances_mutex_fallback_test[this][msgsender_MSG]) == (__ltl_old_var_0)));
assume {:ltl_step} (true);
}

procedure withdraw~uint_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amount_p100: int) returns (__ret_0_: bool);
modifies VS_errorMsg;
modifies revert;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
modifies Balance;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
implementation withdraw~uint_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amount_p100: int) returns (__ret_0_: bool)
{
var amount_s100: int;
var success_s99: bool;
var data_s99: int;
var __var_1: bool;
var __var_2: int;
var __var_3: int;
amount_s100 := amount_p100;
if (!(((!(lockBalances_mutex_fallback_test[this])) && ((amount_s100) > (0))) && ((balances_mutex_fallback_test[this][msgsender_MSG]) >= (amount_s100)))) {
havoc VS_errorMsg;
revert := 1;
return;
}
lockBalances_mutex_fallback_test[this] := true;
// Havoc data part because we do not currently handle it
call __var_1 := send(this, msgsender_MSG, amount_s100);
success_s99 := __var_1;
data_s99 := __var_2;
if (success_s99) {
balances_mutex_fallback_test[this][msgsender_MSG] := (balances_mutex_fallback_test[this][msgsender_MSG]) - (amount_s100);
}
lockBalances_mutex_fallback_test[this] := false;
__ret_0_ := true;
return;
}

procedure withdraw~uint_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amount_p100: int) returns (__ret_0_: bool);
modifies VS_errorMsg;
modifies revert;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies __shadow_balances_mutex_fallback_test;
modifies Balance;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
implementation withdraw~uint_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, amount_p100: int) returns (__ret_0_: bool)
{
var amount_s100: int;
var success_s99: bool;
var data_s99: int;
var __var_4: bool;
var __var_5: int;
var __var_6: int;
amount_s100 := amount_p100;
if (!(((!(__shadow_lockBalances_mutex_fallback_test[this])) && ((amount_s100) > (0))) && ((__shadow_balances_mutex_fallback_test[this][msgsender_MSG]) >= (amount_s100)))) {
havoc VS_errorMsg;
revert := 1;
return;
}
__shadow_lockBalances_mutex_fallback_test[this] := true;
// Havoc data part because we do not currently handle it
call __var_4 := send(this, msgsender_MSG, amount_s100);
success_s99 := __var_4;
data_s99 := __var_5;
if (success_s99) {
__shadow_balances_mutex_fallback_test[this][msgsender_MSG] := (__shadow_balances_mutex_fallback_test[this][msgsender_MSG]) - (amount_s100);
}
__shadow_lockBalances_mutex_fallback_test[this] := false;
__ret_0_ := true;
return;
}

procedure mutex_fallback_test_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies Balance;
modifies balances_mutex_fallback_test;
modifies lockBalances_mutex_fallback_test;
implementation mutex_fallback_test_mutex_fallback_test(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_balances_mutex_fallback_test := balances_mutex_fallback_test;
__shadow_lockBalances_mutex_fallback_test := lockBalances_mutex_fallback_test;
call mutex_fallback_test_mutex_fallback_test__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call mutex_fallback_test_mutex_fallback_test__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
}

procedure mutex_fallback_test_mutex_fallback_test_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies balances_mutex_fallback_test;
modifies lockBalances_mutex_fallback_test;
implementation mutex_fallback_test_mutex_fallback_test_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
balances_mutex_fallback_test[this] := zeroRefintArr();
lockBalances_mutex_fallback_test[this] := false;
// End of state variable initialization.
}

procedure mutex_fallback_test_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies balances_mutex_fallback_test;
modifies lockBalances_mutex_fallback_test;
implementation mutex_fallback_test_mutex_fallback_test__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call mutex_fallback_test_mutex_fallback_test_unchained__success(this, msgsender_MSG, msgvalue_MSG);
}

procedure mutex_fallback_test_mutex_fallback_test_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
implementation mutex_fallback_test_mutex_fallback_test_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
__shadow_balances_mutex_fallback_test[this] := zeroRefintArr();
__shadow_lockBalances_mutex_fallback_test[this] := false;
// End of state variable initialization.
}

procedure mutex_fallback_test_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
implementation mutex_fallback_test_mutex_fallback_test__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call mutex_fallback_test_mutex_fallback_test_unchained__fail(this, msgsender_MSG, msgvalue_MSG);
}

procedure FallbackDispatch(from: Ref, to: Ref, amount: int);
modifies revert;
modifies gas;
modifies Balance;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (mutex_fallback_test)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(from, to, amount);
}
}

procedure Fallback_UnknownType(from: Ref, to: Ref, amount: int);
modifies revert;
modifies gas;
modifies Balance;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
var maxIterate: int;
var counter: int;
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var __ret_0_deposit: bool;
var amount_s100: int;
var __ret_0_withdraw: bool;
if ((choice) == (0)) {
revert := 1;
return;
}
if ((gas) < (21000)) {
return;
}
counter := 0;
havoc maxIterate;
while (((counter) <= (maxIterate)) && ((gas) >= (21000)))
{
counter := (counter) + (1);
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc __ret_0_deposit;
havoc amount_s100;
havoc __ret_0_withdraw;
if ((DType[from]) == (mutex_fallback_test)) {
if ((choice) == (3)) {
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume ((msgvalue_MSG) >= (0));
// ---- Logic for payable function START 
assume ((Balance[msgsender_MSG]) >= (msgvalue_MSG));
Balance[msgsender_MSG] := (Balance[msgsender_MSG]) - (msgvalue_MSG);
Balance[this] := (Balance[this]) + (msgvalue_MSG);
// ---- Logic for payable function END 
call __ret_0_deposit := deposit_mutex_fallback_test(from, to, msgvalue_MSG);
}
} else if ((choice) == (2)) {
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume ((msgvalue_MSG) == (0));
call fbug_mutex_fallback_test(from, to, msgvalue_MSG);
}
} else if ((choice) == (1)) {
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume (((amount_s100) >= (0)) && ((amount_s100) < (115792089237316195423570985008687907853269984665640564039457584007913129639936)));
assume ((msgvalue_MSG) >= (0));
// ---- Logic for payable function START 
assume ((Balance[msgsender_MSG]) >= (msgvalue_MSG));
Balance[msgsender_MSG] := (Balance[msgsender_MSG]) - (msgvalue_MSG);
Balance[this] := (Balance[this]) + (msgvalue_MSG);
// ---- Logic for payable function END 
call __ret_0_withdraw := withdraw~uint_mutex_fallback_test(from, to, msgvalue_MSG, amount_s100);
}
}
}
}
}

procedure send(from: Ref, to: Ref, amount: int) returns (success: bool);
modifies Balance;
modifies revert;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
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

procedure CorralChoice_mutex_fallback_test(this: Ref);
modifies gas;
modifies now;
modifies Alloc;
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
modifies Balance;
implementation CorralChoice_mutex_fallback_test(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var __ret_0_deposit: bool;
var amount_s100: int;
var __ret_0_withdraw: bool;
var __now_offset: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc __ret_0_deposit;
havoc amount_s100;
havoc __ret_0_withdraw;
havoc __now_offset;
havoc gas;
assume (((gas) > (4000000)) && ((gas) <= (8000000)));
havoc __now_offset;
assume ((__now_offset) > (0));
now := (now) + (__now_offset);
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (mutex_fallback_test));
Alloc[msgsender_MSG] := true;
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume (((amount_s100) >= (0)) && ((amount_s100) < (115792089237316195423570985008687907853269984665640564039457584007913129639936)));
assume ((msgvalue_MSG) >= (0));
call __ret_0_withdraw := withdraw~uint_mutex_fallback_test(this, msgsender_MSG, msgvalue_MSG, amount_s100);
}
}

procedure ULTIMATE.start();
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies Alloc;
modifies gas;
modifies now;
modifies revert;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
modifies Balance;
implementation ULTIMATE.start()
{
call ULTIMATE.ltl_entry_procedure();
}

procedure ULTIMATE.ltl_entry_procedure();
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies Alloc;
modifies gas;
modifies now;
modifies revert;
modifies __shadow_balances_mutex_fallback_test;
modifies __shadow_lockBalances_mutex_fallback_test;
modifies VS_errorMsg;
modifies lockBalances_mutex_fallback_test;
modifies balances_mutex_fallback_test;
modifies Balance;
implementation ULTIMATE.ltl_entry_procedure()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume ((null) == (0));
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((DType[this]) == (mutex_fallback_test));
assume (((revert) == (0)) && ((gas) >= (0)));
call CorralChoice_mutex_fallback_test(this);
}


