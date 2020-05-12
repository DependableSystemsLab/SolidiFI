/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity ^0.5.8;

contract Ownable
{
  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  bool private stopped;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  address private _owner;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  address private _master;

  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  event Stopped();
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event Started();
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  event MasterRoleTransferred(address indexed previousMaster, address indexed newMaster);

    constructor () internal
    {
        stopped = false;
        _owner = msg.sender;
        _master = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
        emit MasterRoleTransferred(address(0), _master);
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function owner() public view returns (address)
    {
        return _owner;
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function master() public view returns (address)
    {
        return _master;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

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
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function isMaster() public view returns (bool)
    {
        return msg.sender == _master;
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    function transferOwnership(address newOwner) external onlyOwner
    {
        _transferOwnership(newOwner);
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function transferMasterRole(address newMaster) external onlyOwner
    {
        _transferMasterRole(newMaster);
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function isStopped() public view returns (bool)
    {
        return stopped;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function stop() public onlyOwner
    {
        _stop();
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function start() public onlyOwner
    {
        _start();
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

    function _transferOwnership(address newOwner) internal
    {
        require(newOwner != address(0));
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function _transferMasterRole(address newMaster) internal
    {
        require(newMaster != address(0));
        emit MasterRoleTransferred(_master, newMaster);
        _master = newMaster;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    function _stop() internal
    {
        emit Stopped();
        stopped = true;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function _start() internal
    {
        emit Started();
        stopped = false;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
}

contract ChannelWallet is Ownable
{
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  mapping(string => address) private addressMap;

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event SetAddress(string channelId, address _address);
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event UpdateAddress(string from, string to);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event DeleteAddress(string account);

    function version() external pure returns(string memory)
    {
        return '0.0.1';
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function getAddress(string calldata channelId) external view returns (address)
    {
        return addressMap[channelId];
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    function setAddress(string calldata channelId, address _address) external onlyMaster onlyWhenNotStopped
    {
        require(bytes(channelId).length > 0);

        addressMap[channelId] = _address;

        emit SetAddress(channelId, _address);
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function updateChannel(string calldata from, string calldata to, address _address) external onlyMaster onlyWhenNotStopped
    {
        require(bytes(from).length > 0);
        require(bytes(to).length > 0);
        require(addressMap[to] == address(0));

        addressMap[to] = _address;

        addressMap[from] = address(0);

        emit UpdateAddress(from, to);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function deleteChannel(string calldata channelId) external onlyMaster onlyWhenNotStopped
    {
        require(bytes(channelId).length > 0);

        addressMap[channelId] = address(0);

        emit DeleteAddress(channelId);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
}