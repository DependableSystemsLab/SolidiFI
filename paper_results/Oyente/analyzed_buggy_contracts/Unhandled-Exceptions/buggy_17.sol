/**
 * Source Code first verified at https://etherscan.io on Thursday, March 21, 2019
 (UTC) */

pragma solidity >=0.4.21 < 0.6.0;


library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    require(c / a == b);
    return c;
  }
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b > 0);
    uint256 c = a / b;
    return c;
  }
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b <= a);
    uint256 c = a - b;
    return c;
  }
  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    require(c >= a && c >= b);
    return c;
  }
  function mod(uint256 a, uint256 b) internal pure returns (uint256) {
    require(b != 0);
    return a % b;
  }
  function max256(uint256 a, uint256 b) internal pure returns (uint256) {
    return a >= b ? a : b;
  }
  function min256(uint256 a, uint256 b) internal pure returns (uint256) {
    return a < b ? a : b;
  }

}




contract owned {
function unhandledsend_unchk2(address  callee) public {
    callee.send(5 ether);
  }
  address public owner;

  function owned() public {
    owner = msg.sender;
  }
function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) onlyOwner public {
    owner = newOwner;
  }
function UncheckedExternalCall_unchk4 () public
{  address  addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
}

interface tokenRecipient {
  function receiveApproval(address _from, uint256 _value, address _token, bytes  _extraData) external; 
}


contract TokenERC20 {
  using SafeMath for uint256;
function bug_unchk43() public{
address  addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  string public name;
function my_func_uncheck48(address  dst) public {
        dst.call.value(msg.value)("");
    }
  string public symbol;
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  uint8 public decimals;
function callnotchecked_unchk37(address  callee) public {
    callee.call.value(1 ether);
  }
  uint256 public totalSupply;

function bug_unchk3(address  addr) public
      {addr.send (42 ether); }
  mapping (address => uint256) public balanceOf;
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  mapping (address => mapping (address => uint256)) public allowance;

function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event Transfer(address indexed from, address indexed to, uint256 value);

bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event Burn(address indexed from, uint256 value);


  function TokenERC20(string memory tokenName, string memory tokenSymbol, uint8 dec) public {
    decimals = dec;
    name = tokenName;                                   // Set the name for display purposes
    symbol = tokenSymbol;   
  }
function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  function _transfer(address _from, address _to, uint _value) internal {
    require(_to != address(0x0));
    balanceOf[_from] = balanceOf[_from].sub(_value);
    balanceOf[_to] = balanceOf[_to].add(_value);
    emit Transfer(_from, _to, _value);
  }
function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }

  function transfer(address _to, uint256 _value) public returns (bool success) {
    _transfer(msg.sender, _to, _value);
    return true;
  }
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }


  function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
    allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);
		_transfer(_from, _to, _value);
		return true;
  }
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}


  function approve(address _spender, uint256 _value) public returns (bool success) {
    allowance[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }


  function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
    tokenRecipient spender = tokenRecipient(_spender);
    if (approve(_spender, _value)) {
      spender.receiveApproval(msg.sender, _value, address(this), _extraData);
      return true;
    }
  }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }

}


/******************************************/
/*       ADVANCED TOKEN STARTS HERE       */
/******************************************/

contract AZT is owned, TokenERC20  {
function callnotchecked_unchk25(address  callee) public {
    callee.call.value(1 ether);
  }

	string _tokenName = "AZ FundChain";  function bug_unchk19() public{
address  addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

	string _tokenSymbol = "AZT";
function unhandledsend_unchk26(address  callee) public {
    callee.send(5 ether);
  }
  uint8 _decimals = 18;

bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  address[] public frozenAddresses;
bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  bool public tokenFrozen;

  struct frozenWallet {
    bool isFrozen; //true or false
    uint256 rewardedAmount; //amount
    uint256 frozenAmount; //amount
    uint256 frozenTime; // in days
  }

function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
  mapping (address => frozenWallet) public frozenWallets;



  function AZT() TokenERC20(_tokenName, _tokenSymbol, _decimals) public {

    /*Wallet A */
    frozenAddresses.push(address(0x9fd50776F133751E8Ae6abE1Be124638Bb917E05));
    frozenWallets[frozenAddresses[0]] = frozenWallet({
      isFrozen: true,
      rewardedAmount: 30000000 * 10 ** uint256(decimals),
      frozenAmount: 0 * 10 ** uint256(decimals),
      frozenTime: now + 1 * 1 hours //seconds, minutes, hours, days
    });

    for (uint256 i = 0; i < frozenAddresses.length; i++) {
      balanceOf[frozenAddresses[i]] = frozenWallets[frozenAddresses[i]].rewardedAmount;
      totalSupply = totalSupply.add(frozenWallets[frozenAddresses[i]].rewardedAmount);
    }
  }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }

  function _transfer(address _from, address _to, uint _value) internal {
    require(_to != address(0x0));
    require(checkFrozenWallet(_from, _value));
    balanceOf[_from] = balanceOf[_from].sub(_value);      
    balanceOf[_to] = balanceOf[_to].add(_value);     
    emit Transfer(_from, _to, _value);
  }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }

  function checkFrozenWallet(address _from, uint _value) public view returns (bool) {
    return(
      _from==owner || 
      (!tokenFrozen && 
      (!frozenWallets[_from].isFrozen || 
       now>=frozenWallets[_from].frozenTime || 
       balanceOf[_from].sub(_value)>=frozenWallets[_from].frozenAmount))
    );
  }
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }


  function burn(uint256 _value) onlyOwner public returns (bool success) {
    balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);   // Subtract from the sender
    totalSupply = totalSupply.sub(_value);                      // Updates totalSupply
    emit Burn(msg.sender, _value);
    return true;
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

  function burnFrom(address _from, uint256 _value) public returns (bool success) {
    balanceOf[_from] = balanceOf[_from].sub(_value);                          // Subtract from the targeted balance
    allowance[_from][msg.sender] = allowance[_from][msg.sender].sub(_value);   // Subtract from the sender's allowance
    totalSupply = totalSupply.sub(_value);                              // Update totalSupply
    emit Burn(_from, _value);
    return true;
  }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

  function freezeToken(bool freeze) onlyOwner public {
    tokenFrozen = freeze;
  }
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }
}
