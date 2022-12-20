//SPDX-License-Identifier: nonlicence

pragma solidity ^0.8.0;

contract Auction {
   address payable winner ;
   uint curBid = 0;
   bool closed = false;
   address payable [] bidders;
   mapping (address => uint) refunds;
   address private owner;

   constructor() {
       owner = msg.sender;
    }

   function bid() payable public {
       address payable sender = payable(msg.sender);
       require (!closed && msg.value > curBid);
       require (refunds[sender] == 0 && sender != winner);
       refunds[winner] = curBid;
       bidders.push(sender);
       winner = sender;
       curBid = msg.value;
   }

   function close() public {
       require(owner == msg.sender, "caller is not the owner");
       closed = true;
   }

   function refund() public {
       require(owner == msg.sender, "caller is not the owner");
       require(closed);
       for (uint i = 0 ; i < bidders.length; i ++) {
       	   uint refAmt = refunds[bidders[i]];
	   refunds[bidders[i]] = 0;
	   bidders[i].transfer(refAmt);
       }
   }
}

