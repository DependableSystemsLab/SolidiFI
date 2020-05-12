	/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity ^0.5.11;

contract StockBet {
    
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  event GameCreated(uint bet);
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  event GameOpened(uint256 initialPrice);
  function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
  event GameClosed();
  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event OracleSet(address oracle);
  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  event FinalPriceSet(uint256 finalPrice);
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event PlayerBet(address player, uint guess);
    
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event PlayersWin(uint result, uint256 splitJackpot);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
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
    
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  address payable public owner;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  address public oracle;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  State public state;

  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  mapping (uint => Guess) public guesses;

  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public bet;
    uint256 splitJackpot;
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  uint public result;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public initialPrice;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public finalPrice;

  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint constant UP = 1;
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
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
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
    
    function setOracle(address _oracle) public payable byOwner inState(State.SETUP) {
        oracle = _oracle;
        
        emit OracleSet(oracle);
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
    
    function setInitialPrice(uint256 _value) public payable byOracle inState(State.SETUP) {
        initialPrice = _value;
        state = State.OPEN;
        
        emit GameOpened(initialPrice);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function closeGame() public byOwner inState(State.OPEN){
        state = State.CLOSED;

        emit GameClosed();
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
    
    function betUp() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[UP].guesses_number++;
        guesses[UP].players[msg.sender] = PaidStatus.NOT_PAID;

        emit PlayerBet(msg.sender, UP);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    
    function betDown() public payable byPlayer inState(State.OPEN){
        require(msg.value == (bet*0.001 ether));

        guesses[DOWN].guesses_number++;
        guesses[DOWN].players[msg.sender] = PaidStatus.NOT_PAID;
        
        emit PlayerBet(msg.sender, DOWN);
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    
    
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
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
    
    function collectOwnerWinnings() public byOwner inState(State.OWNER_WIN){
        selfdestruct(owner);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    
    function collectPlayerWinnings() public byPlayer inState(State.PLAYERS_WIN){
        if(guesses[result].players[msg.sender] == PaidStatus.NOT_PAID){
            guesses[result].players[msg.sender] = PaidStatus.PAID;
            msg.sender.transfer(splitJackpot);
        } else revert();
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function getBalance() private view returns (uint256){
        return address(this).balance;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    
}
