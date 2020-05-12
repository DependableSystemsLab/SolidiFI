	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity ^0.5.11;

contract StockBet {
    
  function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}
  event GameCreated(uint bet);
  function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  event GameOpened(uint256 initialPrice);
  function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  event GameClosed();
  function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  event OracleSet(address oracle);
  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  event FinalPriceSet(uint256 finalPrice);
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  event PlayerBet(address player, uint guess);
    
  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  event PlayersWin(uint result, uint256 splitJackpot);
  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event OwnerWins(address owner);
    
    enum State {
        SETUP, PRICE_SET, OPEN, CLOSED, PLAYERS_WIN, OWNER_WIN
    }

    enum PaidStatus {
        UNDEFINED,
        NOT_PAID,
        PAID
    }
    
    struct Guess {
        mapping (address => PaidStatus) players;
        uint guesses_number;
    }
    
  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  address payable public owner;
  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  address public oracle;
  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
  State public state;

  function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
  mapping (uint => Guess) public guesses;

  function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}
  uint256 public bet;
    uint256 splitJackpot;
  function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}
  uint public result;
  function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}
  uint256 public initialPrice;
  function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  uint256 public finalPrice;

  function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
  uint constant UP = 1;
  function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  uint constant DOWN = 0;
    
    
    // ----------MODIFIERS--------------------
    modifier byPlayer(){
        require(msg.sender != oracle);
        _;
    }
    
    modifier byOwner(){
        require(msg.sender == owner);
        _;
    }
    
    modifier byOracle(){
        require(msg.sender == oracle);
        _;
    }
    
    modifier inState(State expected) {
        require(state == expected);
        _;
    }
    // -------------------------------------

    
    constructor(uint256 _bet) public {
        require(_bet > 0);
        
        owner = msg.sender;
        state = State.SETUP;
        bet = _bet;
        
        emit GameCreated(bet);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }
    
    function setOracle(address _oracle) public payable byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }
    
    function setInitialPrice(uint256 _value) public payable byOracle inState(State.SETUP) {
        initialPrice = _value;
        state = State.OPEN;
        
        emit GameOpened(initialPrice);
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

    function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
    }
    
    function betUp() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[UP].guesses_number++;
        guesses[UP].players[msg.sender] = PaidStatus.NOT_PAID;

        emit PlayerBet(msg.sender, UP);
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
    
    function betDown() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[DOWN].guesses_number++;
        guesses[DOWN].players[msg.sender] = PaidStatus.NOT_PAID;
        
        emit PlayerBet(msg.sender, DOWN);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}
    
    
    function setFinalPrice(uint256 _value) public payable byOracle inState(State.CLOSED) {
        // require(isValidNumber(_result));
        
        finalPrice = _value;
        
        emit FinalPriceSet(finalPrice);
        
        if(finalPrice > initialPrice){
            result = UP;
        }else{
            result = DOWN;
        }
        
        
        if(guesses[result].guesses_number > 0){
            state = State.PLAYERS_WIN;
            splitJackpot = getBalance()/guesses[result].guesses_number;
            emit PlayersWin(result, splitJackpot);
        }else{
            state = State.OWNER_WIN;
            emit OwnerWins(owner);
        }
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}
    
    function collectOwnerWinnings() public byOwner inState(State.OWNER_WIN){
        selfdestruct(owner);
    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }
    
    function collectPlayerWinnings() public byPlayer inState(State.PLAYERS_WIN){
        if(guesses[result].players[msg.sender] == PaidStatus.NOT_PAID){
            guesses[result].players[msg.sender] = PaidStatus.PAID;
            msg.sender.transfer(splitJackpot);
        } else revert();
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    function getBalance() private view returns (uint256){
        return address(this).balance;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }
    
}
