//SPDX-License-Identifier: nonlicence

pragma solidity ^0.8.0;

contract mutex_fallback_test {

    mapping (address => uint) private balances;
    bool private lockBalances;

    function deposit() payable public returns (bool) {
        require(!lockBalances);
    	lockBalances = true;
    	balances[msg.sender] += msg.value;
    	lockBalances = false;
    	return true;
    }

    function fbug() public {
    	lockBalances = false;
    }

    function withdraw(uint amount) payable public returns (bool) {
    	require(!lockBalances && amount > 0 && balances[msg.sender] >= amount);
    	lockBalances = true;

    	(bool success, bytes memory data) = msg.sender.call{value: amount}("");

    	if (success) { 
      	   balances[msg.sender] -= amount;
    	}

    	lockBalances = false;
    	return true;
    }

}