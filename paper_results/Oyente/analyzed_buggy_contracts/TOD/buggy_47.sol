/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.4.21 <0.6.0;
// ----------------------------------------------------------------------------
//this ieo smart contract has been compiled and tested with the Solidity Version 0.5.2
//There are some minor changes comparing to ieo contract compiled with versions < 0.5.0
// ----------------------------------------------------------------------------

contract ERC20Interface {
    function totalSupply() public view returns (uint);
address winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
    function balanceOf(address tokenOwner) public view returns (uint balance);
address winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
    function transfer(address to, uint tokens) public returns (bool success);
address winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }

    
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
address winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
    function approve(address spender, uint tokens) public returns (bool success);
address winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
address winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract AcunarToken is ERC20Interface{
  bool claimed_TOD18 = false;
address owner_TOD18;
uint256 reward_TOD18;
function setReward_TOD18() public payable {
        require (!claimed_TOD18);

        require(msg.sender == owner_TOD18);
        owner_TOD18.transfer(reward_TOD18);
        reward_TOD18 = msg.value;
    }

    function claimReward_TOD18(uint256 submission) public {
        require (!claimed_TOD18);
        require(submission < 10);

        msg.sender.transfer(reward_TOD18);
        claimed_TOD18 = true;
    }
  string public name = "Acunar";
  address winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
  string public symbol = "ACN";
  bool claimed_TOD6 = false;
address owner_TOD6;
uint256 reward_TOD6;
function setReward_TOD6() public payable {
        require (!claimed_TOD6);

        require(msg.sender == owner_TOD6);
        owner_TOD6.transfer(reward_TOD6);
        reward_TOD6 = msg.value;
    }

    function claimReward_TOD6(uint256 submission) public {
        require (!claimed_TOD6);
        require(submission < 10);

        msg.sender.transfer(reward_TOD6);
        claimed_TOD6 = true;
    }
  uint public decimals = 0;
    
  bool claimed_TOD16 = false;
address owner_TOD16;
uint256 reward_TOD16;
function setReward_TOD16() public payable {
        require (!claimed_TOD16);

        require(msg.sender == owner_TOD16);
        owner_TOD16.transfer(reward_TOD16);
        reward_TOD16 = msg.value;
    }

    function claimReward_TOD16(uint256 submission) public {
        require (!claimed_TOD16);
        require(submission < 10);

        msg.sender.transfer(reward_TOD16);
        claimed_TOD16 = true;
    }
  uint public supply;
  bool claimed_TOD24 = false;
address owner_TOD24;
uint256 reward_TOD24;
function setReward_TOD24() public payable {
        require (!claimed_TOD24);

        require(msg.sender == owner_TOD24);
        owner_TOD24.transfer(reward_TOD24);
        reward_TOD24 = msg.value;
    }

    function claimReward_TOD24(uint256 submission) public {
        require (!claimed_TOD24);
        require(submission < 10);

        msg.sender.transfer(reward_TOD24);
        claimed_TOD24 = true;
    }
  address public founder;
    
  address winner_TOD5;
function play_TOD5(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD5 = msg.sender;
        }
    }

function getReward_TOD5() payable public{
     
       winner_TOD5.transfer(msg.value);
    }
  mapping(address => uint) public balances;
    
  address winner_TOD15;
function play_TOD15(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD15 = msg.sender;
        }
    }

function getReward_TOD15() payable public{
     
       winner_TOD15.transfer(msg.value);
    }
  mapping(address => mapping(address => uint)) allowed;
    
    //allowed[0x1111....][0x22222...] = 100;
    
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);


    function ERC20Interface() public{
        supply = 200000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
bool claimed_TOD26 = false;
address owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
    
    
    function allowance(address tokenOwner, address spender) view public returns(uint){
        return allowed[tokenOwner][spender];
    }
bool claimed_TOD20 = false;
address owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }
    
    
    //approve allowance
    function approve(address spender, uint tokens) public returns(bool){
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);
        
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
bool claimed_TOD32 = false;
address owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
    
    //transfer tokens from the  owner account to the account that calls the function
    function transferFrom(address from, address to, uint tokens) public returns(bool){
        require(allowed[from][to] >= tokens);
        require(balances[from] >= tokens);
        
        balances[from] -= tokens;
        balances[to] += tokens;
        
        
        allowed[from][to] -= tokens;
        
        return true;
    }
bool claimed_TOD38 = false;
address owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
    
    function totalSupply() public view returns (uint){
        return supply;
    }
bool claimed_TOD4 = false;
address owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }
    
    function balanceOf(address tokenOwner) public view returns (uint balance){
         return balances[tokenOwner];
     }
address winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }
     
     
    function transfer(address to, uint tokens) public returns (bool success){
         require(balances[msg.sender] >= tokens && tokens > 0);
         
         balances[to] += tokens;
         balances[msg.sender] -= tokens;
         emit Transfer(msg.sender, to, tokens);
         return true;
     }
address winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }
}


contract AcunarIEO is AcunarToken{
  bool claimed_TOD28 = false;
address owner_TOD28;
uint256 reward_TOD28;
function setReward_TOD28() public payable {
        require (!claimed_TOD28);

        require(msg.sender == owner_TOD28);
        owner_TOD28.transfer(reward_TOD28);
        reward_TOD28 = msg.value;
    }

    function claimReward_TOD28(uint256 submission) public {
        require (!claimed_TOD28);
        require(submission < 10);

        msg.sender.transfer(reward_TOD28);
        claimed_TOD28 = true;
    }
  address public admin;
    
    
    //starting with solidity version 0.5.0 only a payable address has the transfer() member function
    //it's mandatory to declare the variable payable
  bool claimed_TOD34 = false;
address owner_TOD34;
uint256 reward_TOD34;
function setReward_TOD34() public payable {
        require (!claimed_TOD34);

        require(msg.sender == owner_TOD34);
        owner_TOD34.transfer(reward_TOD34);
        reward_TOD34 = msg.value;
    }

    function claimReward_TOD34(uint256 submission) public {
        require (!claimed_TOD34);
        require(submission < 10);

        msg.sender.transfer(reward_TOD34);
        claimed_TOD34 = true;
    }
  address public deposit;
    
    //token price in wei: 1 ACN = 0.0001 ETHER, 1 ETHER = 10000 ACN
  address winner_TOD21;
function play_TOD21(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD21 = msg.sender;
        }
    }

function getReward_TOD21() payable public{
     
       winner_TOD21.transfer(msg.value);
    }
  uint tokenPrice = 0.0001 ether;
    
    //300 Ether in wei
  bool claimed_TOD10 = false;
address owner_TOD10;
uint256 reward_TOD10;
function setReward_TOD10() public payable {
        require (!claimed_TOD10);

        require(msg.sender == owner_TOD10);
        owner_TOD10.transfer(reward_TOD10);
        reward_TOD10 = msg.value;
    }

    function claimReward_TOD10(uint256 submission) public {
        require (!claimed_TOD10);
        require(submission < 10);

        msg.sender.transfer(reward_TOD10);
        claimed_TOD10 = true;
    }
  uint public hardCap =21000 ether;
    
  bool claimed_TOD22 = false;
address owner_TOD22;
uint256 reward_TOD22;
function setReward_TOD22() public payable {
        require (!claimed_TOD22);

        require(msg.sender == owner_TOD22);
        owner_TOD22.transfer(reward_TOD22);
        reward_TOD22 = msg.value;
    }

    function claimReward_TOD22(uint256 submission) public {
        require (!claimed_TOD22);
        require(submission < 10);

        msg.sender.transfer(reward_TOD22);
        claimed_TOD22 = true;
    }
  uint public raisedAmount;
    
  bool claimed_TOD12 = false;
address owner_TOD12;
uint256 reward_TOD12;
function setReward_TOD12() public payable {
        require (!claimed_TOD12);

        require(msg.sender == owner_TOD12);
        owner_TOD12.transfer(reward_TOD12);
        reward_TOD12 = msg.value;
    }

    function claimReward_TOD12(uint256 submission) public {
        require (!claimed_TOD12);
        require(submission < 10);

        msg.sender.transfer(reward_TOD12);
        claimed_TOD12 = true;
    }
  uint public saleStart = now;
    uint public saleEnd = now + 14515200; //24 week
    uint public coinTradeStart = saleEnd + 15120000; //transferable in a week after salesEnd
    
  address winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  uint public maxInvestment = 30 ether;
  address winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  uint public minInvestment = 0.1 ether;
    
    enum State { beforeStart, running, afterEnd, halted}
  bool claimed_TOD2 = false;
address owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
  State public ieoState;
    
    
    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }
    
  address winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  event Invest(address investor, uint value, uint tokens);
    
    
    //in solidity version > 0.5.0 the deposit argument must be payable
    function AcunarIEO(address _deposit) public{
        deposit = _deposit;
        admin = msg.sender;
        ieoState = State.beforeStart;
    }
bool claimed_TOD14 = false;
address owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
    
    //emergency stop
    function halt() public onlyAdmin{
        ieoState = State.halted;
    }
bool claimed_TOD30 = false;
address owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
    
    //restart 
    function unhalt() public onlyAdmin{
        ieoState = State.running;
    }
bool claimed_TOD8 = false;
address owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }
    
    
    //only the admin can change the deposit address
    //in solidity version > 0.5.0 the deposit argument must be payable
    function changeDepositAddress(address newDeposit) public onlyAdmin{
        deposit = newDeposit;
    }
address winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }
    
    
    //returns ieo state
    function getCurrentState() public view returns(State){
        if(ieoState == State.halted){
            return State.halted;
        }else if(block.timestamp < saleStart){
            return State.beforeStart;
        }else if(block.timestamp >= saleStart && block.timestamp <= saleEnd){
            return State.running;
        }else{
            return State.afterEnd;
        }
    }
bool claimed_TOD36 = false;
address owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }
    
    
    function invest() payable public returns(bool){
        //invest only in running
        ieoState = getCurrentState();
        require(ieoState == State.running);
        
        require(msg.value >= minInvestment && msg.value <= maxInvestment);
        
        uint tokens = msg.value / tokenPrice;
        
        //hardCap not reached
        require(raisedAmount + msg.value <= hardCap);
        
        raisedAmount += msg.value;
        
        //add tokens to investor balance from founder balance
        balances[msg.sender] += tokens;
        balances[founder] -= tokens;
        
        deposit.transfer(msg.value);//transfer eth to the deposit address
        
        //emit event
        emit Invest(msg.sender, msg.value, tokens);
        
        return true;
        

    }
address winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }
    
    //the payable function must be declared external in solidity versions > 0.5.0
    function () payable external{
        invest();
    }
bool claimed_TOD40 = false;
address owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }
    
    
    
    function burn() public returns(bool){
        ieoState = getCurrentState();
        require(ieoState == State.afterEnd);
        balances[founder] = 0;
        
    }
address winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }
    
    
    function transfer(address to, uint value) public returns(bool){
        require(block.timestamp > coinTradeStart);
        super.transfer(to, value);
    }
address winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }
    
    function transferFrom(address _from, address _to, uint _value) public returns(bool){
        require(block.timestamp > coinTradeStart);
        super.transferFrom(_from, _to, _value);
    }
address winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }
    
}
