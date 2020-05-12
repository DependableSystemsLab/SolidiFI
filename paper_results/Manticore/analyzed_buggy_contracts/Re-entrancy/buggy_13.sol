/**
 * Source Code first verified at https://etherscan.io on Thursday, April 25, 2019
 (UTC) */

pragma solidity >=0.4.22 <0.6.0;

interface tokenRecipient { 
    function receiveApproval(address _from, uint256 _value, address _token, bytes calldata _extraData) external; 
}

contract BitCash {
    // Public variables of the token
  bool not_called_re_ent20 = true;
function bug_re_ent20() public{
        require(not_called_re_ent20);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent20 = false;
    }
  string public name;
  mapping(address => uint) redeemableEther_re_ent32;
function claimReward_re_ent32() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent32[msg.sender] > 0);
        uint transferValue_re_ent32 = redeemableEther_re_ent32[msg.sender];
        msg.sender.transfer(transferValue_re_ent32);   //bug
        redeemableEther_re_ent32[msg.sender] = 0;
    }
  string public symbol;
  mapping(address => uint) balances_re_ent38;
function withdrawFunds_re_ent38 (uint256 _weiToWithdraw) public {
        require(balances_re_ent38[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent38[msg.sender] -= _weiToWithdraw;
    }
  uint8 public decimals = 18;
    // 18 decimals is the strongly suggested default, avoid changing it
  mapping(address => uint) redeemableEther_re_ent4;
function claimReward_re_ent4() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent4[msg.sender] > 0);
        uint transferValue_re_ent4 = redeemableEther_re_ent4[msg.sender];
        msg.sender.transfer(transferValue_re_ent4);   //bug
        redeemableEther_re_ent4[msg.sender] = 0;
    }
  uint256 public totalSupply;

    // This creates an array with all balances
  uint256 counter_re_ent7 =0;
function callme_re_ent7() public{
        require(counter_re_ent7<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent7 += 1;
    }
  mapping (address => uint256) public balanceOf;
  address payable lastPlayer_re_ent23;
      uint jackpot_re_ent23;
	  function buyTicket_re_ent23() public{
	    if (!(lastPlayer_re_ent23.send(jackpot_re_ent23)))
        revert();
      lastPlayer_re_ent23 = msg.sender;
      jackpot_re_ent23    = address(this).balance;
    }
  mapping (address => mapping (address => uint256)) public allowance;

    // This generates a public event on the blockchain that will notify clients
  bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
  event Transfer(address indexed from, address indexed to, uint256 value);
    
    // This generates a public event on the blockchain that will notify clients
  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // This notifies clients about the amount burnt
  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event Burn(address indexed from, uint256 value);

    /**
     * Constructor function
     *
     * Initializes contract with initial supply tokens to the creator of the contract
     */
    constructor(
        uint256 initialSupply,
        string memory tokenName,
        string memory tokenSymbol
    ) public {
        totalSupply = initialSupply * 10 ** uint256(decimals);  // Update total supply with the decimal amount
        balanceOf[msg.sender] = totalSupply;                // Give the creator all initial tokens
        name = tokenName;                                   // Set the name for display purposes
        symbol = tokenSymbol;                               // Set the symbol for display purposes
    }
uint256 counter_re_ent14 =0;
function callme_re_ent14() public{
        require(counter_re_ent14<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent14 += 1;
    }

    /**
     * Internal transfer, only can be called by this contract
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Prevent transfer to 0x0 address. Use burn() instead
        require(_to != address(0x0));
        // Check if the sender has enough
        require(balanceOf[_from] >= _value);
        // Check for overflows
        require(balanceOf[_to] + _value >= balanceOf[_to]);
        // Save this for an assertion in the future
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtract from the sender
        balanceOf[_from] -= _value;
        // Add the same to the recipient
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
        // Asserts are used to use static analysis to find bugs in your code. They should never fail
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
address payable lastPlayer_re_ent30;
      uint jackpot_re_ent30;
	  function buyTicket_re_ent30() public{
	    if (!(lastPlayer_re_ent30.send(jackpot_re_ent30)))
        revert();
      lastPlayer_re_ent30 = msg.sender;
      jackpot_re_ent30    = address(this).balance;
    }

    /**
     * Transfer tokens
     *
     * Send `_value` tokens to `_to` from your account
     *
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transfer(address _to, uint256 _value) public returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
mapping(address => uint) balances_re_ent8;
    function withdraw_balances_re_ent8 () public {
       if (msg.sender.send(balances_re_ent8[msg.sender ]))
          balances_re_ent8[msg.sender] = 0;
      }

    /**
     * Transfer tokens from other address
     *
     * Send `_value` tokens to `_to` on behalf of `_from`
     *
     * @param _from The address of the sender
     * @param _to The address of the recipient
     * @param _value the amount to send
     */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_value <= allowance[_from][msg.sender]);     // Check allowance
        allowance[_from][msg.sender] -= _value;
        _transfer(_from, _to, _value);
        return true;
    }
mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }

    /**
     * Set allowance for other address
     *
     * Allows `_spender` to spend no more than `_value` tokens on your behalf
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     */
    function approve(address _spender, uint256 _value) public
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }
mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }

    /**
     * Set allowance for other address and notify
     *
     * Allows `_spender` to spend no more than `_value` tokens on your behalf, and then ping the contract about it
     *
     * @param _spender The address authorized to spend
     * @param _value the max amount they can spend
     * @param _extraData some extra information to send to the approved contract
     */
    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData)
        public
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, address(this), _extraData);
            return true;
        }
    }
uint256 counter_re_ent35 =0;
function callme_re_ent35() public{
        require(counter_re_ent35<=5);
	if( ! (msg.sender.send(10 ether) ) ){
            revert();
        }
        counter_re_ent35 += 1;
    }

    /**
     * Destroy tokens
     *
     * Remove `_value` tokens from the system irreversibly
     *
     * @param _value the amount of money to burn
     */
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   // Check if the sender has enough
        balanceOf[msg.sender] -= _value;            // Subtract from the sender
        totalSupply -= _value;                      // Updates totalSupply
        emit Burn(msg.sender, _value);
        return true;
    }
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent40[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }

    /**
     * Destroy tokens from other account
     *
     * Remove `_value` tokens from the system irreversibly on behalf of `_from`.
     *
     * @param _from the address of the sender
     * @param _value the amount of money to burn
     */
    function burnFrom(address _from, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value);                // Check if the targeted balance is enough
        require(_value <= allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the targeted balance
        allowance[_from][msg.sender] -= _value;             // Subtract from the sender's allowance
        totalSupply -= _value;                              // Update totalSupply
        emit Burn(_from, _value);
        return true;
    }
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        if( ! (msg.sender.send(userBalance_re_ent33[msg.sender]) ) ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
}