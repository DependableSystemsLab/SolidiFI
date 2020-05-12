/**
 *Submitted for verification at Etherscan.io on 2019-09-23
*/

pragma solidity >=0.4.21 <0.6.0;

contract digitalNotary
{
    
  function bug_tmstmp9() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  address private manager;
    
  function bug_tmstmp25() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  bool private contractactive;
    
  address winner_tmstmp19;
function play_tmstmp19(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp19 = msg.sender;}}
  uint private hashfee;
    
  address winner_tmstmp26;
function play_tmstmp26(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp26 = msg.sender;}}
  uint private changehashownerfee;
    
    struct HashRegistration 
    {
        address owner;
        uint registrationtime;
    }
    
  function bug_tmstmp20 () public payable {
	uint pastBlockTime_tmstmp20; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp20); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp20 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  mapping(bytes32 => HashRegistration[]) HashList;
    
  function bug_tmstmp32 () public payable {
	uint pastBlockTime_tmstmp32; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp32); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp32 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
  uint private HashListLength;
    
  uint256 bugv_tmstmp3 = block.timestamp;
  event  RegisterHashEvent(address indexed msgsender, bytes32 indexed hash, uint timestamp);
    
  uint256 bugv_tmstmp4 = block.timestamp;
  event  ChangeHashOwnershipEvent(address indexed msgsender, address indexed newowner, bytes32 indexed hash, uint timestamp);
    
    function digitalNotary() public
    {

        manager = msg.sender;
        
        contractactive = true;
        
        hashfee = 5000000000000000;
        
        changehashownerfee = 25000000000000000;
        
        HashListLength = 0;
        
    }
address winner_tmstmp38;
function play_tmstmp38(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp38 = msg.sender;}}
    
    modifier onlyManager()
    {
        require(msg.sender == manager);
        _;
    }
uint256 bugv_tmstmp2 = block.timestamp;
    
    
    function gethashfee() external view returns(uint)
    {
        return hashfee;
    }
function bug_tmstmp4 () public payable {
	uint pastBlockTime_tmstmp4; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp4); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp4 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function sethashfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        hashfee = newfee;
    }
address winner_tmstmp7;
function play_tmstmp7(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp7 = msg.sender;}}
    
    function getchangehashownerfee() external view returns(uint)
    {
        return changehashownerfee;
    }
address winner_tmstmp23;
function play_tmstmp23(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp23 = msg.sender;}}
    
     function setchangehashownerfee(uint newfee) external onlyManager
    {
        require(newfee >= 0);
        
        changehashownerfee = newfee;
    }
address winner_tmstmp14;
function play_tmstmp14(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp14 = msg.sender;}}
    
    function getcontractactive() external view returns (bool)
    {
        return contractactive;
    }
address winner_tmstmp30;
function play_tmstmp30(uint startTime) public {
	if (startTime + (5 * 1 days) == block.timestamp){
		winner_tmstmp30 = msg.sender;}}
    
    function setcontractactive(bool contactive) external onlyManager
    {
        contractactive = contactive;
    }
function bug_tmstmp8 () public payable {
	uint pastBlockTime_tmstmp8; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp8); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp8 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
     function getmanager() external view returns(address)
    {
        return manager;
    }
address winner_tmstmp39;
function play_tmstmp39(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp39 = msg.sender;}}
    
    function setmanager(address newmngr) external onlyManager
    {
        require(newmngr.balance > 0);
        manager = newmngr;
    }
function bug_tmstmp36 () public payable {
	uint pastBlockTime_tmstmp36; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp36); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp36 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function getcontractbalance() public view returns(uint)
    {
       
        return address(this).balance;
    }
address winner_tmstmp35;
function play_tmstmp35(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp35 = msg.sender;}}
    
    function transfercontractbalance() external onlyManager
    {
        uint cb = address(this).balance;
        
        require(cb > 0);
        
        manager.transfer(cb);
    }
function bug_tmstmp40 () public payable {
	uint pastBlockTime_tmstmp40; // Forces one bet per block
	require(msg.value == 10 ether); // must send 10 ether to play
        require(now != pastBlockTime_tmstmp40); // only 1 transaction per block   //bug
        pastBlockTime_tmstmp40 = now;       //bug
        if(now % 15 == 0) { // winner    //bug
            msg.sender.transfer(address(this).balance);
        }
    }
    
    function getHashOwnersCount(bytes32 hash) public view returns(uint)
    {
        return HashList[hash].length;
    }
function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function getNumberofHashesRegistered() external view returns(uint)
    {
        return HashListLength;
    }
address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
    
     function getHashDetails(bytes32 hash,uint indx) external view returns (address,uint)
    {

        uint owncount = getHashOwnersCount(hash);
        require(owncount > 0);
        require(indx < owncount);
        
        return (HashList[hash][indx].owner,HashList[hash][indx].registrationtime);
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}
    
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
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
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
uint256 bugv_tmstmp5 = block.timestamp;
    
    function () external
    {
     	
    }
uint256 bugv_tmstmp1 = block.timestamp;
}
