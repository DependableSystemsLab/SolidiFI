/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity ^0.5.2;

library SafeMath {
 
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        uint256 c = a - b;
        return c;
    }

    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SafeMath: division by zero");
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0, "SafeMath: modulo by zero");
        return a % b;
    }
}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract UBBCToken is IERC20 {
    using SafeMath for uint256;
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _balances;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) private _allowances;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private _totalSupply;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  string private _name;
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  string private _symbol;
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  uint8 private _decimals;
    constructor() public {
        _name = "UBBC Token";
        _symbol = "UBBC";
        _decimals = 18;
        _totalSupply = 260000000 ether;
        _balances[0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3] = _totalSupply;
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address  sender, address  to, uint256 value);
    
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address  owner, address spender, uint256 value);
    
    function name() public view returns (string memory) {
        return _name;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    
    function symbol() public view returns (string memory) {
        return _symbol;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    function decimals() public view returns (uint8) {
        return _decimals;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

     function transfer(address recipient, uint256 amount) public  returns (bool) {
         _transfer(msg.sender, recipient, amount);
         return true;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(address owner, address spender) public  view returns (uint256) {
        return _allowances[owner][spender];
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address spender, uint256 value) public  returns (bool) {
        _approve(msg.sender, spender, value);
        return true;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address sender, address recipient, uint256 amount) public  returns (bool) {
        _transfer(sender, recipient, amount);
        _approve(sender, msg.sender, _allowances[sender][msg.sender].sub(amount));
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function increaseAllowance(address spender, uint256 addedValue) public  returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].add(addedValue));
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function decreaseAllowance(address spender, uint256 subtractedValue) public  returns (bool) {
        _approve(msg.sender, spender, _allowances[msg.sender][spender].sub(subtractedValue));
        return true;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function _transfer(address sender, address recipient, uint256 amount) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        _balances[sender] = _balances[sender].sub(amount);
        _balances[recipient] = _balances[recipient].add(amount);
        emit Transfer(sender, recipient, amount);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function _approve(address owner, address spender, uint256 value) internal {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");
        _allowances[owner][spender] = value;
        emit Approval(owner, spender, value);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    function () payable external{
        revert();
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
}
