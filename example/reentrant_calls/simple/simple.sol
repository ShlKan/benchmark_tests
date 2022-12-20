// An example for different kinds of re-entrant calls.
// The idea is that state variable x should always be at most 1.
// The implementations of the foo_* functions violate the
// check-effect-interact pattern, so that this property should
// be violated for functions
// * foo_untrusted
// * foo_unclear, and
// * foo_fixed_address
// The different foo_* functions describe different external
// call scenarios that we need to distinguish.

//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// Our interface to another contract.
interface IOtherContract {
    function do_something() external returns (bool);
}

// Another contract that might be instantiated and serve as a destination
// for an external call to do_something.
contract OtherContract is IOtherContract {
    function do_something() external pure override returns (bool) {
        return true;
    }
}

contract Reentrancy {
    uint8 x;
    IOtherContract other_contract;
    address payable [] users;

    // We initially create an instance of OtherContract and deploy it
    // onto the blockchain. Its address is stored in the state variable
    // other_contract.
    constructor () {
        other_contract = new OtherContract();
        x = 0;
    }  
    
    // An untrusted re-entrant call (i.e. the callee's code is untrusted).
    // The address in variable untrusted that is passed into foo_unsafe
    // may point to arbitrary malicious code on the blockchain.
    // That code could call back into foo_unsafe.
    // We need to over-approximate using a re-entrancy stub.
    function foo_untrusted(IOtherContract untrusted) public {
    	users.push(payable(msg.sender));
        if (x < 1 && untrusted.do_something()) {
            x = x + 1;
        }
    }


    // This function is considered trusted, as the callee is within the
    // same contract (this). Hence, we are sure we know its code. No
    // need to over-approximate by a reentrancy-stub here.
    function foo_trusted() public {
        if (x < 1 && this.do_something()) {
            x = x + 1;
        }
    }

    // Here the situation is difficult. If we could prove a contract
    // invariant that other_contract always points to an instance of
    // OtherContract, we could use its source code to model the call.
    // However, if the address that other_contract points to could
    // somehow be modified, we need to over-approximate and the callee
    // becomes untrusted.
    function foo_unclear() public {
        if (x < 1 && other_contract.do_something()) {
            x = x + 1;
        }
    }

    // That is the last case: The callee is at a hard-coded address
    // (e.g. some DeFi exchange like UniSwap). For popular contracts,
    // we potentially need to maintain a set of stubs that we can
    // use to model the effects of such calls.
    // So this is a case where the callee can be (partially) trusted
    // given that the address is known to CertiK, the contract is not
    // upgradable, and that we have already built a stub for the callee.
    function foo_fixed_address() public {
        address uniswap = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;
        IOtherContract popular_contract = IOtherContract(uniswap);
        if (x < 1 && popular_contract.do_something()) {
            x = x + 1;
        }
    }

    // This is just a do_something method that is used in a
    // safe external call that originates from the very same
    // smart contract Reentrancy.
    // See body of function foo_trusted.
    function do_something() external pure returns (bool) {
        return true;
    }
}
