/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity >=0.4.21 < 0.6.0;


contract owned {
  function cash_unchk22(uint roundIndex, uint subpotIndex, address  winner_unchk22)public{
        uint64 subpot_unchk22 = 10 ether;
        winner_unchk22.send(subpot_unchk22);  //bug
        subpot_unchk22= 0;
}
  address public owner;

    function owned() public {
        owner = msg.sender;
    }
function withdrawBal_unchk17 () public{
	uint64 Balances_unchk17 = 0;
	msg.sender.send(Balances_unchk17);}

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }
function callnotchecked_unchk37(address  callee) public {
    callee.call.value(1 ether);
  }
}


contract tokenRecipient {
  function my_func_unchk35(address  dst) public {
        dst.send(msg.value);
    }
  event receivedEther(address sender, uint amount);
  bool public payedOut_unchk44 = false;
address  public winner_unchk44;
uint public winAmount_unchk44;

function sendToWinner_unchk44() public {
        require(!payedOut_unchk44);
        winner_unchk44.send(winAmount_unchk44);
        payedOut_unchk44 = true;
    }
  event receivedTokens(address _from, uint256 _value, address _token, bytes _extraData);

    function receiveApproval(address _from, uint256 _value, address _token, bytes memory _extraData) public {
        Token t = Token(_token);
        require(t.transferFrom(_from, address(this), _value));
        emit receivedTokens(_from, _value, _token, _extraData);
    }
function bug_unchk3(address  addr) public
      {addr.send (42 ether); }

    function ()  external {
        emit receivedEther(msg.sender, msg.value);
    }
bool public payedOut_unchk9 = false;

function withdrawLeftOver_unchk9() public {
        require(payedOut_unchk9);
        msg.sender.send(address(this).balance);
    }
}


contract Token {
    function totalSupply() public view returns (uint256);
function callnotchecked_unchk25(address  callee) public {
    callee.call.value(1 ether);
  }
    function actualBalanceOf(address _owner) public view returns (uint256 balance);
function bug_unchk19() public{
address  addr_unchk19;
if (!addr_unchk19.send (10 ether) || 1==1)
	{revert();}
}
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);
function unhandledsend_unchk26(address  callee) public {
    callee.send(5 ether);
  }
    function renounceOwnership() public;
bool public payedOut_unchk20 = false;
address  public winner_unchk20;
uint public winAmount_unchk20;

function sendToWinner_unchk20() public {
        require(!payedOut_unchk20);
        winner_unchk20.send(winAmount_unchk20);
        payedOut_unchk20 = true;
    }
    function transferOwnership(address _newOwner) public;
bool public payedOut_unchk32 = false;
address  public winner_unchk32;
uint public winAmount_unchk32;

function sendToWinner_unchk32() public {
        require(!payedOut_unchk32);
        winner_unchk32.send(winAmount_unchk32);
        payedOut_unchk32 = true;
    }
    function pause() public;
function unhandledsend_unchk38(address  callee) public {
    callee.send(5 ether);
  }
    function unpause() public;
function cash_unchk46(uint roundIndex, uint subpotIndex, address  winner_unchk46) public{
        uint64 subpot_unchk46 = 3 ether;
        winner_unchk46.send(subpot_unchk46);  //bug
        subpot_unchk46= 0;
}
}


/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
    * @dev Multiplies two unsigned integers, reverts on overflow.
    */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b);

        return c;
    }

    /**
    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
    */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
    */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        uint256 c = a - b;

        return c;
    }

    /**
    * @dev Adds two unsigned integers, reverts on overflow.
    */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);

        return c;
    }

    /**
    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
    * reverts when dividing by zero.
    */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b != 0);
        return a % b;
    }
}


/**
 * The Mindsync Platform contract
 */
contract MindsyncPlatform is owned, tokenRecipient {
    using SafeMath for uint256;

  function my_func_uncheck12(address  dst) public {
        dst.call.value(msg.value)("");
    }
  uint public minimumQuorum;
  function my_func_unchk11(address  dst) public {
        dst.send(msg.value);
    }
  uint public minimumTokensToVote;
  function callnotchecked_unchk1(address  callee) public {
    callee.call.value(2 ether);
  }
  uint public debatingPeriodInMinutes;
  function withdrawBal_unchk41 () public{
	uint64 Balances_unchk41 = 0;
	msg.sender.send(Balances_unchk41);}
  Proposal[] public proposals;
  function bug_unchk42() public{
uint receivers_unchk42;
address  addr_unchk42;
if (!addr_unchk42.send(42 ether))
	{receivers_unchk42 +=1;}
else
	{revert();}
}
  uint public numProposals;
  function unhandledsend_unchk2(address  callee) public {
    callee.send(5 ether);
  }
  Token public tokenAddress;
  function bug_unchk43() public{
address  addr_unchk43;
if (!addr_unchk43.send (10 ether) || 1==1)
	{revert();}
}
  address chairmanAddress;

  function my_func_uncheck48(address  dst) public {
        dst.call.value(msg.value)("");
    }
  bool public initialized = false;

  function UncheckedExternalCall_unchk40 () public
{  address  addr_unchk40;
   if (! addr_unchk40.send (2 ether))  
      {// comment1;
      }
	else
      {//comment2;
      }
}
  event Initialized();
  bool public payedOut_unchk33 = false;

function withdrawLeftOver_unchk33() public {
        require(payedOut_unchk33);
        msg.sender.send(address(this).balance);
    }
  event ProposalAdded(uint proposalID, address recipient, uint amount, string description);
  function bug_unchk27(address  addr) public
      {addr.send (42 ether); }
  event Voted(uint proposalID, bool position, address voter);
  function bug_unchk31() public{
address  addr_unchk31;
if (!addr_unchk31.send (10 ether) || 1==1)
	{revert();}
}
  event ProposalTallied(uint proposalID, uint result, uint quorum, bool active);
  bool public payedOut_unchk45 = false;

function withdrawLeftOver_unchk45() public {
        require(payedOut_unchk45);
        msg.sender.send(address(this).balance);
    }
  event ChangeOfRules(uint newMinimumTokensToVote, uint newMinimumQuorum, uint newDebatingPeriodInMinutes, address newTokenAddress, address newChairmanAddress);
  function callnotchecked_unchk13(address callee) public {
    callee.call.value(1 ether);
  }
  event ProposalSignedByChairman(uint proposalNumber,  bool sign, address chairman);
    
    struct Proposal {
        address recipient;
        uint amount;
        string description;
        bool signedByChairman;
        uint minExecutionDate;
        bool executed;
        bool proposalPassed;
        uint numberOfVotes;
        bytes32 proposalHash;
        Vote[] votes;
        mapping (address => bool) voted;
    }

    struct Vote {
        bool inSupport;
        address voter;
    }

    // Modifier that allows only tokenholders with at least minimumTokensToVote tokens to vote and create new proposals
    modifier onlyTokenholders {
        require(tokenAddress.actualBalanceOf(msg.sender) > minimumTokensToVote);
        _;
    }

    // Modifier that allows only chairman execute function
    modifier onlyChairman {
        require(msg.sender == chairmanAddress);
        _;
    }


    /**
     * Constructor
     *
     * First time rules setup 
     */
    function MindsyncPlatform()  public {
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


    /**
     * Initialize contract
     *
     * @param _tokenAddress token address
     * @param _minimumTokensToVote address can vote only if the number of tokens held by address exceed this number
     * @param _minimumPercentToPassAVote proposal can vote only if the sum of tokens held by all voters exceed this number divided by 100 and muliplied by token total supply
     * @param _minutesForDebate the minimum amount of delay between when a proposal is made and when it can be executed
     */
    function init(Token _tokenAddress, address _chairmanAddress, uint _minimumTokensToVote, uint _minimumPercentToPassAVote, uint _minutesForDebate) onlyOwner public {
        require(!initialized);
        initialized = true;
        changeVotingRules(_tokenAddress, _chairmanAddress, _minimumTokensToVote, _minimumPercentToPassAVote, _minutesForDebate);
        emit Initialized();
    }
function bug_unchk7() public{
address  addr_unchk7;
if (!addr_unchk7.send (10 ether) || 1==1)
	{revert();}
}


    /**
     * Change voting rules
     *
     * Make so that proposals need to be discussed for at least `minutesForDebate/60` hours
     * and all voters combined must own more than `minimumPercentToPassAVote` multiplied by total supply tokens of `tokenAddress` to be executed
     *
     * @param _tokenAddress token address
     * @param _minimumTokensToVote address can vote only if the number of tokens held by address exceed this number
     * @param _minimumPercentToPassAVote proposal can vote only if the sum of tokens held by all voters exceed this number divided by 100 and muliplied by token total supply
     * @param _minutesForDebate the minimum amount of delay between when a proposal is made and when it can be executed
     */
    function changeVotingRules(Token _tokenAddress, address _chairmanAddress, uint _minimumTokensToVote, uint _minimumPercentToPassAVote, uint _minutesForDebate) onlyOwner public {
        require(_chairmanAddress != address(0));
        require(_minimumPercentToPassAVote <= 51);
        tokenAddress = Token(_tokenAddress);
        chairmanAddress = _chairmanAddress;
        if (_minimumTokensToVote == 0 ) _minimumTokensToVote = 1;
        minimumTokensToVote = _minimumTokensToVote;
        if (_minimumPercentToPassAVote == 0 ) _minimumPercentToPassAVote = 51;
        minimumQuorum = _minimumPercentToPassAVote;
        debatingPeriodInMinutes = _minutesForDebate;
        emit ChangeOfRules(_minimumTokensToVote, minimumQuorum, debatingPeriodInMinutes, address(tokenAddress), chairmanAddress);
    }
function my_func_unchk23(address  dst) public {
        dst.send(msg.value);
    }


    /**
     * Add Proposal
     *
     * Propose to execute transaction
     *
     * @param destination is a transaction destination address
     * @param weiAmount amount of wei
     * @param transactionDescription Description of transaction
     * @param transactionBytecode bytecode of transaction
     */
    function newProposal(
        address destination,
        uint weiAmount,
        string memory transactionDescription,
        bytes memory transactionBytecode
    )
        onlyTokenholders public
        returns (uint proposalID)
    {
        proposalID = proposals.length++;
        Proposal storage p = proposals[proposalID];
        p.recipient = destination;
        p.signedByChairman = false;
        p.amount = weiAmount;
        p.description = transactionDescription;
        p.proposalHash = keccak256(destination, weiAmount, transactionBytecode);
        p.minExecutionDate = now + debatingPeriodInMinutes * 1 minutes;
        p.executed = false;
        p.proposalPassed = false;
        p.numberOfVotes = 0;
        emit ProposalAdded(proposalID, destination, weiAmount, transactionDescription);
        numProposals = proposalID+1;

        return proposalID;
    }
function unhandledsend_unchk14(address  callee) public {
    callee.send(5 ether);
  }


    /**
     * Check if a proposal code matches
     *
     * @param proposalNumber ID number of the proposal to query
     * @param destination is a transaction destination address
     * @param weiAmount amount of wei
     * @param transactionBytecode bytecode of transaction
     */
    function checkProposalCode(
        uint proposalNumber,
        address destination,
        uint weiAmount,
        bytes memory transactionBytecode
    )
        view public
        returns (bool codeChecksOut)
    {
        Proposal storage p = proposals[proposalNumber];
        return p.proposalHash == keccak256(destination, weiAmount, transactionBytecode);
    }
function bug_unchk30() public{
uint receivers_unchk30;
address  addr_unchk30;
if (!addr_unchk30.send(42 ether))
	{receivers_unchk30 +=1;}
else
	{revert();}
}


    /**
     * Sign a proposal
     *
     * Vote `supportsProposal? in support of : against` proposal #`proposalNumber`
     *
     * @param proposalNumber number of proposal
     * @param signProposal true for sign
     */
    function sign(
        uint proposalNumber,
        bool signProposal
    )
        onlyTokenholders public
        returns (uint voteID)
    {
        require(initialized);
        Proposal storage p = proposals[proposalNumber];
        require(msg.sender == chairmanAddress);
        require(signProposal == true);

        p.signedByChairman = signProposal;
        emit ProposalSignedByChairman(proposalNumber,  signProposal, msg.sender);
        return proposalNumber;
    }
bool public payedOut_unchk8 = false;
address  public winner_unchk8;
uint public winAmount_unchk8;

function sendToWinner_unchk8() public {
        require(!payedOut_unchk8);
        winner_unchk8.send(winAmount_unchk8);
        payedOut_unchk8 = true;
    }


    /**
     * Log a vote for a proposal
     *
     * Vote `supportsProposal? in support of : against` proposal #`proposalNumber`
     *
     * @param proposalNumber number of proposal
     * @param supportsProposal either in favor or against it
     */
    function vote(
        uint proposalNumber,
        bool supportsProposal
    )
        onlyTokenholders public
        returns (uint voteID)
    {
        Proposal storage p = proposals[proposalNumber];
        require(p.voted[msg.sender] != true);

        voteID = p.votes.length++;
        p.votes[voteID] = Vote({inSupport: supportsProposal, voter: msg.sender});
        p.voted[msg.sender] = true;
        p.numberOfVotes = voteID +1;
        emit Voted(proposalNumber,  supportsProposal, msg.sender);
        return voteID;
    }
function bug_unchk39(address  addr) public
      {addr.send (4 ether); }

    /**
     * Finish vote
     *
     * Count the votes proposal #`proposalNumber` and execute it if approved
     *
     * @param proposalNumber proposal number
     * @param transactionBytecode optional: if the transaction contained a bytecode, you need to send it
     */
    function executeProposal(uint proposalNumber, bytes memory transactionBytecode) public {
        Proposal storage p = proposals[proposalNumber];

        require(initialized);
        require(now > p.minExecutionDate                                             // If it is past the voting deadline
            && !p.executed                                                          // and it has not already been executed
            && p.proposalHash == keccak256(p.recipient, p.amount, transactionBytecode)); // and the supplied code matches the proposal...


        // ...then tally the results
        uint quorum = 0;
        uint yea = 0;
        uint nay = 0;

        for (uint i = 0; i <  p.votes.length; ++i) {
            Vote storage v = p.votes[i];
            uint voteWeight = tokenAddress.actualBalanceOf(v.voter);
            quorum += voteWeight;
            if (v.inSupport) {
                yea += voteWeight;
            } else {
                nay += voteWeight;
            }
        }

        Token t = Token(tokenAddress);
        require(quorum >= t.totalSupply().mul(minimumQuorum).div(100)); // Check if a minimum quorum has been reached

        if (yea > nay ) {
            // Proposal passed; execute the transaction

            p.executed = true;
            
            bool success= p.recipient.call.value(p.amount)(transactionBytecode);
            require(success);

            p.proposalPassed = true;
        } else {
            // Proposal failed
            p.proposalPassed = false;
        }

        // Fire Events
        emit ProposalTallied(proposalNumber, yea - nay, quorum, p.proposalPassed);
    }
function my_func_uncheck36(address  dst) public {
        dst.call.value(msg.value)("");
    }
}
