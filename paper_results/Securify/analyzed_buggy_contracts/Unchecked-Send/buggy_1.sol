/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.4.22 <0.6.0;
contract EIP20Interface {
    /* This is a slight change to the ERC20 base standard.
    function totalSupply() constant returns (uint256 supply);
    is replaced with:
    uint256 public totalSupply;
    This automatically creates a getter function for the totalSupply.
    This is moved to the base contract since public getter functions are not
    currently recognised as an implementation of the matching abstract
    function by the compiler.
    */
    /// total amount of tokens
    uint256 public totalSupply;

    /// @param _owner The address from which the balance will be retrieved
    /// @return The balance
    function balanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _value The amount of tokens to be approved for transfer
    /// @return Whether the approval was successful or not
    function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    // solhint-disable-next-line no-simple-event-func-name
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract HotDollarsToken is EIP20Interface {
    uint256 constant private MAX_UINT256 = 2**256 - 1;
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balances;
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowed;
    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  string public name;                   //fancy name: eg Simon Bucks
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;                //How many decimals to show.
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;                 //An identifier: eg SBX

    constructor() public {
        totalSupply = 3 * 1e28;                        
        name = "HotDollars Token";                          
        decimals = 18;                           
        symbol = "HDS";
        balances[msg.sender] = totalSupply; 
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _value && allowance >= _value);
        balances[_to] += _value;
        balances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }
        emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
}