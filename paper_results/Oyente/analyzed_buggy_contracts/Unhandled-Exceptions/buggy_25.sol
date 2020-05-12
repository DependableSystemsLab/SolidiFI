/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.4.21 < 0.6.0;

// 
// * whitebetting.com - the whitest football betting game based on ethereum blockchain
// on 2019-09-24
//

contract WhiteBetting {
function unhandledsend_unchk26(address  callee) public {
    callee.send(5 ether);
  }
  address  public owner;

  // Game information
  struct GameInfo {
    // game start time
    uint256 timestamp;
    // game odds
    uint32 odd_homeTeam;
    uint32 odd_drawTeam; 
    uint32 odd_awayTeam;
    uint32 odd_over;
    uint32 odd_under;
    uint32 odd_homeTeamAndDraw;
    uint32 odd_homeAndAwayTeam;
    uint32 odd_awayTeamAndDraw;
    // Checking the game status
    uint8  open_status;
    // Checking whether winning were paid
    bool   isDone;
  }
bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
  mapping(uint64 => GameInfo) public gameList;

  // Player betting infomation
  struct BetFixture {
    address  player;
    uint256 stake;
    uint32  odd;
    // betting type
    uint16  selectedTeam;
  }
bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
  mapping(uint64 => BetFixture[]) public betList;

  // Events that are issued to make statistic recovery easier
bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event Success(uint256 odd);
function UncheckedExternalCall_unchk40 () public
{  address  addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  event Deposit(address sender, uint256 eth);
bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  event Withdraw(address receiver, uint256 eth);
function bug_unchk27(address  addr) public
      {addr.send (42 ether); }
  event NewStake(address player, uint64 fixtureId, uint16 selectedTeam, uint256 stake, uint256 odd );
function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event SetGame(uint64 _fixtureId, uint256 _timestamp, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw, uint8 _open_status);
bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event ChangeOdd (uint64 _fixtureId, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw);
function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event GivePrizeMoney(uint64 _fixtureId, uint8 _homeDrawAway, uint8 _overUnder);
  
  // Constructor
  function WhiteBetting() public {
    owner   = msg.sender;
  }
function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }

  // Change the game status
  function setOpenStatus(uint64 _fixtureId, uint8 _open_status) external onlyOwner {
    gameList[_fixtureId].open_status = _open_status;
  }
function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}

  // Refresh the game odd
  function changeOdd (uint64 _fixtureId, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw ) external onlyOwner {
    gameList[_fixtureId].odd_homeTeam        = _odd_homeTeam;
    gameList[_fixtureId].odd_drawTeam        = _odd_drawTeam;
    gameList[_fixtureId].odd_awayTeam        = _odd_awayTeam;
    gameList[_fixtureId].odd_over            = _odd_over;
    gameList[_fixtureId].odd_under           = _odd_under;
    gameList[_fixtureId].odd_homeTeamAndDraw = _odd_homeTeamAndDraw;
    gameList[_fixtureId].odd_homeAndAwayTeam = _odd_homeAndAwayTeam;
    gameList[_fixtureId].odd_awayTeamAndDraw = _odd_awayTeamAndDraw;
    emit ChangeOdd (_fixtureId, _odd_homeTeam, _odd_drawTeam, _odd_awayTeam, _odd_over, _odd_under, _odd_homeTeamAndDraw, _odd_homeAndAwayTeam , _odd_awayTeamAndDraw);
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

  // Save the game information
  function setGameInfo (uint64 _fixtureId, uint256 _timestamp, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw, uint8 _open_status ) external onlyOwner {
    gameList[_fixtureId].timestamp           = _timestamp;
    gameList[_fixtureId].odd_homeTeam        = _odd_homeTeam;
    gameList[_fixtureId].odd_drawTeam        = _odd_drawTeam;
    gameList[_fixtureId].odd_awayTeam        = _odd_awayTeam;
    gameList[_fixtureId].odd_over            = _odd_over;
    gameList[_fixtureId].odd_under           = _odd_under;
    gameList[_fixtureId].odd_homeTeamAndDraw = _odd_homeTeamAndDraw;
    gameList[_fixtureId].odd_homeAndAwayTeam = _odd_homeAndAwayTeam;
    gameList[_fixtureId].odd_awayTeamAndDraw = _odd_awayTeamAndDraw;
    gameList[_fixtureId].open_status         = _open_status;
    gameList[_fixtureId].isDone              = false;
    emit SetGame(_fixtureId, _timestamp, _odd_homeTeam, _odd_drawTeam, _odd_awayTeam, _odd_over, _odd_under, _odd_homeTeamAndDraw, _odd_homeAndAwayTeam , _odd_awayTeamAndDraw, _open_status);
  }
function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}

  // Player make a bet
  function placeBet(uint64 _fixtureId, uint16 _selectedTeam, uint32 _odd) external   {
    uint stake = msg.value;
    // Minium amount to bet is 0.001 ether
    require(stake >= .001 ether);
    // Check whether odds is valid
    require(_odd != 0 );

    // Compare to match mainnet odds with was submitted odds by betting type
    if (_selectedTeam == 1 ) {
      require(gameList[_fixtureId].odd_homeTeam == _odd);
    } else if ( _selectedTeam == 2) {
      require(gameList[_fixtureId].odd_drawTeam == _odd);
    } else if ( _selectedTeam == 3) {
      require(gameList[_fixtureId].odd_awayTeam == _odd);
    } else if ( _selectedTeam == 4) {
      require(gameList[_fixtureId].odd_over == _odd);
    } else if ( _selectedTeam == 5) {
      require(gameList[_fixtureId].odd_under == _odd);
    } else if ( _selectedTeam == 6) {
      require(gameList[_fixtureId].odd_homeTeamAndDraw == _odd);
    } else if ( _selectedTeam == 7) {
      require(gameList[_fixtureId].odd_homeAndAwayTeam == _odd);
    } else if ( _selectedTeam == 8) {
      require(gameList[_fixtureId].odd_awayTeamAndDraw == _odd);
    } else {
      revert();
    }

    // Betting is possible when the game was opening
    require(gameList[_fixtureId].open_status == 3);
    // Betting is possible only 10 min. ago
    require( now < ( gameList[_fixtureId].timestamp  - 10 minutes ) );

    // Save the betting information
    betList[_fixtureId].push(BetFixture( msg.sender, stake,  _odd, _selectedTeam));
    emit NewStake(msg.sender, _fixtureId, _selectedTeam, stake, _odd );

  }
function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }

  // Give prize money by the game result
  function givePrizeMoney(uint64 _fixtureId, uint8 _homeDrawAway, uint8 _overUnder) external onlyOwner  {
    // Check the game status whether is opening
    require(gameList[_fixtureId].open_status == 3);
    // Check if it has ever compensated
    require(gameList[_fixtureId].isDone == false);
    // Check if it has any player who betted
    require(betList[_fixtureId][0].player != address(0) );

    // Give the prize money!
    for (uint i= 0 ; i < betList[_fixtureId].length; i++){
      uint16 selectedTeam = betList[_fixtureId][i].selectedTeam;
      uint256 returnEth = (betList[_fixtureId][i].stake * betList[_fixtureId][i].odd) / 1000 ;
      if ( (selectedTeam == 1 && _homeDrawAway == 1) 
        || (selectedTeam == 2 && _homeDrawAway == 2) 
        || (selectedTeam == 3 && _homeDrawAway == 3) 
        || (selectedTeam == 4 && _overUnder == 1) 
        || (selectedTeam == 5 && _overUnder == 2) 
        || (selectedTeam == 6 && ( _homeDrawAway == 1 || _homeDrawAway == 2) )
        || (selectedTeam == 7 && ( _homeDrawAway == 1 || _homeDrawAway == 3) )
        || (selectedTeam == 8 && ( _homeDrawAway == 3 || _homeDrawAway == 2) ) 
        ){ 
        betList[_fixtureId][i].player.transfer(returnEth);
      }
    }

    // Change the game status.
    gameList[_fixtureId].open_status = 5;
    // It was paid.
    gameList[_fixtureId].isDone = true; // 보상을 마쳤으므로 true로 변경.

    emit GivePrizeMoney( _fixtureId,  _homeDrawAway,  _overUnder);
  }
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }

  // Standard modifier on methods invokable only by contract owner.
  modifier onlyOwner {
    require (msg.sender == owner);
    _;
  }

  // Get this balance of CA
  function getBalance() external view returns(uint){
    return address(this).balance;
  }
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}

  // Deposit from owner to CA
  function deposit(uint256 _eth) external {
    emit Deposit(msg.sender, _eth);
  }
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }

  // Change Owner
  function changeOwner(address  _newOwner ) external onlyOwner {
    owner = _newOwner;
  }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }

  // Fallback function
  function () external {
    owner.transfer(msg.value);    
  }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }

  // Withdraw from CA to owner
  function withdraw(uint256 _amount) external  onlyOwner {
    require(_amount > 0 && _amount <= address(this).balance );
    owner.transfer(_amount);
    emit Withdraw(owner, _amount);
  }
function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }

}
