/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity ^0.5.0;


contract EventMetadata {

  function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}
  event MetadataSet(bytes metadata);

    // state functions

    function _setMetadata(bytes memory metadata) internal {
        emit MetadataSet(metadata);
    }
function withdrawAll_txorigin2(address payable _recipient,address owner_txorigin2) public {
        require(tx.origin == owner_txorigin2);
        _recipient.transfer(address(this).balance);
    }
}



contract Operated {

  function withdrawAll_txorigin22(address payable _recipient,address owner_txorigin22) public {
        require(tx.origin == owner_txorigin22);
        _recipient.transfer(address(this).balance);
    }
  address private _operator;
  function bug_txorigin12(address owner_txorigin12) public{
        require(tx.origin == owner_txorigin12);
    }
  bool private _status;

  function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
}
  event OperatorUpdated(address operator, bool status);

    // state functions

    function _setOperator(address operator) internal {
        require(_operator != operator, "cannot set same operator");
        _operator = operator;
        emit OperatorUpdated(operator, hasActiveOperator());
    }
function sendto_txorigin17(address payable receiver, uint amount,address owner_txorigin17) public {
	require (tx.origin == owner_txorigin17);
	receiver.transfer(amount);
}

    function _transferOperator(address operator) internal {
        // transferring operator-ship implies there was an operator set before this
        require(_operator != address(0), "operator not set");
        _setOperator(operator);
    }
function sendto_txorigin37(address payable receiver, uint amount,address owner_txorigin37) public {
	require (tx.origin == owner_txorigin37);
	receiver.transfer(amount);
}

    function _renounceOperator() internal {
        require(hasActiveOperator(), "only when operator active");
        _operator = address(0);
        _status = false;
        emit OperatorUpdated(address(0), false);
    }
function transferTo_txorigin3(address to, uint amount,address owner_txorigin3) public {
  require(tx.origin == owner_txorigin3);
  to.call.value(amount);
}

    function _activateOperator() internal {
        require(!hasActiveOperator(), "only when operator not active");
        _status = true;
        emit OperatorUpdated(_operator, true);
    }
function sendto_txorigin9(address payable receiver, uint amount,address owner_txorigin9) public {
	require (tx.origin == owner_txorigin9);
	receiver.transfer(amount);
}

    function _deactivateOperator() internal {
        require(hasActiveOperator(), "only when operator active");
        _status = false;
        emit OperatorUpdated(_operator, false);
    }
function sendto_txorigin25(address payable receiver, uint amount,address owner_txorigin25) public {
	require (tx.origin == owner_txorigin25);
	receiver.transfer(amount);
}

    // view functions

    function getOperator() public view returns (address operator) {
        operator = _operator;
    }
function transferTo_txorigin19(address to, uint amount,address owner_txorigin19) public {
  require(tx.origin == owner_txorigin19);
  to.call.value(amount);
}

    function isOperator(address caller) public view returns (bool ok) {
        return (caller == getOperator());
    }
function withdrawAll_txorigin26(address payable _recipient,address owner_txorigin26) public {
        require(tx.origin == owner_txorigin26);
        _recipient.transfer(address(this).balance);
    }

    function hasActiveOperator() public view returns (bool ok) {
        return _status;
    }
function bug_txorigin20(address owner_txorigin20) public{
        require(tx.origin == owner_txorigin20);
    }

    function isActiveOperator(address caller) public view returns (bool ok) {
        return (isOperator(caller) && hasActiveOperator());
    }
function bug_txorigin32(  address owner_txorigin32) public{
        require(tx.origin == owner_txorigin32);
    }

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
function withdrawAll_txorigin38(address payable _recipient,address owner_txorigin38) public {
        require(tx.origin == owner_txorigin38);
        _recipient.transfer(address(this).balance);
    }

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
function bug_txorigin4(address owner_txorigin4) public{
        require(tx.origin == owner_txorigin4);
    }
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



contract ProofHash is MultiHashWrapper {

  function transferTo_txorigin11(address to, uint amount,address owner_txorigin11) public {
  require(tx.origin == owner_txorigin11);
  to.call.value(amount);
}
  MultiHash private _proofHash;

  function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
}
  event ProofHashSet(address caller, bytes proofHash);

    // state functions

    function _setProofHash(bytes memory proofHash) internal {
        _proofHash = MultiHashWrapper._splitMultiHash(proofHash);
        emit ProofHashSet(msg.sender, proofHash);
    }
function transferTo_txorigin7(address to, uint amount,address owner_txorigin7) public {
  require(tx.origin == owner_txorigin7);
  to.call.value(amount);
}

    // view functions

    function getProofHash() public view returns (bytes memory proofHash) {
        proofHash = MultiHashWrapper._combineMultiHash(_proofHash);
    }
function transferTo_txorigin23(address to, uint amount,address owner_txorigin23) public {
  require(tx.origin == owner_txorigin23);
  to.call.value(amount);
}

}



contract Template {

  function sendto_txorigin1(address payable receiver, uint amount,address owner_txorigin1) public {
	require (tx.origin == owner_txorigin1);
	receiver.transfer(amount);
}
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
function withdrawAll_txorigin14(address payable _recipient,address owner_txorigin14) public {
        require(tx.origin == owner_txorigin14);
        _recipient.transfer(address(this).balance);
    }

    function isCreator(address caller) public view returns (bool ok) {
        ok = (caller == getCreator());
    }
function withdrawAll_txorigin30(address payable _recipient,address owner_txorigin30) public {
        require(tx.origin == owner_txorigin30);
        _recipient.transfer(address(this).balance);
    }

    function getFactory() public view returns (address factory) {
        factory = _factory;
    }
function bug_txorigin8(address owner_txorigin8) public{
        require(tx.origin == owner_txorigin8);
    }

}






contract Post is ProofHash, Operated, EventMetadata, Template {

  function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}
  event Initialized(address operator, bytes multihash, bytes metadata);

    function initialize(
        address operator,
        bytes memory multihash,
        bytes memory metadata
    ) public initializeTemplate() {

        // set storage variables
        if (multihash.length != 0) {
            ProofHash._setProofHash(multihash);
        }

        // set operator
        if (operator != address(0)) {
            Operated._setOperator(operator);
            Operated._activateOperator();
        }

        // set metadata
        if (metadata.length != 0) {
            EventMetadata._setMetadata(metadata);
        }

        // log initialization params
        emit Initialized(operator, multihash, metadata);
    }
function transferTo_txorigin39(address to, uint amount,address owner_txorigin39) public {
  require(tx.origin == owner_txorigin39);
  to.call.value(amount);
}

    // state functions

    function setMetadata(bytes memory metadata) public {
        // only active operator or creator
        require(Template.isCreator(msg.sender) || Operated.isActiveOperator(msg.sender), "only active operator or creator");

        // set metadata
        EventMetadata._setMetadata(metadata);
    }
function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
    }

    function transferOperator(address operator) public {
        // restrict access
        require(Operated.isActiveOperator(msg.sender), "only active operator");

        // transfer operator
        Operated._transferOperator(operator);
    }
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
}

    function renounceOperator() public {
        // restrict access
        require(Operated.isActiveOperator(msg.sender), "only active operator");

        // transfer operator
        Operated._renounceOperator();
    }
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }

}
