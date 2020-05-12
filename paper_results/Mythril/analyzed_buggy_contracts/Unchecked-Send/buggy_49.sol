/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity ^0.5.11;

contract TAMC {
  function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balanceOf;

  function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
  string public name = "TAMC";
  function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol = "TAMC";
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals = 18;
    uint256 public totalSupply = 1000000000 * (uint256(10) ** decimals);

  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function transfer(address to, uint256 value) public returns (bool success) {
        require(balanceOf[msg.sender] >= value);
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
        emit Transfer(msg.sender, to, value);
        return true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}

  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed owner, address indexed spender, uint256 value);

  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => mapping(address => uint256)) public allowance;

    function approve(address spender, uint256 value)
        public
        returns (bool success)
    {
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}

    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool success)
    {
        require(value <= balanceOf[from]);
        require(value <= allowance[from][msg.sender]);

        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        emit Transfer(from, to, value);
        return true;
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
}
