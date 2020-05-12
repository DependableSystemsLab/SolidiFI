/**
 *Submitted for verification at Etherscan.io on 2019-09-27
*/

pragma solidity ^0.5.10;

/**
 * Copyright © 2017-2019 Ramp Network sp. z o.o. All rights reserved (MIT License).
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software
 * and associated documentation files (the "Software"), to deal in the Software without restriction,
 * including without limitation the rights to use, copy, modify, merge, publish, distribute,
 * sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
 * is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies
 * or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING
 * BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE
 * AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
 * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


/**
 * A standard, simple transferrable contract ownership.
 */
contract Ownable {

  function bug_unchk_send29() payable public{
      msg.sender.transfer(1 ether);}
  address public owner;

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event OwnerChanged(address oldOwner, address newOwner);

    constructor() internal {
        owner = msg.sender;
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlyOwner() {
        require(msg.sender == owner, "only the owner can call this");
        _;
    }

    function changeOwner(address _newOwner) external onlyOwner {
        owner = _newOwner;
        emit OwnerChanged(msg.sender, _newOwner);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

}


/**
 * A contract that can be stopped/restarted by its owner.
 */
contract Stoppable is Ownable {

  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  bool public isActive = true;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  event IsActiveChanged(bool _isActive);

    modifier onlyActive() {
        require(isActive, "contract is stopped");
        _;
    }

    function setIsActive(bool _isActive) external onlyOwner {
        if (_isActive == isActive) return;
        isActive = _isActive;
        emit IsActiveChanged(_isActive);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

}

/**
 * A simple interface used by the escrows contract (precisely AssetAdapters) to interact
 * with the liquidity pools.
 */
contract RampInstantPoolInterface {

    uint16 public ASSET_TYPE;

    function sendFundsToSwap(uint256 _amount)
        public /*onlyActive onlySwapsContract isWithinLimits*/ returns(bool success);

}

/**
 * An interface of the RampInstantEscrows functions that are used by the liquidity pool contracts.
 * See RampInstantEscrows.sol for more comments.
 */
contract RampInstantEscrowsPoolInterface {

    uint16 public ASSET_TYPE;

    function release(
        address _pool,
        address payable _receiver,
        address _oracle,
        bytes calldata _assetData,
        bytes32 _paymentDetailsHash
    )
        external;
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);} /*statusAtLeast(Status.FINALIZE_ONLY) onlyOracleOrPool(_pool, _oracle)*/

    function returnFunds(
        address payable _pool,
        address _receiver,
        address _oracle,
        bytes calldata _assetData,
        bytes32 _paymentDetailsHash
    )
        external;
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);} /*statusAtLeast(Status.RETURN_ONLY) onlyOracleOrPool(_pool, _oracle)*/

}

/**
 * An abstract Ramp Instant Liquidity Pool. A liquidity provider deploys an instance of this
 * contract, and sends his funds to it. The escrows contract later withdraws portions of these
 * funds to be locked. The owner can withdraw any part of the funds at any time, or temporarily
 * block creating new escrows by stopping the contract.
 *
 * The pool owner can set and update min/max swap amounts, with an upper limit of 2^240 wei/units
 * (see `AssetAdapterWithFees` for more info).
 *
 * The paymentDetailsHash parameters works the same as in the `RampInstantEscrows` contract, only
 * with 0 value and empty transfer title. It describes the bank account where the pool owner expects
 * to be paid, and can be used to validate that a created swap indeed uses the same account.
 *
 * @author Ramp Network sp. z o.o.
 */
contract RampInstantPool is Ownable, Stoppable, RampInstantPoolInterface {

    uint256 constant private MAX_SWAP_AMOUNT_LIMIT = 1 << 240;
    uint16 public ASSET_TYPE;

  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  address payable public swapsContract;
  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public minSwapAmount;
  function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
  uint256 public maxSwapAmount;
  function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}
  bytes32 public paymentDetailsHash;

    /**
     * Triggered when the pool receives new funds, either a topup, or a returned escrow from an old
     * swaps contract if it was changed. Avilable for ETH, ERC-223 and ERC-777 token pools.
     * Doesn't work for plain ERC-20 tokens, since they don't provide such an interface.
     */
  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event ReceivedFunds(address _from, uint256 _amount);
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event LimitsChanged(uint256 _minAmount, uint256 _maxAmount);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event SwapsContractChanged(address _oldAddress, address _newAddress);

    constructor(
        address payable _swapsContract,
        uint256 _minSwapAmount,
        uint256 _maxSwapAmount,
        bytes32 _paymentDetailsHash,
        uint16 _assetType
    )
        public
        validateLimits(_minSwapAmount, _maxSwapAmount)
        validateSwapsContract(_swapsContract, _assetType)
    {
        swapsContract = _swapsContract;
        paymentDetailsHash = _paymentDetailsHash;
        minSwapAmount = _minSwapAmount;
        maxSwapAmount = _maxSwapAmount;
        ASSET_TYPE = _assetType;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function availableFunds() public view returns (uint256);
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

    function withdrawFunds(address payable _to, uint256 _amount)
        public /*onlyOwner*/ returns (bool success);
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

    function withdrawAllFunds(address payable _to) public onlyOwner returns (bool success) {
        return withdrawFunds(_to, availableFunds());
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

    function setLimits(
        uint256 _minAmount,
        uint256 _maxAmount
    ) public onlyOwner validateLimits(_minAmount, _maxAmount) {
        minSwapAmount = _minAmount;
        maxSwapAmount = _maxAmount;
        emit LimitsChanged(_minAmount, _maxAmount);
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    function setSwapsContract(
        address payable _swapsContract
    ) public onlyOwner validateSwapsContract(_swapsContract, ASSET_TYPE) {
        address oldSwapsContract = swapsContract;
        swapsContract = _swapsContract;
        emit SwapsContractChanged(oldSwapsContract, _swapsContract);
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}

    function sendFundsToSwap(uint256 _amount)
        public /*onlyActive onlySwapsContract isWithinLimits*/ returns(bool success);

    function releaseSwap(
        address payable _receiver,
        address _oracle,
        bytes calldata _assetData,
        bytes32 _paymentDetailsHash
    ) external onlyOwner {
        RampInstantEscrowsPoolInterface(swapsContract).release(
            address(this),
            _receiver,
            _oracle,
            _assetData,
            _paymentDetailsHash
        );
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function returnSwap(
        address _receiver,
        address _oracle,
        bytes calldata _assetData,
        bytes32 _paymentDetailsHash
    ) external onlyOwner {
        RampInstantEscrowsPoolInterface(swapsContract).returnFunds(
            address(this),
            _receiver,
            _oracle,
            _assetData,
            _paymentDetailsHash
        );
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * Needed for address(this) to be payable in call to returnFunds.
     * The Eth pool overrides this to not throw.
     */
    function () external payable {
        revert("this pool cannot receive ether");
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

    modifier onlySwapsContract() {
        require(msg.sender == swapsContract, "only the swaps contract can call this");
        _;
    }

    modifier isWithinLimits(uint256 _amount) {
        require(_amount >= minSwapAmount && _amount <= maxSwapAmount, "amount outside swap limits");
        _;
    }

    modifier validateLimits(uint256 _minAmount, uint256 _maxAmount) {
        require(_minAmount <= _maxAmount, "min limit over max limit");
        require(_maxAmount <= MAX_SWAP_AMOUNT_LIMIT, "maxAmount too high");
        _;
    }

    modifier validateSwapsContract(address payable _swapsContract, uint16 _assetType) {
        require(_swapsContract != address(0), "null swaps contract address");
        require(
            RampInstantEscrowsPoolInterface(_swapsContract).ASSET_TYPE() == _assetType,
            "pool asset type doesn't match swap contract"
        );
        _;
    }

}

/**
 * A pool that implements handling of ETH assets. See `RampInstantPool`.
 *
 * @author Ramp Network sp. z o.o.
 */
contract RampInstantEthPool is RampInstantPool {

  function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}
  uint16 internal constant ETH_TYPE_ID = 1;

    constructor(
        address payable _swapsContract,
        uint256 _minSwapAmount,
        uint256 _maxSwapAmount,
        bytes32 _paymentDetailsHash
    )
        public
        RampInstantPool(
            _swapsContract, _minSwapAmount, _maxSwapAmount, _paymentDetailsHash, ETH_TYPE_ID
        )
    {}
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    function availableFunds() public view returns(uint256) {
        return address(this).balance;
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function withdrawFunds(
        address payable _to,
        uint256 _amount
    ) public onlyOwner returns (bool success) {
        _to.transfer(_amount);  // always throws on failure
        return true;
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function sendFundsToSwap(
        uint256 _amount
    ) public onlyActive onlySwapsContract isWithinLimits(_amount) returns(bool success) {
        swapsContract.transfer(_amount);  // always throws on failure
        return true;
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    /**
     * This adapter can receive eth payments, but no other use of the fallback function is allowed.
     */
    function () external payable {
        require(msg.data.length == 0, "invalid pool function called");
        if (msg.sender != swapsContract) {
            emit ReceivedFunds(msg.sender, msg.value);
        }
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

}
