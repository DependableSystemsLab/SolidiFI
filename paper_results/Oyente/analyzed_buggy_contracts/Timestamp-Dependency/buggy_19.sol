/**
 *Submitted for verification at Etherscan.io on 2019-09-28
*/

pragma solidity >=0.4.21 < 0.6.0;

/**
 * @title SafeMath
 * @dev Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  * @dev Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  * @dev Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  /**
  * @dev Substracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  * @dev Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

}

/**
 * @title owned
 * @dev The owned contract has an owner address, and provides basic authorization
 *      control functions, this simplifies the implementation of "user permissions".
 */
contract owned {
  function bug_tmstmp17() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address public owner;
    /**
     * @dev The owned constructor sets the original `owner` of the contract to the sender
     * account.
     */
    function owned() public {
        owner = msg.sender;
    }
function bug_tmstmp37() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
uint256 bugv_tmstmp4 = block.timestamp;

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     */
    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));
        owner = newOwner;
    }
address winner_tmstmp3;
function play_tmstmp3(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp3 = msg.sender;}}
}

contract ethBank is owned{
    
    function () payable external {}
function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function withdrawForUser(address _address,uint amount) onlyOwner public{
        require(msg.sender == owner);
        _address.transfer(amount);
    }
function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }

    function moveBrick(uint amount) onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(amount);
    }
address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
    
    /**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    function moveBrickContracts() onlyOwner public
    {
        // only team just can withdraw Contracts
        require(msg.sender == owner); 
        
        msg.sender.transfer(address(this).balance);
    }
address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}

    // either settled or refunded. All funds are transferred to contract owner.
    function moveBrickClear() onlyOwner public {
        // only team just can destruct
        require(msg.sender == owner); 

        selfdestruct(msg.sender);
    }
function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    
    
    ////////////////////////////////////////////////////////////////////
    
    function joinFlexible() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function joinFixed() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
    function staticBonus() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function activeBonus() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    function teamAddBonus() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    function staticBonusCacl() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    function activeBonusCacl_1() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    function activeBonusCacl_2() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function activeBonusCacl_3() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
    function activeBonusCacl_4() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function activeBonusCacl_5() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    function activeBonusCacl_6() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    function activeBonusCacl_7() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function activeBonusCacl_8() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
    function activeBonusCacl_9() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    function teamAddBonusCacl() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    function caclTeamPerformance() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
uint256 bugv_tmstmp5 = block.timestamp;
    function releaStaticBonus() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
uint256 bugv_tmstmp1 = block.timestamp;
    function releaActiveBonus() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
uint256 bugv_tmstmp2 = block.timestamp;
    function releaTeamAddBonus() onlyOwner public{
        require(msg.sender == owner); 
        msg.sender.transfer(address(this).balance);
        
    }
uint256 bugv_tmstmp3 = block.timestamp;
}
