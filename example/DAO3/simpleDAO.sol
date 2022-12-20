
pragma solidity ^0.8.0;

contract SimpleDAO {
  mapping (address => uint) public credit;
      
  function withdraw() public{
    bool success;
    bytes memory data;

    uint amount = credit[msg.sender] ;
    (success, data) = msg.sender.call{value: amount}("");
    require(success);
    credit[msg.sender]-=amount;
  }  
}