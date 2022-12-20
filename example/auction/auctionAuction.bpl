// #LTLProperty: [](((AP(__ltl_ap_finished_bid1) && AP(__ltl_ap_finished_close2)) ==> AP(__ltl_ap_started_send3)))
// #LTLFairness: <>(AP(__ltl_ap_started_refund0))
var __ltl_ap_started_send3: bool;
var __ltl_ap_finished_close2: bool;
var __ltl_ap_finished_bid1: bool;
var __ltl_ap_started_refund0: bool;
type Ref = int;
type ContractName = int;
const unique null: Ref;
const unique Auction: ContractName;
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
function {:smtdefined "((as const (Array Int Int)) 0)"} zerointRefArr() returns (ret: [int]Ref);
var __typed_memory_int_Ref: [Ref][int]Ref;
var __shadow__typed_memory_Ref_int: [Ref][Ref]int;
var __shadow__typed_memory_int_Ref: [Ref][int]Ref;
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

var {:access "this.winner=__shadow_winner_Auction[this]"} __shadow_winner_Auction: [Ref]Ref;
var {:access "this.winner=winner_Auction[this]"} winner_Auction: [Ref]Ref;
var {:access "this.curBid=__shadow_curBid_Auction[this]"} __shadow_curBid_Auction: [Ref]int;
var {:access "this.curBid=curBid_Auction[this]"} curBid_Auction: [Ref]int;
var {:access "this.closed=__shadow_closed_Auction[this]"} __shadow_closed_Auction: [Ref]bool;
var {:access "this.closed=closed_Auction[this]"} closed_Auction: [Ref]bool;
var __shadow_bidders_Auction: [Ref][int]Ref;
var bidders_Auction: [Ref][int]Ref;
var __shadow_refunds_Auction: [Ref][Ref]int;
var refunds_Auction: [Ref][Ref]int;
var {:access "this.owner=__shadow_owner_Auction[this]"} __shadow_owner_Auction: [Ref]Ref;
var {:access "this.owner=owner_Auction[this]"} owner_Auction: [Ref]Ref;
procedure Auction_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies Balance;
modifies Alloc;
modifies winner_Auction;
modifies curBid_Auction;
modifies closed_Auction;
modifies bidders_Auction;
modifies refunds_Auction;
modifies owner_Auction;
implementation Auction_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_winner_Auction := winner_Auction;
__shadow_curBid_Auction := curBid_Auction;
__shadow_closed_Auction := closed_Auction;
__shadow_bidders_Auction := bidders_Auction;
__shadow_refunds_Auction := refunds_Auction;
__shadow_owner_Auction := owner_Auction;
call Auction_Auction__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call Auction_Auction__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
}

procedure Auction_Auction_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies winner_Auction;
modifies curBid_Auction;
modifies closed_Auction;
modifies bidders_Auction;
modifies refunds_Auction;
modifies owner_Auction;
modifies Alloc;
implementation Auction_Auction_unchained__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_1: Ref;
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
winner_Auction[this] := null;
curBid_Auction[this] := 0;
closed_Auction[this] := false;
// Make array/mapping vars distinct for bidders
call __var_1 := FreshRefGenerator();
bidders_Auction[this] := __var_1;
assume ((Length[bidders_Auction[this]]) == (0));
refunds_Auction[this] := zeroRefintArr();
owner_Auction[this] := null;
// End of state variable initialization.
owner_Auction[this] := msgsender_MSG;
}

procedure Auction_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies winner_Auction;
modifies curBid_Auction;
modifies closed_Auction;
modifies bidders_Auction;
modifies refunds_Auction;
modifies owner_Auction;
modifies Alloc;
implementation Auction_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call Auction_Auction_unchained__success(this, msgsender_MSG, msgvalue_MSG);
}

procedure Auction_Auction_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies Alloc;
implementation Auction_Auction_unchained__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __var_2: Ref;
// Start of state variable initialization.
assume ((msgsender_MSG) != (null));
Balance[this] := msgvalue_MSG;
__shadow_winner_Auction[this] := null;
__shadow_curBid_Auction[this] := 0;
__shadow_closed_Auction[this] := false;
// Make array/mapping vars distinct for bidders
call __var_2 := FreshRefGenerator();
__shadow_bidders_Auction[this] := __var_2;
assume ((Length[__shadow_bidders_Auction[this]]) == (0));
__shadow_refunds_Auction[this] := zeroRefintArr();
__shadow_owner_Auction[this] := null;
// End of state variable initialization.
__shadow_owner_Auction[this] := msgsender_MSG;
}

procedure Auction_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies Balance;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies Alloc;
implementation Auction_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
call Auction_Auction_unchained__fail(this, msgsender_MSG, msgvalue_MSG);
}

procedure bid_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies VS_errorMsg;
modifies __shadow__typed_memory_int_Ref;
modifies Length;
modifies refunds_Auction;
modifies __typed_memory_int_Ref;
modifies winner_Auction;
modifies curBid_Auction;
implementation bid_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_winner_Auction := winner_Auction;
__shadow_curBid_Auction := curBid_Auction;
__shadow_closed_Auction := closed_Auction;
__shadow_bidders_Auction := bidders_Auction;
__shadow_refunds_Auction := refunds_Auction;
__shadow_owner_Auction := owner_Auction;
call bid_Auction__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call bid_Auction__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := ((revert) == (0)) && (((msgvalue_MSG) == (255)) && ((msgsender_MSG) == (1)));
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
}

procedure bid_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies refunds_Auction;
modifies __typed_memory_int_Ref;
modifies Length;
modifies winner_Auction;
modifies curBid_Auction;
implementation bid_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var sender_s81: Ref;
var __var_3: int;
sender_s81 := msgsender_MSG;
if (!((!(closed_Auction[this])) && ((msgvalue_MSG) > (curBid_Auction[this])))) {
havoc VS_errorMsg;
revert := 1;
return;
}
if (!(((refunds_Auction[this][sender_s81]) == (0)) && ((sender_s81) != (winner_Auction[this])))) {
havoc VS_errorMsg;
revert := 1;
return;
}
refunds_Auction[this][winner_Auction[this]] := curBid_Auction[this];
__var_3 := Length[bidders_Auction[this]];
__typed_memory_int_Ref[bidders_Auction[this]][__var_3] := sender_s81;
Length[bidders_Auction[this]] := (__var_3) + (1);
winner_Auction[this] := sender_s81;
curBid_Auction[this] := msgvalue_MSG;
}

procedure bid_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies __shadow_refunds_Auction;
modifies __shadow__typed_memory_int_Ref;
modifies Length;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
implementation bid_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var sender_s81: Ref;
var __var_4: int;
sender_s81 := msgsender_MSG;
if (!((!(__shadow_closed_Auction[this])) && ((msgvalue_MSG) > (__shadow_curBid_Auction[this])))) {
havoc VS_errorMsg;
revert := 1;
return;
}
if (!(((__shadow_refunds_Auction[this][sender_s81]) == (0)) && ((sender_s81) != (__shadow_winner_Auction[this])))) {
havoc VS_errorMsg;
revert := 1;
return;
}
__shadow_refunds_Auction[this][__shadow_winner_Auction[this]] := __shadow_curBid_Auction[this];
__var_4 := Length[__shadow_bidders_Auction[this]];
__shadow__typed_memory_int_Ref[__shadow_bidders_Auction[this]][__var_4] := sender_s81;
Length[__shadow_bidders_Auction[this]] := (__var_4) + (1);
__shadow_winner_Auction[this] := sender_s81;
__shadow_curBid_Auction[this] := msgvalue_MSG;
}

procedure close_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies VS_errorMsg;
modifies closed_Auction;
implementation close_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_winner_Auction := winner_Auction;
__shadow_curBid_Auction := curBid_Auction;
__shadow_closed_Auction := closed_Auction;
__shadow_bidders_Auction := bidders_Auction;
__shadow_refunds_Auction := refunds_Auction;
__shadow_owner_Auction := owner_Auction;
call close_Auction__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call close_Auction__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := ((revert) == (0)) && ((winner_Auction[this]) != (1));
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
}

procedure close_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies closed_Auction;
implementation close_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
if (!((owner_Auction[this]) == (msgsender_MSG))) {
VS_errorMsg := -125730645;
revert := 2;
return;
}
closed_Auction[this] := true;
}

procedure close_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies __shadow_closed_Auction;
implementation close_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
if (!((__shadow_owner_Auction[this]) == (msgsender_MSG))) {
VS_errorMsg := -125730645;
revert := 2;
return;
}
__shadow_closed_Auction[this] := true;
}

procedure refund_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies revert;
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies VS_errorMsg;
modifies refunds_Auction;
modifies Balance;
implementation refund_Auction(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var __exception: bool;
havoc __exception;
revert := 0;
__ltl_ap_started_refund0 := (true) && ((closed_Auction[this]) && ((msgsender_MSG) == (owner_Auction[this])));
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
if (__exception) {
__shadow_winner_Auction := winner_Auction;
__shadow_curBid_Auction := curBid_Auction;
__shadow_closed_Auction := closed_Auction;
__shadow_bidders_Auction := bidders_Auction;
__shadow_refunds_Auction := refunds_Auction;
__shadow_owner_Auction := owner_Auction;
call refund_Auction__fail(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) != (0));
} else {
call refund_Auction__success(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
}
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume {:ltl_step} (true);
}

procedure refund_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies refunds_Auction;
modifies Balance;
implementation refund_Auction__success(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var i_s148: int;
var refAmt_s147: int;
var __var_5: bool;
if (!((owner_Auction[this]) == (msgsender_MSG))) {
VS_errorMsg := -125730645;
revert := 2;
return;
}
if (!(closed_Auction[this])) {
havoc VS_errorMsg;
revert := 1;
return;
}
i_s148 := 0;
while ((i_s148) < (Length[bidders_Auction[this]]))
{
refAmt_s147 := refunds_Auction[this][__typed_memory_int_Ref[bidders_Auction[this]][i_s148]];
refunds_Auction[this][__typed_memory_int_Ref[bidders_Auction[this]][i_s148]] := 0;
call __var_5 := send(this, __typed_memory_int_Ref[bidders_Auction[this]][i_s148], refAmt_s147);
if (!(__var_5)) {
revert := 1;
return;
}
i_s148 := (i_s148) + (1);
if (((i_s148) > (115792089237316195423570985008687907853269984665640564039457584007913129639935)) || ((i_s148) < (0))) {
revert := 3;
return;
}
}
}

procedure refund_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int);
modifies VS_errorMsg;
modifies revert;
modifies __shadow_refunds_Auction;
modifies Balance;
implementation refund_Auction__fail(this: Ref, msgsender_MSG: Ref, msgvalue_MSG: int)
{
var i_s148: int;
var refAmt_s147: int;
var __var_6: bool;
if (!((__shadow_owner_Auction[this]) == (msgsender_MSG))) {
VS_errorMsg := -125730645;
revert := 2;
return;
}
if (!(__shadow_closed_Auction[this])) {
havoc VS_errorMsg;
revert := 1;
return;
}
i_s148 := 0;
while ((i_s148) < (Length[__shadow_bidders_Auction[this]]))
{
refAmt_s147 := __shadow_refunds_Auction[this][__shadow__typed_memory_int_Ref[__shadow_bidders_Auction[this]][i_s148]];
__shadow_refunds_Auction[this][__shadow__typed_memory_int_Ref[__shadow_bidders_Auction[this]][i_s148]] := 0;
call __var_6 := send(this, __shadow__typed_memory_int_Ref[__shadow_bidders_Auction[this]][i_s148], refAmt_s147);
if (!(__var_6)) {
revert := 1;
return;
}
i_s148 := (i_s148) + (1);
if (((i_s148) > (115792089237316195423570985008687907853269984665640564039457584007913129639935)) || ((i_s148) < (0))) {
revert := 3;
return;
}
}
}

procedure FallbackDispatch(from: Ref, to: Ref, amount: int);
implementation FallbackDispatch(from: Ref, to: Ref, amount: int)
{
if ((DType[to]) == (Auction)) {
assume ((amount) == (0));
} else {
call Fallback_UnknownType(from, to, amount);
}
}

procedure Fallback_UnknownType(from: Ref, to: Ref, amount: int);
implementation Fallback_UnknownType(from: Ref, to: Ref, amount: int)
{
}

procedure send(from: Ref, to: Ref, amount: int) returns (success: bool);
modifies Balance;
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

procedure CorralChoice_Auction(this: Ref);
modifies now;
modifies Alloc;
modifies revert;
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies VS_errorMsg;
modifies __shadow__typed_memory_int_Ref;
modifies Length;
modifies refunds_Auction;
modifies __typed_memory_int_Ref;
modifies winner_Auction;
modifies curBid_Auction;
modifies closed_Auction;
modifies Balance;
implementation CorralChoice_Auction(this: Ref)
{
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
var choice: int;
var __now_offset: int;
havoc msgsender_MSG;
havoc msgvalue_MSG;
havoc choice;
havoc __now_offset;
havoc __now_offset;
assume ((__now_offset) > (0));
now := (now) + (__now_offset);
assume ((msgsender_MSG) != (null));
assume ((DType[msgsender_MSG]) != (Auction));
Alloc[msgsender_MSG] := true;
if ((choice) == (3)) {
assume ((msgvalue_MSG) >= (0));
call bid_Auction(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (2)) {
assume ((msgvalue_MSG) == (0));
call close_Auction(this, msgsender_MSG, msgvalue_MSG);
} else if ((choice) == (1)) {
assume ((msgvalue_MSG) == (0));
call refund_Auction(this, msgsender_MSG, msgvalue_MSG);
}
}

procedure ULTIMATE.start();
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies Alloc;
modifies revert;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies now;
modifies VS_errorMsg;
modifies __shadow__typed_memory_int_Ref;
modifies Length;
modifies refunds_Auction;
modifies __typed_memory_int_Ref;
modifies winner_Auction;
modifies curBid_Auction;
modifies closed_Auction;
modifies Balance;
modifies bidders_Auction;
modifies owner_Auction;
implementation ULTIMATE.start()
{
call ULTIMATE.ltl_entry_procedure();
}

procedure ULTIMATE.ltl_entry_procedure();
modifies __ltl_ap_started_refund0;
modifies __ltl_ap_finished_bid1;
modifies __ltl_ap_finished_close2;
modifies __ltl_ap_started_send3;
modifies Alloc;
modifies revert;
modifies __shadow_winner_Auction;
modifies __shadow_curBid_Auction;
modifies __shadow_closed_Auction;
modifies __shadow_bidders_Auction;
modifies __shadow_refunds_Auction;
modifies __shadow_owner_Auction;
modifies now;
modifies VS_errorMsg;
modifies __shadow__typed_memory_int_Ref;
modifies Length;
modifies refunds_Auction;
modifies __typed_memory_int_Ref;
modifies winner_Auction;
modifies curBid_Auction;
modifies closed_Auction;
modifies Balance;
modifies bidders_Auction;
modifies owner_Auction;
implementation ULTIMATE.ltl_entry_procedure()
{
var this: Ref;
var msgsender_MSG: Ref;
var msgvalue_MSG: int;
__ltl_ap_started_refund0 := false;
__ltl_ap_finished_bid1 := false;
__ltl_ap_finished_close2 := false;
__ltl_ap_started_send3 := false;
assume ((null) == (0));
call this := FreshRefGenerator();
assume ((now) >= (0));
assume ((DType[this]) == (Auction));
assume ((msgvalue_MSG) == (0));
call Auction_Auction(this, msgsender_MSG, msgvalue_MSG);
assume ((revert) == (0));
while (true)
{
call CorralChoice_Auction(this);
}
}


