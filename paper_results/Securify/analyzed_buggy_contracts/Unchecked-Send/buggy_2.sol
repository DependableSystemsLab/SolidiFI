/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity ^0.5.1;

contract CareerOnToken {
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Approval(address indexed a_owner, address indexed _spender, uint256 _value);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event OwnerChang(address indexed _old,address indexed _new,uint256 _coin_change);
    
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public totalSupply;  
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  string public name;                   //名称，例如"My test token"
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  uint8 public decimals;               //返回token使用的小数点后几位。比如如果设置为3，就是支持0.001表示.
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  string public symbol;               //token简称,like MTT
  function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => uint256) public balances;
  function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
  mapping (address => mapping (address => uint256)) public allowed;
    
	//如果通过函数setPauseStatus设置这个变量为TRUE，则所有转账交易都会失败
  function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
  bool isTransPaused=false;
    
    constructor(
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
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    
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
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}


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
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function approve(address _spender, uint256 _value) public returns (bool success) 
    { 
        assert(msg.sender!=_spender && _value>0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function allowance(
        address _owner, 
        address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];//允许_spender从_owner中转出的token数
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
	
	//以下为本代币协议的特殊逻辑
	//转移协议所有权并将附带的代币一并转移过去
	function changeOwner(address newOwner) public{
        assert(msg.sender==owner && msg.sender!=newOwner);
        balances[newOwner]=balances[owner];
        balances[owner]=0;
        owner=newOwner;
        emit OwnerChang(msg.sender,newOwner,balances[owner]);//触发合约所有权的转移事件
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    
	//isPaused为true则暂停所有转账交易
    function setPauseStatus(bool isPaused)public{
        assert(msg.sender==owner);
        isTransPaused=isPaused;
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    
	//修改合约名字
    function changeContractName(string memory _newName,string memory _newSymbol) public {
        assert(msg.sender==owner);
        name=_newName;
        symbol=_newSymbol;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    
    function () external payable {
        revert();
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
}
