/**
 * Source Code first verified at https://etherscan.io on Thursday, May 9, 2019
 (UTC) */

pragma solidity ^0.5.7;
/**
 * ███████╗ ██████╗ ██████╗  █████╗ ███╗   ███╗
 * ██╔════╝██╔════╝ ██╔══██╗██╔══██╗████╗ ████║
 * █████╗  ██║  ███╗██████╔╝███████║██╔████╔██║
 * ██╔══╝  ██║   ██║██╔══██╗██╔══██║██║╚██╔╝██║
 * ███████╗╚██████╔╝██║  ██║██║  ██║██║ ╚═╝ ██║
 * ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝                                         
 */

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error.
 */
library SafeMath {

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

}

/**
 * Token contract interface for external use
 */
contract ERC20TokenInterface {

    function balanceOf(address _owner) public view returns (uint256 value);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    }

/**
* @title Token definition
* @dev Define token paramters including ERC20 ones
*/
contract ERC20Token is ERC20TokenInterface {
    using SafeMath for uint256;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) balances; //A mapping of all balances per address
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) allowed; //A mapping of all allowances

    /**
    * @dev Get the balance of an specified address.
    * @param _owner The address to be query.
    */
    function balanceOf(address _owner) public view returns (uint256 value) {
        return balances[_owner];
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev transfer token to a specified address
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev transfer token from an address to another specified address using allowance
    * @param _from The address where token comes.
    * @param _to The address to transfer to.
    * @param _value The amount to be transferred.
    */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
        balances[_from] = balances[_from].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(_from, _to, _value);
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Assign allowance to an specified address to use the owner balance
    * @param _spender The address to be allowed to spend.
    * @param _value The amount to be allowed.
    */
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Get the allowance of an specified address to use another address balance.
    * @param _owner The address of the owner of the tokens.
    * @param _spender The address of the allowed spender.
    */
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Log Events
    */
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

/**
* @title Asset
* @dev Initial supply creation
*/
contract AsseteGram is ERC20Token {
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  string public name = 'Electronic Gram';
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals = 3;
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol = 'eGram';
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  string public version = '2';

    constructor() public {
        address initialOwner = 0xac775cD446889ac167da466692449ece5439fc12;
        totalSupply = 180000000 * (10**uint256(decimals)); //initial token creation
        balances[initialOwner] = totalSupply;
        emit Transfer(address(0), initialOwner, balances[initialOwner]);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    /**
    *@dev Function to handle callback calls
    */
    function() external {
        revert();
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

}
