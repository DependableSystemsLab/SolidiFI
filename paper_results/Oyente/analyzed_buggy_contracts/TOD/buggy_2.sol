/**
 * Source Code first verified at https://etherscan.io on Tuesday, May 7, 2019
 (UTC) */

pragma solidity >=0.4.21 <0.6.0;

contract CareerOnToken {
  address  winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27()  public{
     
       winner_TOD27.transfer(msg.value);
    }
  event Transfer(address indexed _from, address indexed _to, uint256 _value);
  address  winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31()  public{
     
       winner_TOD31.transfer(msg.value);
    }
  event Approval(address indexed a_owner, address indexed _spender, uint256 _value);
  address  winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13()  public{
     
       winner_TOD13.transfer(msg.value);
    }
  event OwnerChang(address indexed _old,address indexed _new,uint256 _coin_change);
    
  address  winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25()  public{
     
       winner_TOD25.transfer(msg.value);
    }
  uint256 public totalSupply;  
  address  winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19()  public{
     
       winner_TOD19.transfer(msg.value);
    }
  string public name;                   //名称，例如"My test token"
  bool claimed_TOD26 = false;
address  owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public  {
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
  uint8 public decimals;               //返回token使用的小数点后几位。比如如果设置为3，就是支持0.001表示.
  bool claimed_TOD20 = false;
address  owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public  {
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
  string public symbol;               //token简称,like MTT
  bool claimed_TOD32 = false;
address  owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public  {
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
  address public owner;
  bool claimed_TOD38 = false;
address  owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public  {
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
  mapping (address => uint256) public balances;
  bool claimed_TOD4 = false;
address  owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public  {
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
  mapping (address => mapping (address => uint256)) public allowed;
    
	//如果通过函数setPauseStatus设置这个变量为TRUE，则所有转账交易都会失败
  address  winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7()  public{
     
       winner_TOD7.transfer(msg.value);
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
address  winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23()  public{
     
       winner_TOD23.transfer(msg.value);
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
bool claimed_TOD14 = false;
address  owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public  {
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
bool claimed_TOD30 = false;
address  owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public  {
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

    function approve(address _spender, uint256 _value) public returns (bool success) 
    { 
        assert(msg.sender!=_spender && _value>0);
        allowed[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
bool claimed_TOD8 = false;
address  owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public  {
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

    function allowance(
        address _owner, 
        address _spender) public view returns (uint256 remaining) 
    {
        return allowed[_owner][_spender];//允许_spender从_owner中转出的token数
    }
address  winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29()  public{
     
       winner_TOD29.transfer(msg.value);
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
bool claimed_TOD36 = false;
address  owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public  {
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
    
	//isPaused为true则暂停所有转账交易
    function setPauseStatus(bool isPaused)public{
        assert(msg.sender==owner);
        isTransPaused=isPaused;
    }
address  winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35()  public{
     
       winner_TOD35.transfer(msg.value);
    }
    
	//修改合约名字
    function changeContractName(string memory _newName,string memory _newSymbol) public {
        assert(msg.sender==owner);
        name=_newName;
        symbol=_newSymbol;
    }
bool claimed_TOD40 = false;
address  owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public  {
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
    
    
    function () external  {
        revert();
    }
address  winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256(guess) == keccak256('hello')) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33()  public{
     
       winner_TOD33.transfer(msg.value);
    }
}
