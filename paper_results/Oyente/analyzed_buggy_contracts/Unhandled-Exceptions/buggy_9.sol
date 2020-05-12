/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
 (UTC) */

pragma solidity >=0.4.21 <0.6.0;

/**
 * @title SafeMath
 *  Math operations with safety checks that throw on error
 */
library SafeMath {

  /**
  *  Multiplies two numbers, throws on overflow.
  */
  function mul(uint256 a, uint256 b) internal pure returns (uint256 c) {
    if (a == 0) {
        return 0;
    }
    c = a * b;
    assert(c / a == b);
    return c;
  }

  /**
  *  Integer division of two numbers, truncating the quotient.
  */
  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    // assert(b > 0); // Solidity automatically throws when dividing by 0
    // uint256 c = a / b;
    // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    return a / b;
  }

  /**
  *  Subtracts two numbers, throws on overflow (i.e. if subtrahend is greater than minuend).
  */
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  /**
  *  Adds two numbers, throws on overflow.
  */
  function add(uint256 a, uint256 b) internal pure returns (uint256 c) {
    c = a + b;
    assert(c >= a);
    return c;
  }
}


contract Ownable {
  bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
  address public owner;

    function Ownable() public {
        owner = msg.sender;
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

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract TokenERC20 is Ownable {
    using SafeMath for uint256;

    // Public variables of the token
  function callnotchecked_unchk25(address  callee) public {
    callee.call.value(1 ether);
  }
  string public name;
  function bug_unchk19() public{
address  addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
  string public symbol;
  function unhandledsend_unchk26(address  callee) public {
    callee.send(5 ether);
  }
  uint8 public decimals;

  bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 private _totalSupply;
  bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  uint256 public cap;

    // This creates an array with all balances
  function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
  mapping (address => uint256) private _balances;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  mapping (address => mapping (address => uint256)) private _allowed;

    // This generates a public event on the blockchain that will notify clients
  function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event Transfer(address indexed from, address indexed to, uint256 value);

    // This generates a public event on the blockchain that will notify clients
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event Approval(address indexed owner, address indexed spender, uint256 value);

    // This generates a public event on the blockchain that will notify clients
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event Mint(address indexed to, uint256 amount);

    /**
     * @dev Fix for the ERC20 short address attack.
     */
    modifier onlyPayloadSize(uint size) {
        require(msg.data.length >= size + 4);
        _;
    }

    /**
     * Constrctor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    function TokenERC20(
        uint256 _cap,
        uint256 _initialSupply,
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) public {
        require(_cap >= _initialSupply);

        cap = _cap;
        name = _name;                                       // Set the cap of total supply
        symbol = _symbol;                                   // Set the symbol for display purposes
        decimals = _decimals;                               // Set the decimals

        _totalSupply = _initialSupply;                      // Update total supply with the decimal amount
        _balances[owner] = _totalSupply;                    // Give the creator all initial tokens
        emit Transfer(address(0), owner, _totalSupply);
    }
function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    /**
     * Total number of tokens in existence.
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }

    /**
     * Gets the balance of the specified address.
     * @param _owner The address to query the balance of.
     * @return A uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }

    /**
     * Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowed[_owner][_spender];
    }
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /**
     * Transfer token to a specified address.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32) public returns (bool) {
        _transfer(msg.sender, _to, _value);
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

    /**
     * Approve the passed address to spend the specified amount of tokens on behalf of msg.sender.
     * Beware that changing an allowance with this method brings the risk that someone may use both the old
     * and the new allowance by unfortunate transaction ordering. One possible solution to mitigate this
     * race condition is to first reduce the spender's allowance to 0 and set the desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     * @param _spender The address which will spend the funds.
     * @param _value The amount of tokens to be spent.
     */
    function approve(address _spender, uint256 _value) public returns (bool) {
        _approve(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }

    /**
     * Transfer tokens from one address to another.
     * Note that while this function emits an Approval event, this is not required as per the specification,
     * and other compliant implementations may not emit the event.
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     */
    function transferFrom(address _from, address _to, uint256 _value) onlyPayloadSize(3 * 32) public returns (bool) {
        _transfer(_from, _to, _value);
        _approve(_from, msg.sender, _allowed[_from][msg.sender].sub(_value));
        return true;
    }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }

    /**
     * Transfer token for a specified addresses.
     * @param _from The address to transfer from.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0));

        _balances[_from] = _balances[_from].sub(_value);
        _balances[_to] = _balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
    }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }

    /**
     * Approve an address to spend another addresses' tokens.
     * @param _owner The address that owns the tokens.
     * @param _spender The address that will spend the tokens.
     * @param _value The number of tokens that can be spent.
     */
    function _approve(address _owner, address _spender, uint256 _value) internal {
        require(_owner != address(0));
        require(_spender != address(0)	);

        _allowed[_owner][_spender] = _value;
        emit Approval(_owner, _spender, _value);
    }
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

    /**
     * Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _amount The amount of tokens to mint.
     * @return A boolean that indicates if the operation was successful.
     */
    function mint(address _to, uint256 _amount) onlyOwner public returns (bool) {
        require(_totalSupply.add(_amount) <= cap);

        _totalSupply = _totalSupply.add(_amount);
        _balances[_to] = _balances[_to].add(_amount);
        emit Mint(_to, _amount);
        emit Transfer(address(0), _to, _amount);
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

    /**
     * Transfer token to servral addresses.
     * @param _tos The addresses to transfer to.
     * @param _values The amounts to be transferred.
     */
    function transferBatch(address[] memory _tos, uint256[] memory _values) public returns (bool) {
        require(_tos.length == _values.length);

        for (uint256 i = 0; i < _tos.length; i++) {
            transfer(_tos[i], _values[i]);
        }
        return true;
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
}

/******************************************/
/*       XLToken TOKEN STARTS HERE       */
/******************************************/

contract XLToken is TokenERC20 {
    /* Initializes contract with initial supply tokens to the creator of the contract */
    function XLToken() TokenERC20(18*10**16, 12*10**16, "XL Token", "XL", 8) public {}
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }
}
