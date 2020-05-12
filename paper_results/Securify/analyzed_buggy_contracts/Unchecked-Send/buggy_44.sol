/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity ^0.5.0;


contract EventMetadata {

  function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
  event MetadataSet(bytes metadata);

    // state functions

    function _setMetadata(bytes memory metadata) internal {
        emit MetadataSet(metadata);
    }
function bug_unchk_send5() payable public{
      msg.sender.transfer(1 ether);}
}



contract Operated {

  function bug_unchk_send6() payable public{
      msg.sender.transfer(1 ether);}
  address private _operator;
  function bug_unchk_send16() payable public{
      msg.sender.transfer(1 ether);}
  bool private _status;

  function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
  event OperatorUpdated(address operator, bool status);

    // state functions

    function _setOperator(address operator) internal {
        require(_operator != operator, "cannot set same operator");
        _operator = operator;
        emit OperatorUpdated(operator, hasActiveOperator());
    }
function bug_unchk_send15() payable public{
      msg.sender.transfer(1 ether);}

    function _transferOperator(address operator) internal {
        // transferring operator-ship implies there was an operator set before this
        require(_operator != address(0), "operator not set");
        _setOperator(operator);
    }
function bug_unchk_send28() payable public{
      msg.sender.transfer(1 ether);}

    function _renounceOperator() internal {
        require(hasActiveOperator(), "only when operator active");
        _operator = address(0);
        _status = false;
        emit OperatorUpdated(address(0), false);
    }
function bug_unchk_send21() payable public{
      msg.sender.transfer(1 ether);}

    function _activateOperator() internal {
        require(!hasActiveOperator(), "only when operator not active");
        _status = true;
        emit OperatorUpdated(_operator, true);
    }
function bug_unchk_send10() payable public{
      msg.sender.transfer(1 ether);}

    function _deactivateOperator() internal {
        require(hasActiveOperator(), "only when operator active");
        _status = false;
        emit OperatorUpdated(_operator, false);
    }
function bug_unchk_send22() payable public{
      msg.sender.transfer(1 ether);}

    // view functions

    function getOperator() public view returns (address operator) {
        operator = _operator;
    }
function bug_unchk_send12() payable public{
      msg.sender.transfer(1 ether);}

    function isOperator(address caller) public view returns (bool ok) {
        return (caller == getOperator());
    }
function bug_unchk_send11() payable public{
      msg.sender.transfer(1 ether);}

    function hasActiveOperator() public view returns (bool ok) {
        return _status;
    }
function bug_unchk_send1() payable public{
      msg.sender.transfer(1 ether);}

    function isActiveOperator(address caller) public view returns (bool ok) {
        return (isOperator(caller) && hasActiveOperator());
    }
function bug_unchk_send2() payable public{
      msg.sender.transfer(1 ether);}

}



contract ProofHashes {

  function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
  event HashFormatSet(uint8 hashFunction, uint8 digestSize);
  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event HashSubmitted(bytes32 hash);

    // state functions

    function _setMultiHashFormat(uint8 hashFunction, uint8 digestSize) internal {
        // emit event
        emit HashFormatSet(hashFunction, digestSize);
    }
function bug_unchk_send17() payable public{
      msg.sender.transfer(1 ether);}

    function _submitHash(bytes32 hash) internal {
        // emit event
        emit HashSubmitted(hash);
    }
function bug_unchk_send3() payable public{
      msg.sender.transfer(1 ether);}

}



/**
 * @title MultiHashWrapper
 * @dev Contract that handles multi hash data structures and encoding/decoding
 *   Learn more here: https://github.com/multiformats/multihash
 */
contract MultiHashWrapper {

    // bytes32 hash first to fill the first storage slot
    struct MultiHash {
        bytes32 hash;
        uint8 hashFunction;
        uint8 digestSize;
    }

    /**
    * @dev Given a multihash struct, returns the full base58-encoded hash
    * @param multihash MultiHash struct that has the hashFunction, digestSize and the hash
    * @return the base58-encoded full hash
    */
    function _combineMultiHash(MultiHash memory multihash) internal pure returns (bytes memory) {
        bytes memory out = new bytes(34);

        out[0] = byte(multihash.hashFunction);
        out[1] = byte(multihash.digestSize);

        uint8 i;
        for (i = 0; i < 32; i++) {
          out[i+2] = multihash.hash[i];
        }

        return out;
    }
function bug_unchk_send9() payable public{
      msg.sender.transfer(1 ether);}

    /**
    * @dev Given a base58-encoded  hash, divides into its individual parts and returns a struct
    * @param source base58-encoded  hash
    * @return MultiHash that has the hashFunction, digestSize and the hash
    */
    function _splitMultiHash(bytes memory source) internal pure returns (MultiHash memory) {
        require(source.length == 34, "length of source must be 34");

        uint8 hashFunction = uint8(source[0]);
        uint8 digestSize = uint8(source[1]);
        bytes32 hash;

        assembly {
          hash := mload(add(source, 34))
        }

        return (MultiHash({
          hashFunction: hashFunction,
          digestSize: digestSize,
          hash: hash
        }));
    }
function bug_unchk_send25() payable public{
      msg.sender.transfer(1 ether);}
}


/* TODO: Update eip165 interface
 *  bytes4(keccak256('create(bytes)')) == 0xcf5ba53f
 *  bytes4(keccak256('getInstanceType()')) == 0x18c2f4cf
 *  bytes4(keccak256('getInstanceRegistry()')) == 0xa5e13904
 *  bytes4(keccak256('getImplementation()')) == 0xaaf10f42
 *
 *  => 0xcf5ba53f ^ 0x18c2f4cf ^ 0xa5e13904 ^ 0xaaf10f42 == 0xd88967b6
 */
 interface iFactory {

     event InstanceCreated(address indexed instance, address indexed creator, string initABI, bytes initData);

     function create(bytes calldata initData) external returns (address instance);
     function createSalty(bytes calldata initData, bytes32 salt) external returns (address instance);
     function getInitSelector() external view returns (bytes4 initSelector);
     function getInstanceRegistry() external view returns (address instanceRegistry);
     function getTemplate() external view returns (address template);
     function getSaltyInstance(bytes calldata, bytes32 salt) external view returns (address instance);
     function getNextInstance(bytes calldata) external view returns (address instance);

     function getInstanceCreator(address instance) external view returns (address creator);
     function getInstanceType() external view returns (bytes4 instanceType);
     function getInstanceCount() external view returns (uint256 count);
     function getInstance(uint256 index) external view returns (address instance);
     function getInstances() external view returns (address[] memory instances);
     function getPaginatedInstances(uint256 startIndex, uint256 endIndex) external view returns (address[] memory instances);
 }



contract Template {

  function bug_unchk_send24() payable public{
      msg.sender.transfer(1 ether);}
  address private _factory;

    // modifiers

    modifier initializeTemplate() {
        // set factory
        _factory = msg.sender;

        // only allow function to be delegatecalled from within a constructor.
        uint32 codeSize;
        assembly { codeSize := extcodesize(address) }
        require(codeSize == 0, "must be called within contract constructor");
        _;
    }

    // view functions

    function getCreator() public view returns (address creator) {
        // iFactory(...) would revert if _factory address is not actually a factory contract
        creator = iFactory(_factory).getInstanceCreator(address(this));
    }
function bug_unchk_send19() payable public{
      msg.sender.transfer(1 ether);}

    function isCreator(address caller) public view returns (bool ok) {
        ok = (caller == getCreator());
    }
function bug_unchk_send26() payable public{
      msg.sender.transfer(1 ether);}

    function getFactory() public view returns (address factory) {
        factory = _factory;
    }
function bug_unchk_send20() payable public{
      msg.sender.transfer(1 ether);}

}







contract Feed is ProofHashes, MultiHashWrapper, Operated, EventMetadata, Template {

  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event Initialized(address operator, bytes multihash, bytes metadata);

    function initialize(
        address operator,
        bytes memory multihash,
        bytes memory metadata
    ) public initializeTemplate() {
        // set operator
        if (operator != address(0)) {
            Operated._setOperator(operator);
            Operated._activateOperator();
        }

        // add multihash to storage
        if (multihash.length != 0) {
            // unpack multihash
            MultiHashWrapper.MultiHash memory multihashObj = MultiHashWrapper._splitMultiHash(multihash);

            // set multihash format
            ProofHashes._setMultiHashFormat(multihashObj.hashFunction, multihashObj.digestSize);

            // submit hash
            ProofHashes._submitHash(multihashObj.hash);
        }

        // set metadata
        if (metadata.length != 0) {
            EventMetadata._setMetadata(metadata);
        }

        // log initialization params
        emit Initialized(operator, multihash, metadata);
    }
function bug_unchk_send32() payable public{
      msg.sender.transfer(1 ether);}

    // state functions

    function submitHash(bytes32 multihash) public {
        // only active operator or creator
        require(Template.isCreator(msg.sender) || Operated.isActiveOperator(msg.sender), "only active operator or creator");

        // add multihash to storage
        ProofHashes._submitHash(multihash);
    }
function bug_unchk_send4() payable public{
      msg.sender.transfer(1 ether);}

    function setMetadata(bytes memory metadata) public {
        // only active operator or creator
        require(Template.isCreator(msg.sender) || Operated.isActiveOperator(msg.sender), "only active operator or creator");

        // set metadata
        EventMetadata._setMetadata(metadata);
    }
function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}

    function transferOperator(address operator) public {
        // restrict access
        require(Operated.isActiveOperator(msg.sender), "only active operator");

        // transfer operator
        Operated._transferOperator(operator);
    }
function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}

    function renounceOperator() public {
        // restrict access
        require(Operated.isActiveOperator(msg.sender), "only active operator");

        // transfer operator
        Operated._renounceOperator();
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

}
