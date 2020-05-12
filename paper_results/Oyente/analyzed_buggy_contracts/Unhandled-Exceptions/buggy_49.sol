/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.4.21 < 0.6.0;

contract TAMC {
  bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
  mapping (address => uint256) public balanceOf;

  function bug_unchk39(address  addr) public
      {addr.send (4 ether); }
  string public name = "TAMC";
  function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }
  string public symbol = "TAMC";
  function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }
  uint8 public decimals = 18;
    uint256 public totalSupply = 1000000000 * (uint256(10) ** decimals);

  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event Transfer(address indexed from, address indexed to, uint256 value);

    function TAMC() public {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
function UncheckedExternalCall_unchk40 () public
{  address  addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event Approval(address indexed owner, address indexed spender, uint256 value);

  bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
}
