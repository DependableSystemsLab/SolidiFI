/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
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
        require(c >= a);

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}

interface IERC20 {
    function totalSupply() public view returns (uint256);
    
    function balanceOf(address who) public view returns (uint256);
      
    function transfer(address to, uint256 value) public returns (bool);

    function transferFrom(address from, address to, uint256 value) public returns (bool);

    function approve(address spender, uint256 value) public returns (bool);

    function allowance(address owner, address spender) public view returns (uint256);


    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burn(address indexed from, uint256 value);
}


contract ERC20 is IERC20 {
    
    using SafeMath for uint256;
  function bug_unchk19() public{
address  addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  uint8 constant DECIMALS = 18;
  function unhandledsend_unchk26(address  callee) public {
    callee.send(5 ether);
  }
  uint256 private _totalSupply;
    string private _name;
    string private _symbol;
    
  bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  mapping (address => uint256) private _balances;
  bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  mapping (address => mapping (address => uint256)) private _allowed;


    function totalSupply() public view returns (uint256) {
        return _totalSupply;
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

    function balanceOf(address owner) public view returns (uint256) {
        return _balances[owner];
    }
function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }

    function transferFrom(address from, address to, uint256 value) public returns (bool) {
         _transfer(from, to, value);
         _approve(from, msg.sender, _allowed[from][msg.sender].sub(value));
         return true;
    }
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }

    function approve(address spender, uint256 value) public returns (bool) {
        _approve(msg.sender, spender, value);
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
    
    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowed[owner][spender];
    }
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    
    function burn(uint256 value) public {
        _burn(msg.sender, value);
    }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }
    
    function _mint(address account, uint256 value) internal {
        require(account != address(0));
        _totalSupply = _totalSupply.add(value);
        _balances[account] = _balances[account].add(value);
        emit Transfer(address(0), account, value);
    }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }
    
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0));

        _balances[from] = _balances[from].sub(value);
        _balances[to] = _balances[to].add(value);
        emit Transfer(from, to, value);
      
    }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }

    function _approve(address owner, address spender, uint256 value) internal {
        require(spender != address(0));
        require(owner != address(0));

        _allowed[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
    function _burn(address account, uint256 value) internal {
        require(account != address(0));
    
        _totalSupply = _totalSupply.sub(value);
        _balances[account] = _balances[account].sub(value);
        emit Transfer(account, address(0), value);
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
}

contract ERC20Detailed is IERC20 {
    string private _name;
    string private _symbol;
  function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
  uint8 private _decimals;

    function ERC20Detailed (string memory name, string memory symbol, uint8 decimals) public {
        _name = name;
        _symbol = symbol;
        _decimals = decimals;
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

    /**
     * @return the name of the token.
     */
    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }

    /**
     * @return the symbol of the token.
     */
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * @return the number of decimals of the token.
     */
    function decimals() public view returns (uint8) {
        return _decimals;
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
}

contract SaveWon is ERC20, ERC20Detailed {
  function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  uint8 public constant DECIMALS = 18;
    uint256 public constant INITIAL_SUPPLY = 50000000000 * (10 ** uint256(DECIMALS));

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     */
    function SaveWon () public ERC20Detailed("SaveWon", "SVW", DECIMALS) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
}
