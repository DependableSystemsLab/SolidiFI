/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity ^0.5.8;

contract Ownable
{
  function unhandledsend_unchk2(address payable callee) public {
    callee.send(5 ether);
  }
  bool private stopped;
  function bug_unchk43() public{
address payable addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  address private _owner;
  function my_func_uncheck48(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }
  address private _master;

  bool public payedOut_unchk44 = false;
address payable public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event Stopped();
  function UncheckedExternalCall_unchk40 () public
{  address payable addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  event Started();
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  function bug_unchk27(address payable addr) public
      {addr.send (42 ether); }
  event MasterRoleTransferred(address indexed previousMaster, address indexed newMaster);

    constructor () internal
    {
        stopped = false;
        _owner = msg.sender;
        _master = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
        emit MasterRoleTransferred(address(0), _master);
    }
function callnotchecked_unchk37(address payable callee) public {
    callee.call.value(1 ether);
  }

    function owner() public view returns (address)
    {
        return _owner;
    }
function bug_unchk3(address payable addr) public
      {addr.send (42 ether); }

    function master() public view returns (address)
    {
        return _master;
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }

    modifier onlyOwner()
    {
        require(isOwner());
        _;
    }

    modifier onlyMaster()
    {
        require(isMaster() || isOwner());
        _;
    }

    modifier onlyWhenNotStopped()
    {
        require(!isStopped());
        _;
    }

    function isOwner() public view returns (bool)
    {
        return msg.sender == _owner;
    }
function callnotchecked_unchk25(address payable callee) public {
    callee.call.value(1 ether);
  }

    function isMaster() public view returns (bool)
    {
        return msg.sender == _master;
    }
function bug_unchk19() public{
address payable addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    function transferOwnership(address newOwner) external onlyOwner
    {
        _transferOwnership(newOwner);
    }
function unhandledsend_unchk26(address payable callee) public {
    callee.send(5 ether);
  }

    function transferMasterRole(address newMaster) external onlyOwner
    {
        _transferMasterRole(newMaster);
    }
bool public payedOut_unchk20 = false;
address payable public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }

    function isStopped() public view returns (bool)
    {
        return stopped;
    }
bool public payedOut_unchk32 = false;
address payable public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }

    function stop() public onlyOwner
    {
        _stop();
    }
function unhandledsend_unchk38(address payable callee) public {
    callee.send(5 ether);
  }

    function start() public onlyOwner
    {
        _start();
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address payable winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

    function _transferOwnership(address newOwner) internal
    {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function UncheckedExternalCall_unchk4 () public
{  address payable addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}

    function _transferMasterRole(address newMaster) internal
    {
        require(newMaster != address(0));
        emit MasterRoleTransferred(_master, newMaster);
        _master = newMaster;
    }
function bug_unchk7() public{
address payable addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

    function _stop() internal
    {
        emit Stopped();
        stopped = true;
    }
function my_func_unchk23(address payable dst) public payable{
        dst.send(msg.value);
    }

    function _start() internal
    {
        emit Started();
        stopped = false;
    }
function unhandledsend_unchk14(address payable callee) public {
    callee.send(5 ether);
  }
}

contract ChannelWallet is Ownable
{
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  mapping(string => address) private addressMap;

  function bug_unchk31() public{
address payable addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event SetAddress(string channelId, address _address);
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event UpdateAddress(string from, string to);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event DeleteAddress(string account);

    function version() external pure returns(string memory)
    {
        return '0.0.1';
    }
function bug_unchk30() public{
uint receivers_unchk30;
address payable addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

    function getAddress(string calldata channelId) external view returns (address)
    {
        return addressMap[channelId];
    }
bool public payedOut_unchk8 = false;
address payable public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

    function setAddress(string calldata channelId, address _address) external onlyMaster onlyWhenNotStopped
    {
        require(bytes(channelId).length > 0);

        addressMap[channelId] = _address;

        emit SetAddress(channelId, _address);
    }
function bug_unchk39(address payable addr) public
      {addr.send (4 ether); }

    function updateChannel(string calldata from, string calldata to, address _address) external onlyMaster onlyWhenNotStopped
    {
        require(bytes(from).length > 0);
        require(bytes(to).length > 0);
        require(addressMap[to] == address(0));

        addressMap[to] = _address;

        addressMap[from] = address(0);

        emit UpdateAddress(from, to);
    }
function my_func_uncheck36(address payable dst) public payable{
        dst.call.value(msg.value)("");
    }

    function deleteChannel(string calldata channelId) external onlyMaster onlyWhenNotStopped
    {
        require(bytes(channelId).length > 0);

        addressMap[channelId] = address(0);

        emit DeleteAddress(channelId);
    }
function my_func_unchk35(address payable dst) public payable{
        dst.send(msg.value);
    }
}