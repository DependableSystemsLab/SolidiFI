/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.4.21 <0.6.0;

contract CareerOnToken {
  function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event Approval(address indexed a_owner, address indexed _spender, uint256 _value);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event OwnerChang(address indexed _old,address indexed _new,uint256 _coin_change);
    
  bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  uint256 public totalSupply;  
  bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  string public name;                   //名称，例如"My test token"
  function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
  uint8 public decimals;               //返回token使用的小数点后几位。比如如果设置为3，就是支持0.001表示.
  function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
  string public symbol;               //token简称,like MTT
  function UncheckedExternalCall_unchk4 () public
{  address  addr_unchk4;
   if (! addr_unchk4.send (42 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  address public owner;
  function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}
  mapping (address => uint256) public balances;
  function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }
  mapping (address => mapping (address => uint256)) public allowed;
    
	//如果通过函数setPauseStatus设置这个变量为TRUE，则所有转账交易都会失败
  function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }
  bool isTransPaused=false;
    
    function CareerOnToken(
        uint256 _initialAmount,
        uint8 _decimalUnits) public 
    {
        owner=msg.sender;//记录合约的owner
		if(_initialAmount<=0){
		    totalSupply = 100000000000000000;   // 设置初始总量
		    balances[owner]=totalSupply;
		}else{
		    totalSupply = _initialAmount;   // 设置初始总量
		    balances[owner]=_initialAmount;
		}
		if(_decimalUnits<=0){
		    decimals=2;
		}else{
		    decimals = _decimalUnits;
		}
        name = "CareerOn Chain Token"; 
        symbol = "COT";
    }
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}
    
    
    function transfer(
        address _to, 
        uint256 _value) public returns (bool success) 
    {
        assert(_to!=address(this) && 
                !isTransPaused &&
                balances[msg.sender] >= _value &&
                balances[_to] + _value > balances[_to]
        );
        
        balances[msg.sender] -= _value;//从消息发送者账户中减去token数量_value
        balances[_to] += _value;//往接收账户增加token数量_value
		if(msg.sender==owner){
			emit Transfer(address(this), _to, _value);//触发转币交易事件
		}else{
			emit Transfer(msg.sender, _to, _value);//触发转币交易事件
		}
        return true;
    }
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }


    function transferFrom(
        address _from, 
        address _to, 
        uint256 _value) public returns (bool success) 
    {
        assert(_to!=address(this) && 
                !isTransPaused &&
                balances[msg.sender] >= _value &&
                balances[_to] + _value > balances[_to] &&
                allowed[_from][msg.sender] >= _value
        );
        
        balances[_to] += _value;//接收账户增加token数量_value
        balances[_from] -= _value; //支出账户_from减去token数量_value
        allowed[_from][msg.sender] -= _value;//消息发送者可以从账户_from中转出的数量减少_value
        if(_from==owner){
			emit Transfer(address(this), _to, _value);//触发转币交易事件
		}else{
			emit Transfer(_from, _to, _value);//触发转币交易事件
		}
        return true;
    }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }

    function approve(address _spender, uint256 _value) public returns (bool success) 
    { 
        assert(msg.sender!=_spender && _value>0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }

    function allowance(
        address _owner, 
        address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];//允许_spender从_owner中转出的token数
    }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }
	
	//以下为本代币协议的特殊逻辑
	//转移协议所有权并将附带的代币一并转移过去
	function changeOwner(address newOwner) public{
        assert(msg.sender==owner && msg.sender!=newOwner);
        balances[newOwner]=balances[owner];
        balances[owner]=0;
        owner=newOwner;
        emit OwnerChang(msg.sender,newOwner,balances[owner]);//触发合约所有权的转移事件
    }
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
    
	//isPaused为true则暂停所有转账交易
    function setPauseStatus(bool isPaused)public{
        assert(msg.sender==owner);
        isTransPaused=isPaused;
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
    
	//修改合约名字
    function changeContractName(string memory _newName,string memory _newSymbol) public {
        assert(msg.sender==owner);
        name=_newName;
        symbol=_newSymbol;
    }
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
    
    
    function () external  {
        revert();
    }
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }
}
