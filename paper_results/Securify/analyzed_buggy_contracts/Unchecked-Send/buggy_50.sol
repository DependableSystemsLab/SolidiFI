/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity ^0.5.11;

contract digitalNotary
{
    
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  address payable private manager;
    
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  bool private contractactive;
    
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint private hashfee;
    
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint private changehashownerfee;
    
    struct HashRegistration 
    {
        address owner;
        uint registrationtime;
    }
    
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32 => HashRegistration[]) HashList;
    
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint private HashListLength;
    
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    constructor() public
    {

        manager = msg.sender;
        
        contractactive = true;
        
        hashfee = 5000000000000000;
        
        changehashownerfee = 25000000000000000;
        
        HashListLength = 0;
        
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
    
    modifier onlyManager()
    {
        require(msg.sender == manager);
        _;
    }
    
    
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    
    function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
    
    function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
    
     function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    
    function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    
    function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
     function getmanager() external view returns(address)
    {
        return manager;
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function setmanager(address payable newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    
    function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    
     function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    
    function registerHash(bytes32 hash) external payable
    {
      
        require(contractactive == true);
        require(getHashOwnersCount(hash) == 0);
        require(msg.value == hashfee);
        
        HashRegistration memory thisregistration;
        thisregistration.owner = msg.sender;
        thisregistration.registrationtime = now;
        
        HashList[hash].push(thisregistration);
        
        HashListLength++;
        
        emit RegisterHashEvent(thisregistration.owner, hash, thisregistration.registrationtime);
        
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeHashOwnership(bytes32 hash, address newowner) external payable
    {
        
        require(contractactive == true);
        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(msg.sender == HashList[hash][owncount - 1].owner); 
        require(msg.value == changehashownerfee);
        
        HashRegistration memory thisregistration;
        thisregistration.owner = newowner;
        thisregistration.registrationtime = now;
        
        HashList[hash].push(thisregistration);
        
        emit ChangeHashOwnershipEvent(msg.sender, thisregistration.owner, hash, thisregistration.registrationtime);
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    
    function () external
    {
     	
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
}
