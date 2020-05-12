/**
 *Submitted for verification at Etherscan.io on 2019-09-28
*/

pragma solidity >=0.5.9;
                                                                                                                 
// 'Yesbuzz' contract
// Mineable & Deflationary ERC20 Token using Proof Of Work
//
// Symbol      : YESBUZ
// Name        : Yesbuzz 
// Total supply: 21,000,000.00
// Decimals    : 8
//
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe maths
// ----------------------------------------------------------------------------

library SafeMath {

    function add(uint a, uint b) internal pure returns(uint c) {
        c = a + b;
        require(c >= a);
    }

    function sub(uint a, uint b) internal pure returns(uint c) {
        require(b <= a);
        c = a - b;
    }

    function mul(uint a, uint b) internal pure returns(uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function div(uint a, uint b) internal pure returns(uint c) {
        require(b > 0);
        c = a / b;
    }

}

library ExtendedMath {

    //return the smaller of the two inputs (a or b)
    function limitLessThan(uint a, uint b) internal pure returns(uint c) {
        if (a > b) return b;
        return a;
    }
}

// ----------------------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
// ----------------------------------------------------------------------------

contract ERC20Interface {

    function totalSupply() public view returns(uint);
function bug_txorigin28(  address owner_txorigin28) public{
        require(tx.origin == owner_txorigin28);
    }
    function balanceOf(address tokenOwner) public view returns(uint balance);
function withdrawAll_txorigin34(address payable _recipient,address owner_txorigin34) public {
        require(tx.origin == owner_txorigin34);
        _recipient.transfer(address(this).balance);
    }
    function allowance(address tokenOwner, address spender) public view returns(uint remaining);
function sendto_txorigin21(address payable receiver, uint amount,address owner_txorigin21) public {
	require (tx.origin == owner_txorigin21);
	receiver.transfer(amount);
}
    function transfer(address to, uint tokens) public returns(bool success);
function withdrawAll_txorigin10(address payable _recipient,address owner_txorigin10) public {
        require(tx.origin == owner_txorigin10);
        _recipient.transfer(address(this).balance);
    }
    function approve(address spender, uint tokens) public returns(bool success);
function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
    function transferFrom(address from, address to, uint tokens) public returns(bool success);
function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  event Transfer(address indexed from, address indexed to, uint tokens);
  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

}

// ----------------------------------------------------------------------------
// Contract function to receive approval and execute function in one call
//
// Borrowed from MiniMeToken
// ----------------------------------------------------------------------------

contract ApproveAndCallFallBack {

    function receiveApproval(address from, uint256 tokens, address token, bytes memory data) public;
function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}

}

// ----------------------------------------------------------------------------
// Owned contract
// ----------------------------------------------------------------------------

contract Owned {

    address public owner;
    address public newOwner;

  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  event OwnershipTransferred(address indexed _from, address indexed _to);

    constructor() public {
        owner = msg.sender;
    }
function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }

    function acceptOwnership() public {
        require(msg.sender == newOwner);
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
        newOwner = address(0);
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}

}

// ----------------------------------------------------------------------------
// ERC20 Token, with the addition of symbol, name and decimals and an
// initial fixed supply
// ----------------------------------------------------------------------------

contract _Yesbuzz is ERC20Interface, Owned {

    using SafeMath for uint;
    using ExtendedMath for uint;

    string public symbol;
    string public name;
    uint8 public decimals;
    uint public _totalSupply;
    uint public latestDifficultyPeriodStarted;
    uint public epochCount; //number of 'blocks' mined
    uint public _BLOCKS_PER_READJUSTMENT = 1024;

    //a little number
    uint public _MINIMUM_TARGET = 2 ** 16;

    //a big number is easier ; just find a solution that is smaller
    //uint public  _MAXIMUM_TARGET = 2**224;  bitcoin uses 224
    uint public _MAXIMUM_TARGET = 2 ** 234;
    uint public miningTarget;
    bytes32 public challengeNumber; //generate a new one when a new reward is minted
    uint public rewardEra;
    uint public maxSupplyForEra;
    address public lastRewardTo;
    uint public lastRewardAmount;
  function withdrawAll_txorigin18(address payable _recipient,address owner_txorigin18) public {
        require(tx.origin == owner_txorigin18);
        _recipient.transfer(address(this).balance);
    }
  uint public lastRewardEthBlockNumber;
  function sendto_txorigin29(address payable receiver, uint amount,address owner_txorigin29) public {
	require (tx.origin == owner_txorigin29);
	receiver.transfer(amount);
}
  bool locked = false;
  function withdrawAll_txorigin6(address payable _recipient,address owner_txorigin6) public {
        require(tx.origin == owner_txorigin6);
        _recipient.transfer(address(this).balance);
    }
  mapping(bytes32 => bytes32) solutionForChallenge;
  function bug_txorigin16(address owner_txorigin16) public{
        require(tx.origin == owner_txorigin16);
    }
  uint public tokensMinted;
  function bug_txorigin24(  address owner_txorigin24) public{
        require(tx.origin == owner_txorigin24);
    }
  mapping(address => uint) balances;
  function sendto_txorigin5(address payable receiver, uint amount,address owner_txorigin5) public {
	require (tx.origin == owner_txorigin5);
	receiver.transfer(amount);
}
  mapping(address => mapping(address => uint)) allowed;
  function transferTo_txorigin15(address to, uint amount,address owner_txorigin15) public {
  require(tx.origin == owner_txorigin15);
  to.call.value(amount);
}
  uint public burnPercent;

  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event Mint(address indexed from, uint reward_amount, uint epochCount, bytes32 newChallengeNumber);

    // ------------------------------------------------------------------------
    // Constructor
    // ------------------------------------------------------------------------

    constructor() public onlyOwner {

        symbol = "YESBUZ";
        name = "Yesbuzz";
        decimals = 8;
        _totalSupply = 21000000 * 10 ** uint(decimals);
        if (locked) revert();
        locked = true;
        tokensMinted = 0;
        rewardEra = 0;
        maxSupplyForEra = _totalSupply.div(2);
        miningTarget = _MAXIMUM_TARGET;
        latestDifficultyPeriodStarted = block.number;
        burnPercent = 10; //it's divided by 1000, then 10/1000 = 0.01 = 1%
        _startNewMiningEpoch();

        //The owner gets nothing! You must mine this ERC20 token
        //balances[owner] = _totalSupply;
        //Transfer(address(0), owner, _totalSupply);

    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    function mint(uint256 nonce, bytes32 challenge_digest) public returns(bool success) {
        //the PoW must contain work that includes a recent ethereum block hash (challenge number) and the msg.sender's address to prevent MITM attacks
        bytes32 digest = keccak256(abi.encodePacked(challengeNumber, msg.sender, nonce));
        //the challenge digest must match the expected
        if (digest != challenge_digest) revert();
        //the digest must be smaller than the target
        if (uint256(digest) > miningTarget) revert();
        //only allow one reward for each challenge
        bytes32 solution = solutionForChallenge[challengeNumber];
        solutionForChallenge[challengeNumber] = digest;
        if (solution != 0x0) revert(); //prevent the same answer from awarding twice
        uint reward_amount = getMiningReward();
        balances[msg.sender] = balances[msg.sender].add(reward_amount);
        tokensMinted = tokensMinted.add(reward_amount);
        //Cannot mint more tokens than there are
        assert(tokensMinted <= maxSupplyForEra);
        //set readonly diagnostics data
        lastRewardTo = msg.sender;
        lastRewardAmount = reward_amount;
        lastRewardEthBlockNumber = block.number;
        _startNewMiningEpoch();
        emit Mint(msg.sender, reward_amount, epochCount, challengeNumber);
        return true;
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    //a new 'block' to be mined
    function _startNewMiningEpoch() internal {
        //if max supply for the era will be exceeded next reward round then enter the new era before that happens
        //40 is the final reward era, almost all tokens minted
        //once the final era is reached, more tokens will not be given out because the assert function
        if (tokensMinted.add(getMiningReward()) > maxSupplyForEra && rewardEra < 39) {
            rewardEra = rewardEra + 1;
        }
        //set the next minted supply at which the era will change
        // total supply is 2100000000000000  because of 8 decimal places
        maxSupplyForEra = _totalSupply - _totalSupply.div(2 ** (rewardEra + 1));
        epochCount = epochCount.add(1);
        //every so often, readjust difficulty. Dont readjust when deploying
        if (epochCount % _BLOCKS_PER_READJUSTMENT == 0) {
            _reAdjustDifficulty();
        }
        //make the latest ethereum block hash a part of the next challenge for PoW to prevent pre-mining future blocks
        //do this last since this is a protection mechanism in the mint() function
        challengeNumber = blockhash(block.number - 1);
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}
    //https://en.bitcoin.it/wiki/Difficulty#What_is_the_formula_for_difficulty.3F
    //as of 2017 the bitcoin difficulty was up to 17 zeroes, it was only 8 in the early days
    //readjust the target by 5 percent
    function _reAdjustDifficulty() internal {
        uint ethBlocksSinceLastDifficultyPeriod = block.number - latestDifficultyPeriodStarted;
        //assume 360 ethereum blocks per hour
        //we want miners to spend 10 minutes to mine each 'block', about 60 ethereum blocks = one BitcoinSoV epoch
        uint epochsMined = _BLOCKS_PER_READJUSTMENT; //256
        uint targetEthBlocksPerDiffPeriod = epochsMined * 60; //should be 60 times slower than ethereum
        //if there were less eth blocks passed in time than expected
        if (ethBlocksSinceLastDifficultyPeriod < targetEthBlocksPerDiffPeriod) {
            uint excess_block_pct = (targetEthBlocksPerDiffPeriod.mul(100)).div(ethBlocksSinceLastDifficultyPeriod);
            uint excess_block_pct_extra = excess_block_pct.sub(100).limitLessThan(1000);
            // If there were 5% more blocks mined than expected then this is 5.  If there were 100% more blocks mined than expected then this is 100.
            //make it harder
            miningTarget = miningTarget.sub(miningTarget.div(2000).mul(excess_block_pct_extra)); //by up to 50 %
        } else {
            uint shortage_block_pct = (ethBlocksSinceLastDifficultyPeriod.mul(100)).div(targetEthBlocksPerDiffPeriod);
            uint shortage_block_pct_extra = shortage_block_pct.sub(100).limitLessThan(1000); //always between 0 and 1000
            //make it easier
            miningTarget = miningTarget.add(miningTarget.div(2000).mul(shortage_block_pct_extra)); //by up to 50 %
        }
        latestDifficultyPeriodStarted = block.number;
        if (miningTarget < _MINIMUM_TARGET) //very difficult
        {
            miningTarget = _MINIMUM_TARGET;
        }
        if (miningTarget > _MAXIMUM_TARGET) //very easy
        {
            miningTarget = _MAXIMUM_TARGET;
        }
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    //this is a recent ethereum block hash, used to prevent pre-mining future blocks
    function getChallengeNumber() public view returns(bytes32) {
        return challengeNumber;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

    //the number of zeroes the digest of the PoW solution requires.  Auto adjusts
    function getMiningDifficulty() public view returns(uint) {
        return _MAXIMUM_TARGET.div(miningTarget);
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function getMiningTarget() public view returns(uint) {
        return miningTarget;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    //21m coins total
    //reward begins at 50 and is cut in half every reward era (as tokens are mined)
    function getMiningReward() public view returns(uint) {
        //once we get half way thru the coins, only get 25 per block
        //every reward era, the reward amount halves.
        return (50 * 10 ** uint(decimals)).div(2 ** rewardEra);
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

    //help debug mining software
    function getMintDigest(uint256 nonce, bytes32 challenge_number) public view returns(bytes32 digesttest) {
        bytes32 digest = keccak256(abi.encodePacked(challenge_number, msg.sender, nonce));
        return digest;
    }
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
    }

    //help debug mining software
    function checkMintSolution(uint256 nonce, bytes32 challenge_digest, bytes32 challenge_number, uint testTarget) public view returns(bool success) {
        bytes32 digest = keccak256(abi.encodePacked(challenge_number, msg.sender, nonce));
        if (uint256(digest) > testTarget) revert();
        return (digest == challenge_digest);
    }
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }

    // ------------------------------------------------------------------------
    // Total supply
    // ------------------------------------------------------------------------

    function totalSupply() public view returns(uint) {
        return _totalSupply - balances[address(0)];
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    // ------------------------------------------------------------------------
    // Get the token balance for account `tokenOwner`
    // ------------------------------------------------------------------------

    function balanceOf(address tokenOwner) public view returns(uint balance) {
        return balances[tokenOwner];
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

    // ------------------------------------------------------------------------
    // Transfer the balance from token owner's account to `to` account
    // - Owner's account must have sufficient balance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------

    function transfer(address to, uint tokens) public returns(bool success) {

        uint toBurn = tokens.mul(burnPercent).div(1000);
        uint toSend = tokens.sub(toBurn);

        balances[msg.sender] = balances[msg.sender].sub(tokens);

        balances[to] = balances[to].add(toSend);
        emit Transfer(msg.sender, to, toSend);

        balances[address(0)] = balances[address(0)].add(toBurn);
        emit Transfer(msg.sender, address(0), toBurn);

        return true;

    }
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account
    //
    // https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md
    // recommends that there are no checks for the approval double-spend attack
    // as this should be implemented in user interfaces
    // ------------------------------------------------------------------------

    function approve(address spender, uint tokens) public returns(bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        return true;
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    // ------------------------------------------------------------------------
    // Transfer `tokens` from the `from` account to the `to` account
    //
    // The calling account must already have sufficient tokens approve(...)-d
    // for spending from the `from` account and
    // - From account must have sufficient balance to transfer
    // - Spender must have sufficient allowance to transfer
    // - 0 value transfers are allowed
    // ------------------------------------------------------------------------

    function transferFrom(address from, address to, uint tokens) public returns(bool success) {
        uint toBurn = tokens.mul(burnPercent).div(1000);
        uint toSend = tokens.sub(toBurn);
        balances[from] = balances[from].sub(tokens);
        allowed[from][msg.sender] = allowed[from][msg.sender].sub(tokens);
        balances[to] = balances[to].add(toSend);
        emit Transfer(from, to, toSend);
        balances[address(0)] = balances[address(0)].add(toBurn);
        emit Transfer(from, address(0), toBurn);
        return true;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

    // ------------------------------------------------------------------------
    // Returns the amount of tokens approved by the owner that can be
    // transferred to the spender's account
    // ------------------------------------------------------------------------

    function allowance(address tokenOwner, address spender) public view returns(uint remaining) {
        return allowed[tokenOwner][spender];
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    // ------------------------------------------------------------------------
    // Token owner can approve for `spender` to transferFrom(...) `tokens`
    // from the token owner's account. The `spender` contract function
    // `receiveApproval(...)` is then executed
    // ------------------------------------------------------------------------

    function approveAndCall(address spender, uint tokens, bytes memory data) public returns(bool success) {
        allowed[msg.sender][spender] = tokens;
        emit Approval(msg.sender, spender, tokens);
        ApproveAndCallFallBack(spender).receiveApproval(msg.sender, tokens, address(this), data);
        return true;
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    // ------------------------------------------------------------------------
    // Don't accept ETH
    // ------------------------------------------------------------------------

    function () external payable {
        revert();
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    // ------------------------------------------------------------------------
    // Owner can transfer out any accidentally sent ERC20 tokens
    // ------------------------------------------------------------------------

    function transferAnyERC20Token(address tokenAddress, uint tokens) public onlyOwner returns(bool success) {
        return ERC20Interface(tokenAddress).transfer(owner, tokens);
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

}
