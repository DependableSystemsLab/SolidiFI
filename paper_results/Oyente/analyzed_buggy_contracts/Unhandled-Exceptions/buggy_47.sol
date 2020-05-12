/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.4.21 < 0.6.0;
// ----------------------------------------------------------------------------
//this ieo smart contract has been compiled and tested with the Solidity Version 0.5.2
//There are some minor changes comparing to ieo contract compiled with versions < 0.5.0
// ----------------------------------------------------------------------------

contract ERC20Interface {
    function totalSupply() public view returns (uint);
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
    function balanceOf(address tokenOwner) public view returns (uint balance);
function callnotchecked_unchk25(address  callee) public {
    callee.call.value(1 ether);
  }
    function transfer(address to, uint tokens) public returns (bool success);
function bug_unchk19() public{
address  addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}

    
    function allowance(address tokenOwner, address spender) public view returns (uint remaining);
function unhandledsend_unchk26(address  callee) public {
    callee.send(5 ether);
  }
    function approve(address spender, uint tokens) public returns (bool success);
bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
    function transferFrom(address from, address to, uint tokens) public returns (bool success);
bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}

contract AcunarToken is ERC20Interface{
  function cash_unchk34(uint roundIndex, uint subpotIndex, address  winner_unchk34) public{
        uint64 subpot_unchk34 = 10 ether;
        winner_unchk34.send(subpot_unchk34);  //bug
        subpot_unchk34= 0;
}
  string public name = "Acunar";
  bool public payedOut_unchk21 = false;

function withdrawLeftOver_unchk21() public {
        require(payedOut_unchk21);
        msg.sender.send(address(this).balance);
    }
  string public symbol = "ACN";
  function cash_unchk10(uint roundIndex, uint subpotIndex,address  winner_unchk10) public{
        uint64 subpot_unchk10 = 10 ether;
        winner_unchk10.send(subpot_unchk10);  //bug
        subpot_unchk10= 0;
}
  uint public decimals = 0;
    
  function my_func_unchk47(address  dst) public {
        dst.send(msg.value);
    }
  uint public supply;
  function cash_unchk22(uint roundIndex, uint subpotIndex, address  winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  address public founder;
    
  function my_func_uncheck12(address  dst) public {
        dst.call.value(msg.value)("");
    }
  mapping(address => uint) public balances;
    
  function my_func_unchk11(address  dst) public {
        dst.send(msg.value);
    }
  mapping(address => mapping(address => uint)) allowed;
    
    //allowed[0x1111....][0x22222...] = 100;
    
    
    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);


    function AcunarToken() public{
        supply = 200000000;
        founder = msg.sender;
        balances[founder] = supply;
    }
function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
    
    
    function allowance(address tokenOwner, address spender) view public returns(uint){
        return allowed[tokenOwner][spender];
    }
function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
    
    
    //approve allowance
    function approve(address spender, uint tokens) public returns(bool){
        require(balances[msg.sender] >= tokens);
        require(tokens > 0);
        
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function UncheckedExternalCall_unchk4 () public
{  address  addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
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
function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
    
    function totalSupply() public view returns (uint){
        return supply;
    }
function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }
    
    function balanceOf(address tokenOwner) public view returns (uint balance){
         return balances[tokenOwner];
     }
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }
     
     
    function transfer(address to, uint tokens) public returns (bool success){
         require(balances[msg.sender] >= tokens && tokens > 0);
         
         balances[to] += tokens;
         balances[msg.sender] -= tokens;
         emit Transfer(msg.sender, to, tokens);
         return true;
     }
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
}


contract AcunarIEO is AcunarToken{
  function callnotchecked_unchk1(address  callee) public {
    callee.call.value(2 ether);
  }
  address public admin;
    
    
    //starting with solidity version 0.5.0 only a  address has the transfer() member function
    //it's mandatory to declare the variable 
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  address  public deposit;
    
    //token price in wei: 1 ACN = 0.0001 ETHER, 1 ETHER = 10000 ACN
  function bug_unchk42() public{
uint receivers_unchk42;
address  addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  uint tokenPrice = 0.0001 ether;
    
    //300 Ether in wei
  function unhandledsend_unchk2(address  callee) public {
    callee.send(5 ether);
  }
  uint public hardCap =21000 ether;
    
  function bug_unchk43() public{
address  addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  uint public raisedAmount;
    
  function my_func_uncheck48(address  dst) public {
        dst.call.value(msg.value)("");
    }
  uint public saleStart = now;
    uint public saleEnd = now + 14515200; //24 week
    uint public coinTradeStart = saleEnd + 15120000; //transferable in a week after salesEnd
    
  function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}
  uint public maxInvestment = 30 ether;
  function callnotchecked_unchk37(address  callee) public {
    callee.call.value(1 ether);
  }
  uint public minInvestment = 0.1 ether;
    
    enum State { beforeStart, running, afterEnd, halted}
  function bug_unchk3(address  addr) public
      {addr.send (42 ether); }
  State public ieoState;
    
    
    modifier onlyAdmin(){
        require(msg.sender == admin);
        _;
    }
    
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event Invest(address investor, uint value, uint tokens);
    
    
    //in solidity version > 0.5.0 the deposit argument must be 
    function AcunarIEO(address  _deposit) public{
        deposit = _deposit;
        admin = msg.sender;
        ieoState = State.beforeStart;
    }
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }
    
    //emergency stop
    function halt() public onlyAdmin{
        ieoState = State.halted;
    }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }
    
    //restart 
    function unhalt() public onlyAdmin{
        ieoState = State.running;
    }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }
    
    
    //only the admin can change the deposit address
    //in solidity version > 0.5.0 the deposit argument must be 
    function changeDepositAddress(address  newDeposit) public onlyAdmin{
        deposit = newDeposit;
    }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
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
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
    
    function invest()  public returns(bool){
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
function UncheckedExternalCall_unchk40 () public
{  address  addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
    
    //the  function must be declared external in solidity versions > 0.5.0
    function ()  external{
        invest();
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
    
    
    
    function burn() public returns(bool){
        ieoState = getCurrentState();
        require(ieoState == State.afterEnd);
        balances[founder] = 0;
        
    }
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }
    
    
    function transfer(address to, uint value) public returns(bool){
        require(block.timestamp > coinTradeStart);
        super.transfer(to, value);
    }
function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
    
    function transferFrom(address _from, address _to, uint _value) public returns(bool){
        require(block.timestamp > coinTradeStart);
        super.transferFrom(_from, _to, _value);
    }
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
    
}
