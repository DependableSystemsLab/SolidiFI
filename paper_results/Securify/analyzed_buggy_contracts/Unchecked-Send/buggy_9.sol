/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
 (UTC) */

pragma solidity >=0.4.22 <0.6.0;

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
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract TokenERC20 is Ownable {
    using SafeMath for uint256;

    // Public variables of the token
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  string public name;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _totalSupply;
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public cap;

    // This creates an array with all balances
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _balances;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) private _allowed;

    // This generates a public event on the blockchain that will notify clients
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);

    // This generates a public event on the blockchain that will notify clients
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);

    // This generates a public event on the blockchain that will notify clients
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
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
    constructor(
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
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Total number of tokens in existence.
     */
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Gets the balance of the specified address.
     * @param _owner The address to query the balance of.
     * @return A uint256 representing the amount owned by the passed address.
     */
    function balanceOf(address _owner) public view returns (uint256) {
        return _balances[_owner];
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Function to check the amount of tokens that an owner allowed to a spender.
     * @param _owner address The address which owns the funds.
     * @param _spender address The address which will spend the funds.
     * @return A uint256 specifying the amount of tokens still available for the spender.
     */
    function allowance(address _owner, address _spender) public view returns (uint256) {
        return _allowed[_owner][_spender];
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Transfer token to a specified address.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function transfer(address _to, uint256 _value) onlyPayloadSize(2 * 32) public returns (bool) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Transfer token for a specified addresses.
     * @param _from The address to transfer from.
     * @param _to The address to transfer to.
     * @param _value The amount to be transferred.
     */
    function _transfer(address _from, address _to, uint256 _value) internal {
        require(_to != address(0), "ERC20: transfer to the zero address");

        _balances[_from] = _balances[_from].sub(_value);
        _balances[_to] = _balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Approve an address to spend another addresses' tokens.
     * @param _owner The address that owns the tokens.
     * @param _spender The address that will spend the tokens.
     * @param _value The number of tokens that can be spent.
     */
    function _approve(address _owner, address _spender, uint256 _value) internal {
        require(_owner != address(0), "ERC20: approve from the zero address");
        require(_spender != address(0), "ERC20: approve to the zero address");

        _allowed[_owner][_spender] = _value;
        emit Approval(_owner, _spender, _value);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
}

/******************************************/
/*       XLToken TOKEN STARTS HERE       */
/******************************************/

contract XLToken is TokenERC20 {
    /* Initializes contract with initial supply tokens to the creator of the contract */
    constructor() TokenERC20(18*10**16, 12*10**16, "XL Token", "XL", 8) public {}
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
}