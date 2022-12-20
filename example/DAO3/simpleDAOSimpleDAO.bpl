// #LTLProperty: []((AP(__ltl_ap_will_succeed_withdraw0) ==> <>(AP(__ltl_ap_finished_withdraw1))))
var __ltl_ap_finished_withdraw1: bool;
var __ltl_ap_will_succeed_withdraw0: bool;
type Ref = int;
type ContractName = int;
const unique null: Ref;
const unique SimpleDAO: ContractName;
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

var __shadow_credit_SimpleDAO: [Ref][Ref]int;
var credit_SimpleDAO: [Ref][Ref]int;
procedure withdraw_SimpleDAO(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
modifies Balance;
modifies gas;
implementation withdraw_SimpleDAO(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := (!(__exception)) && (true);
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_credit_SimpleDAO := credit_SimpleDAO;
call withdraw_SimpleDAO__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call withdraw_SimpleDAO__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := ((revert) == (0)) && (true);
assume {:ltl_step} (true);
}

procedure withdraw_SimpleDAO__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies credit_SimpleDAO;
modifies Balance;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
implementation withdraw_SimpleDAO__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var success_s44: bool;
var data_s44: int;
var amount_s44: int;
var __var_1: bool;
var __var_2: int;
var __var_3: int;
havoc success_s44;
havoc data_s44;
amount_s44 := credit_SimpleDAO[this][msgsender_MSG];
// Havoc data part because we do not currently handle it
call __var_1 := send(this, msgsender_MSG, amount_s44);
success_s44 := __var_1;
data_s44 := __var_2;
if (!(success_s44)) {
havoc VS_errorMsg;
revert := 1;
return;
}
credit_SimpleDAO[this][msgsender_MSG] := (credit_SimpleDAO[this][msgsender_MSG]) - (amount_s44);
}

procedure withdraw_SimpleDAO__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies __shadow_credit_SimpleDAO;
modifies Balance;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies credit_SimpleDAO;
implementation withdraw_SimpleDAO__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var success_s44: bool;
var data_s44: int;
var amount_s44: int;
var __var_4: bool;
var __var_5: int;
var __var_6: int;
havoc success_s44;
havoc data_s44;
amount_s44 := __shadow_credit_SimpleDAO[this][msgsender_MSG];
// Havoc data part because we do not currently handle it
call __var_4 := send(this, msgsender_MSG, amount_s44);
success_s44 := __var_4;
data_s44 := __var_5;
if (!(success_s44)) {
havoc VS_errorMsg;
revert := 1;
return;
}
__shadow_credit_SimpleDAO[this][msgsender_MSG] := (__shadow_credit_SimpleDAO[this][msgsender_MSG]) - (amount_s44);
}

procedure SimpleDAO_SimpleDAO(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
modifies Balance;
modifies credit_SimpleDAO;
implementation SimpleDAO_SimpleDAO(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_credit_SimpleDAO := credit_SimpleDAO;
call SimpleDAO_SimpleDAO__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call SimpleDAO_SimpleDAO__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
}

procedure SimpleDAO_SimpleDAO_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies credit_SimpleDAO;
implementation SimpleDAO_SimpleDAO_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
credit_SimpleDAO[this] := zeroRefintArr();
// End of state variable initialization.
}

procedure SimpleDAO_SimpleDAO__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies credit_SimpleDAO;
implementation SimpleDAO_SimpleDAO__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call SimpleDAO_SimpleDAO_unchained__success(this, msgsender_MSG, msgvalue_MSG);
}

procedure SimpleDAO_SimpleDAO_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_credit_SimpleDAO;
implementation SimpleDAO_SimpleDAO_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
__shadow_credit_SimpleDAO[this] := zeroRefintArr();
// End of state variable initialization.
}

procedure SimpleDAO_SimpleDAO__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_credit_SimpleDAO;
implementation SimpleDAO_SimpleDAO__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call SimpleDAO_SimpleDAO_unchained__fail(this, msgsender_MSG, msgvalue_MSG);
}

procedure credit~address_SimpleDAO(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, arg48_s0: Ref) returns (__ret_0_: int);
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
implementation credit~address_SimpleDAO(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, arg48_s0: Ref) returns (__ret_0_: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_credit_SimpleDAO := credit_SimpleDAO;
call __ret_0_ := credit~address_SimpleDAO__fail(this, msgsender_MSG, msgvalue_MSG, arg48_s0);
assume ((revert) != (0));
} else {
call __ret_0_ := credit~address_SimpleDAO__success(this, msgsender_MSG, msgvalue_MSG, arg48_s0);
assume ((revert) == (0));
}
__ltl_ap_will_succeed_withdraw0 := false;
__ltl_ap_finished_withdraw1 := false;
assume {:ltl_step} (true);
}

procedure credit~address_SimpleDAO__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, arg48_s0: Ref) returns (__ret_0_: int);
implementation credit~address_SimpleDAO__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, arg48_s0: Ref) returns (__ret_0_: int)
{
__ret_0_ := credit_SimpleDAO[this][arg48_s0];
return;
}

procedure credit~address_SimpleDAO__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, arg48_s0: Ref) returns (__ret_0_: int);
implementation credit~address_SimpleDAO__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int, arg48_s0: Ref) returns (__ret_0_: int)
{
__ret_0_ := __shadow_credit_SimpleDAO[this][arg48_s0];
return;
}

procedure FallbackDispatch(from: Ref, to: Ref, amount: int);
modifies revert;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
modifies Balance;
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (SimpleDAO)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(from, to, amount);
}
}

procedure Fallback_UnknownType(from: Ref, to: Ref, amount: int);
modifies revert;
modifies gas;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
modifies Balance;
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var arg48_s0: Ref;
var __ret_0_credit: int;
if ((choice) == (0)) {
revert := 1;
return;
}
if ((gas) < (21000)) {
return;
}
if ((DType[from]) == (SimpleDAO)) {
if ((choice) == (2)) {
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume ((msgvalue_MSG) == (0));
call __ret_0_credit := credit~address_SimpleDAO(from, to, msgvalue_MSG, arg48_s0);
}
} else if ((choice) == (1)) {
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume ((msgvalue_MSG) == (0));
call withdraw_SimpleDAO(from, to, msgvalue_MSG);
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
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
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

procedure CorralChoice_SimpleDAO(this: Ref);
modifies gas;
modifies now;
modifies Alloc;
modifies revert;
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
modifies Balance;
implementation CorralChoice_SimpleDAO(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var arg48_s0: Ref;
var __ret_0_credit: int;
var __now_offset: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc arg48_s0;
havoc __ret_0_credit;
havoc __now_offset;
havoc gas;
assume (((gas) > (4000000)) && ((gas) <= (8000000)));
havoc __now_offset;
assume ((__now_offset) > (0));
now := (now) + (__now_offset);
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (SimpleDAO));
Alloc[msgsender_MSG] := true;
gas := (gas) - (21000);
if ((gas) >= (0)) {
assume ((msgvalue_MSG) == (0));
call withdraw_SimpleDAO(this, msgsender_MSG, msgvalue_MSG);
}
}

procedure ULTIMATE.start();
modifies __ltl_ap_will_succeed_withdraw0;
modifies __ltl_ap_finished_withdraw1;
modifies Alloc;
modifies gas;
modifies now;
modifies revert;
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
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
modifies __shadow_credit_SimpleDAO;
modifies VS_errorMsg;
modifies credit_SimpleDAO;
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
assume ((DType[this]) == (SimpleDAO));
assume (((revert) == (0)) && ((gas) >= (0)));
call CorralChoice_SimpleDAO(this);
}


