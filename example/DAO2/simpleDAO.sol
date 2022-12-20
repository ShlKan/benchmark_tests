
//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract SimpleDAO {
  mapping (address => uint) public credit;
    
  function donate(address to) payable public{
    credit[to] += msg.value;
  }
    
  function withdraw() public{
    bool success;
    bytes memory data;

    uint amount = credit[msg.sender] ;
    credit[msg.sender]-=amount;
    (success, data) = msg.sender.call{value: amount}("");
    require(success);
    
  
  }


  function queryCredit(address to) view public returns(uint){
    return credit[to];
  }
}