/**
 *Submitted for verification at Etherscan.io on 2019-09-22
*/

pragma solidity ^0.5.0;

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

contract ERC20Detailed is IERC20 {

function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  string private _name;
function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  string private _symbol;
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint8 private _decimals;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
    _name = name;
    _symbol = symbol;
    _decimals = decimals;
  }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

  function name() public view returns(string memory) {
    return _name;
  }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

  function symbol() public view returns(string memory) {
    return _symbol;
  }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

  function decimals() public view returns(uint8) {
    return _decimals;
  }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
}

contract HYDROGEN is ERC20Detailed {

  using SafeMath for uint256;
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) private _balances;
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) private _allowed;

function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  string constant tokenName = "HYDROGEN";
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  string constant tokenSymbol = "HGN";
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint8  constant tokenDecimals = 4;
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 _totalSupply =8000000000;
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public basePercent = 100;

  constructor() public payable ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
    _mint(msg.sender, _totalSupply);
  }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

  function balanceOf(address owner) public view returns (uint256) {
    return _balances[owner];
  }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

  function findtwoPercent(uint256 value) public view returns (uint256)  {
    uint256 roundValue = value.ceil(basePercent);
    uint256 twoPercent = roundValue.mul(basePercent).div(5000);
    return twoPercent;
  }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

  function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _balances[msg.sender]);
    require(to != address(0));

    uint256 tokensToBurn = findtwoPercent(value);
    uint256 tokensToTransfer = value.sub(tokensToBurn);

    _balances[msg.sender] = _balances[msg.sender].sub(value);
    _balances[to] = _balances[to].add(tokensToTransfer);

    _totalSupply = _totalSupply.sub(tokensToBurn);

    emit Transfer(msg.sender, to, tokensToTransfer);
    emit Transfer(msg.sender, address(0), tokensToBurn);
    return true;
  }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

  function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(value <= _balances[from]);
    require(value <= _allowed[from][msg.sender]);
    require(to != address(0));

    _balances[from] = _balances[from].sub(value);

    uint256 tokensToBurn = findtwoPercent(value);
    uint256 tokensToTransfer = value.sub(tokensToBurn);

    _balances[to] = _balances[to].add(tokensToTransfer);
    _totalSupply = _totalSupply.sub(tokensToBurn);

    _allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);

    emit Transfer(from, to, tokensToTransfer);
    emit Transfer(from, address(0), tokensToBurn);

    return true;
  }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  function _mint(address account, uint256 amount) internal {
    require(amount != 0);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

  function burn(uint256 amount) external {
    _burn(msg.sender, amount);
  }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}

  function _burn(address account, uint256 amount) internal {
    require(amount != 0);
    require(amount <= _balances[account]);
    _totalSupply = _totalSupply.sub(amount);
    _balances[account] = _balances[account].sub(amount);
    emit Transfer(account, address(0), amount);
  }
function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}

  function burnFrom(address account, uint256 amount) external {
    require(amount <= _allowed[account][msg.sender]);
    _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(amount);
    _burn(account, amount);
  }
function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
}
