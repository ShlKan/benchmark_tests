//#LTLFairness: <> (started(Auction.refund, closed && msg.sender == owner))
//#LTLProperty: [] (finished(Auction.bid, msg.value == 0xFF && msg.sender == address(0x1)) && (finished(Auction.close, winner != address(0x1))) ==> started(send(from, to, amt), to == address(0x1) && amt == 0xFF))
