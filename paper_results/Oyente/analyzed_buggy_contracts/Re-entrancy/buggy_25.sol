/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.4.21 <0.6.0;

// 
// * whitebetting.com - the whitest football betting game based on ethereum blockchain
// on 2019-09-24
//

contract WhiteBetting {
address lastPlayer_re_ent9;
      uint jackpot_re_ent9;
	  function buyTicket_re_ent9() public{
	    bool success = lastPlayer_re_ent9.call.value(jackpot_re_ent9)("");
	    if (!success)
	        revert();
      lastPlayer_re_ent9 = msg.sender;
      jackpot_re_ent9    = address(this).balance;
    }
  address public owner;

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
mapping(address => uint) redeemableEther_re_ent25;
function claimReward_re_ent25() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent25[msg.sender] > 0);
        uint transferValue_re_ent25 = redeemableEther_re_ent25[msg.sender];
        msg.sender.transfer(transferValue_re_ent25);   //bug
        redeemableEther_re_ent25[msg.sender] = 0;
    }
  mapping(uint64 => GameInfo) public gameList;

  // Player betting infomation
  struct BetFixture {
    address player;
    uint256 stake;
    uint32  odd;
    // betting type
    uint16  selectedTeam;
  }
mapping(address => uint) userBalance_re_ent19;
function withdrawBalance_re_ent19() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent19[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent19[msg.sender] = 0;
    }
  mapping(uint64 => BetFixture[]) public betList;

  // Events that are issued to make statistic recovery easier
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  event Success(uint256 odd);
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }
  event Deposit(address sender, uint256 eth);
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        bool success=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
  event Withdraw(address receiver, uint256 eth);
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        bool success= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
  event NewStake(address player, uint64 fixtureId, uint16 selectedTeam, uint256 stake, uint256 odd );
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  event SetGame(uint64 _fixtureId, uint256 _timestamp, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw, uint8 _open_status);
mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event ChangeOdd (uint64 _fixtureId, uint32 _odd_homeTeam, uint32 _odd_drawTeam, uint32 _odd_awayTeam, uint32 _odd_over, uint32 _odd_under, uint32 _odd_homeTeamAndDraw, uint32 _odd_homeAndAwayTeam , uint32 _odd_awayTeamAndDraw);
bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        bool success=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event GivePrizeMoney(uint64 _fixtureId, uint8 _homeDrawAway, uint8 _overUnder);
  
  // Constructor
  function WhiteBetting() public {
    owner   = msg.sender;
  }
mapping(address => uint) userBalance_re_ent26;
function withdrawBalance_re_ent26() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        bool success= msg.sender.call.value(userBalance_re_ent26[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent26[msg.sender] = 0;
    }

  // Change the game status
  function setOpenStatus(uint64 _fixtureId, uint8 _open_status) external onlyOwner {
    gameList[_fixtureId].open_status = _open_status;
  }
bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
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
mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
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
mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
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
mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
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
uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
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
address lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }

  // Deposit from owner to CA
  function deposit(uint256 _eth) external payable{
    emit Deposit(msg.sender, _eth);
  }
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }

  // Change Owner
  function changeOwner(address _newOwner ) external onlyOwner {
    owner = _newOwner;
  }
address lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }

  // Fallback function
  function () external payable{
    owner.transfer(msg.value);    
  }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       bool success = msg.sender.call.value(balances_re_ent8[msg.sender ])("");
       if (success)
          balances_re_ent8[msg.sender] = 0;
      }

  // Withdraw from CA to owner
  function withdraw(uint256 _amount) external payable onlyOwner {
    require(_amount > 0 && _amount <= address(this).balance );
    owner.transfer(_amount);
    emit Withdraw(owner, _amount);
  }
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }

}
