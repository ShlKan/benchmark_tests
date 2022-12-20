
//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IOtherContract {
    function do_something() external returns (bool);
}

contract OtherContract is IOtherContract {
    function do_something() external pure override returns (bool) {
        return true;
    }
}

contract Reentrancy {
    uint8 x;
    IOtherContract other_contract;
    mapping(address => uint256) balance;

    constructor () {
        other_contract = new OtherContract();
        x = 0;
    }  

    function deposit(address payable adr, uint256 amt) public {
        balance[adr] = amt;
    }

    function foo_untrusted(IOtherContract untrusted) public {
        if (x < 1 && untrusted.do_something()) {
            x = x + 1;
        }
    }

    function sendm(uint amt) public {
    	if (balance[msg.sender] >= amt) {
    	   (bool success, bytes memory ad) =
	   	 	  msg.sender.call{value: amt}("");
	   balance[msg.sender] -= amt;
	}
    }

    function do_something() external pure returns (bool) {
        return true;
    }
}
