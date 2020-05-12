/**
 *Submitted for verification at Etherscan.io on 2019-09-28
*/

pragma solidity ^0.5.1;

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
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address public owner;
    /**
     * @dev The owned constructor sets the original `owner` of the contract to the sender
     * account.
     */
    constructor() public {
        owner = msg.sender;
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    /**
     * @dev Allows the current owner to transfer control of the contract to a newOwner.
     */
    function transferOwnership(address newOwner) onlyOwner public {
        require(newOwner != address(0));
        owner = newOwner;
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }
}

contract ethBank is owned{
    
    function () payable external {}
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }
    
    function withdrawForUser(address payable _address,uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method");
        _address.transfer(amount);
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    function moveBrick(uint amount) onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(amount);
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }
    
    /**
     * @dev withdraws Contracts  balance.
     * -functionhash- 0x7ee20df8
     */
    function moveBrickContracts() onlyOwner public
    {
        // only team just can withdraw Contracts
        require(msg.sender == owner, "only owner can use this method"); 
        
        msg.sender.transfer(address(this).balance);
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    // either settled or refunded. All funds are transferred to contract owner.
    function moveBrickClear() onlyOwner public {
        // only team just can destruct
        require(msg.sender == owner, "only owner can use this method"); 

        selfdestruct(msg.sender);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }
    
    
    
    ////////////////////////////////////////////////////////////////////
    
    function joinFlexible() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
    function joinFixed() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function staticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }
    function activeBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    function teamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function staticBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    function activeBonusCacl_1() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }
    function activeBonusCacl_2() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
    function activeBonusCacl_3() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    function activeBonusCacl_4() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    function activeBonusCacl_5() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }
    function activeBonusCacl_6() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
    function activeBonusCacl_7() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
    function activeBonusCacl_8() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    function activeBonusCacl_9() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    function teamAddBonusCacl() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
    function caclTeamPerformance() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
    function releaStaticBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    function releaActiveBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
    function releaTeamAddBonus() onlyOwner public{
        require(msg.sender == owner, "only owner can use this method"); 
        msg.sender.transfer(address(this).balance);
        
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
}
