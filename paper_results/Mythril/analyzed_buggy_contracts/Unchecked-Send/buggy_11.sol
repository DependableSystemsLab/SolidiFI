/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
 (UTC) */

pragma solidity ^0.5.0;


library SafeMath {
    function add(uint a, uint b) internal pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
    function sub(uint a, uint b) internal pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
    function mul(uint a, uint b) internal pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
    function div(uint a, uint b) internal pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
}

contract ERC20Interface {
    function totalSupply() public view returns (uint);
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
    function balanceOf(address tokenOwner) public view returns (uint balance);
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
    function approve(address spender, uint tokens) public returns (bool success);
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}


contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}


contract Owned {
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  address public newOwner;

  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
}


contract ForTheBlockchain is ERC20Interface, Owned {
    using SafeMath for uint;

  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  uint public decimals;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  string public  name;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  uint _totalSupply;


  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint) balances;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint)) allowed;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "FTB";
        name = "ForTheBlockchain";
        decimals = 8;
        _totalSupply =100000000 * 10**(decimals);
        balances[owner] = _totalSupply;
        emit Transfer(address(0), owner, _totalSupply);
        
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public view returns (uint) {
        return _totalSupply.sub(balances[address(0)]);
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = balances[msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    //
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces
    // ------------------------------------------------------------------------
    function approve(address spender, uint tokens) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(tokens);
        emit Transfer(from, to, tokens);
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------
    function allowance(address tokenOwner, address spender) public view returns (uint remaining) {
        return allowed[tokenOwner][spender];
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account. The `spender` contract function
    // `receiveApproval(...)` is then executed
    // ------------------------------------------------------------------------
    function approveAndCall(address spender, uint tokens, bytes memory data) public returns (bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------
    function () external payable {
        revert();
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------
    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns (bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
}