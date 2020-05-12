/**
 * Source Code first verified at https://etherscan.io on Thursday, March 28, 2019
 (UTC) */

pragma solidity ^0.5.00;

// ----------------------------------------------------------------------------
// 'August Coin' token contract
//
// Deployed to : 0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD
// Symbol      : AUC
// Name        : AugustCoin
// Total supply: 100000000
// Decimals    : 18
//
// Enjoy.
//
// (c) by Ahiwe Onyebuchi Valentine.
// ----------------------------------------------------------------------------


// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------
contract SafeMath {
    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
    function safeMul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
}


// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------
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


// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
//
// Borrowed from MiniMeToken
// ----------------------------------------------------------------------------
contract ApproveAndCallFallBack {
    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
}


// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------
contract Owned {
    address public owner;
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


// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and assisted
// token transfers
// ----------------------------------------------------------------------------
contract AugustCoin is ERC20Interface, Owned, SafeMath {
    string public symbol;
  function bug_unchk_send18() payable public{
      msg.sender.transfer(1 ether);}
  string public  name;
  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  uint public _totalSupply;

  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => uint) balances;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint)) allowed;


    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------
    constructor() public {
        symbol = "AUC";
        name = "AugustCoin";
        decimals = 18;
        _totalSupply = 100000000000000000000000000;
        balances[0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD] = _totalSupply;
        emit Transfer(address(0), 0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD, _totalSupply);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------
    function totalSupply() public view returns (uint) {
        return _totalSupply - balances[address(0)];
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Get the token balance for account tokenOwner
    // ------------------------------------------------------------------------
    function balanceOf(address tokenOwner) public view returns (uint balance) {
        return balances[tokenOwner];
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to to account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transfer(address to, uint tokens) public returns (bool success) {
        balances[msg.sender] = safeSub(balances[msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
        emit Transfer(msg.sender, to, tokens);
        return true;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}


    // ------------------------------------------------------------------------
    // Token owner can approve for spender to transferFrom(...) tokens
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
    // Transfer tokens from the from account to the to account
    // 
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the from account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------
    function transferFrom(address from, address to, uint tokens) public returns (bool success) {
        balances[from] = safeSub(balances[from], tokens);
        allowed[from][msg.sender] = safeSub(allowed[from][msg.sender], tokens);
        balances[to] = safeAdd(balances[to], tokens);
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
    // Token owner can approve for spender to transferFrom(...) tokens
    // from the token owner's account. The spender contract function
    // receiveApproval(...) is then executed
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


