/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.4.21 <0.6.0;
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
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }

    /// @notice send `_value` token to `_to` from `msg.sender`
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transfer(address _to, uint256 _value) public returns (bool success);
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    /// @notice send `_value` token to `_to` from `_from` on the condition it is approved by `_from`
    /// @param _from The address of the sender
    /// @param _to The address of the recipient
    /// @param _value The amount of token to be transferred
    /// @return Whether the transfer was successful or not
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    /// @notice `msg.sender` approves `_spender` to spend `_value` tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @param _value The amount of tokens to be approved for transfer
    /// @return Whether the approval was successful or not
    function approve(address _spender, uint256 _value) public returns (bool success);
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }

    /// @param _owner The address of the account owning tokens
    /// @param _spender The address of the account able to transfer the tokens
    /// @return Amount of remaining tokens allowed to spent
    function allowance(address _owner, address _spender) public view returns (uint256 remaining);
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }

    // solhint-disable-next-line no-simple-event-func-name
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

contract HotDollarsToken is EIP20Interface {
    uint256 constant private MAX_UINT256 = 2**256 - 1;
  function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
  mapping (address => uint256) public balances;
  function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  mapping (address => mapping (address => uint256)) public allowed;
    /*
    NOTE:
    The following variables are OPTIONAL vanities. One does not have to include them.
    They allow one to customise the token contract & in no way influences the core functionality.
    Some wallets/interfaces might not even bother to look at this information.
    */
  function UncheckedExternalCall_unchk4 () public
{  address  addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  string public name;                   //fancy name: eg Simon Bucks
  function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  uint8 public decimals;                //How many decimals to show.
  function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }
  string public symbol;                 //An identifier: eg SBX

function HotDollarsToken() public {
        totalSupply = 3 * 1e28;                        
        name = "HotDollars Token";                          
        decimals = 18;                           
        symbol = "HDS";
        balances[msg.sender] = totalSupply; 
    }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balances[msg.sender] >= _value);
        balances[msg.sender] -= _value;
        balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }

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
function UncheckedExternalCall_unchk40 () public
{  address  addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function balanceOf(address _owner) public view returns (uint256 balance) {
        return balances[_owner];
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars
        return true;
    }
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }
function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
}
