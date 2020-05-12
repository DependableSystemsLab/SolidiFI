/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity ^0.5.11;

// 
// * whitebetting.com - the whitest football betting game based on ethereum blockchain
// on 2019-09-24
//

contract WhiteBetting {
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
  address payable public owner;

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
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}
  mapping(uint64 => GameInfo) public gameList;

  // Player betting infomation
  struct BetFixture {
    address payable player;
    uint256 stake;
    uint32  odd;
    // betting type
    uint16  selectedTeam;
  }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}
  mapping(uint64 => BetFixture[]) public betList;

  // Events that are issued to make statistic recovery easier
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }
  event Success(uint256 odd);
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}
  event Deposit(address sender, uint256 eth);
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }
  event Withdraw(address receiver, uint256 eth);
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  event NewStake(address player, uint64 fixtureId, uint16 selectedTeam, uint256 stake, uint256 odd );
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  event SetGame(uint64 _fixtureId, uint256 _timestamp, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw, uint8 _open_status);
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  event ChangeOdd (uint64 _fixtureId, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw);
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event GivePrizeMoney(uint64 _fixtureId, uint8 _homeDrawAway, uint8 _overUnder);
  
  // Constructor
  constructor() public {
    owner   = msg.sender;
  }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

  // Change the game status
  function setOpenStatus(uint64 _fixtureId, uint8 _open_status) external onlyOwner {
    gameList[_fixtureId].open_status = _open_status;
  }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
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
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
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
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
    }

  // Player make a bet
  function placeBet(uint64 _fixtureId, uint16 _selectedTeam, uint32 _odd) external payable  {
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
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

  // Give prize money by the game result
  function givePrizeMoney(uint64 _fixtureId, uint8 _homeDrawAway, uint8 _overUnder) external onlyOwner payable {
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
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

  // Standard modifier on methods invokable only by contract owner.
  modifier onlyOwner {
    require (msg.sender == owner, "OnlyOwner methods called by non-owner.");
    _;
  }

  // Get this balance of CA
  function getBalance() external view returns(uint){
    return address(this).balance;
  }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

  // Deposit from owner to CA
  function deposit(uint256 _eth) external payable{
    emit Deposit(msg.sender, _eth);
  }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

  // Change Owner
  function changeOwner(address payable _newOwner ) external onlyOwner {
    owner = _newOwner;
  }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

  // Fallback function
  function () external payable{
    owner.transfer(msg.value);    
  }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

  // Withdraw from CA to owner
  function withdraw(uint256 _amount) external payable onlyOwner {
    require(_amount > 0 && _amount <= address(this).balance );
    owner.transfer(_amount);
    emit Withdraw(owner, _amount);
  }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

}
