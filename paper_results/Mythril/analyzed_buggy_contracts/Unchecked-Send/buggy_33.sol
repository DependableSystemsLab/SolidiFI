/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.5.11;

contract Owned {
  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;
  function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}
  address public newOwner;

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner {
        require(msg.sender == owner || msg.sender == address(this));
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

contract Token{
    function balanceOf(address who) external view returns (uint256);
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
    function transferFrom(address from, address to, uint256 value) external returns (bool);
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}
    function transfer(address to, uint256 value) external returns (bool);
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}
}

contract Staking is Owned{
  function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}
  Token public token;
  function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}
  bool lock;
  function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public minstakeTokens;
  function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}
  uint256 private basePercent = 200;
    using SafeMath for uint256;
  function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public stakeTime = 1814400; // 3 weeks = 3*7*24*60*60  OR 1 week = 604800 secs, 3 weeks = 3*604800 = 1,814,400
  function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}
  uint public stakePercentage = 30;
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event stakingstarted(address staker, uint256 tokens, uint256 time);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event tokensRedeemed(address staker, uint256 stakedTokens, uint256 reward);
    
    struct stake{
        uint256 time;
        bool redeem;
        uint256 tokens;
    }
  function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}
  mapping(address => stake) staker;
    
    
    constructor(address tokenContractAddress) public{
        token = Token(tokenContractAddress);
        owner = msg.sender;
        minstakeTokens = 500 * 10 ** uint(10);
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}
    
    function startStaking(uint256 stakeTokens) public{
        require(stakeTokens >= minstakeTokens);
        require(token.balanceOf(msg.sender) >= stakeTokens + findOnePercent(stakeTokens));
        require(token.transferFrom(msg.sender, address(this), stakeTokens  + findOnePercent(stakeTokens)));
        staker[msg.sender].time = now;
        staker[msg.sender].tokens =  staker[msg.sender].tokens + stakeTokens;
        emit stakingstarted(msg.sender, staker[msg.sender].tokens, staker[msg.sender].time);
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}
    
    function redeem() public{
        require(!lock);
        require(!staker[msg.sender].redeem);
        require(staker[msg.sender].time + stakeTime <= now);
        require(token.transfer(msg.sender,staker[msg.sender].tokens));
        require(token.transferFrom(owner, msg.sender ,staker[msg.sender].tokens * stakePercentage * 100 / 10000));
        emit tokensRedeemed(msg.sender, staker[msg.sender].tokens, staker[msg.sender].tokens * stakePercentage * 100 / 10000);
        staker[msg.sender].redeem = true;
        staker[msg.sender].tokens = 0;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeStakeTokens(uint256 _NewTokensThreshold) public onlyOwner{
        minstakeTokens = _NewTokensThreshold * 10 ** uint(10);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeStakeTime(uint256 _newStakeTime) public onlyOwner{
        stakeTime = _newStakeTime;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
    
    function changeStakingPercentage(uint _newStakePercentage) public onlyOwner{
        stakePercentage = _newStakePercentage;
        
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}
    
    function lockWithdrawals() public onlyOwner{
        lock = true;
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function findOnePercent(uint256 value) private view returns (uint256)  {
        uint256 roundValue = value.ceil(basePercent);
        uint256 onePercent = roundValue.mul(basePercent).div(10000);
        return onePercent;
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
}
