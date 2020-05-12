/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
 (UTC) */

pragma solidity >=0.4.21 < 0.6.0;

contract DocumentSigner {
  function bug_tmstmp33() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
  mapping(bytes32=>string) public docs;
  address winner_tmstmp27;
function play_tmstmp27(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp27 = msg.sender;}}
  mapping(bytes32=>address[]) public signers;
    
    modifier validDoc(bytes32 _docHash) {
        require(bytes(docs[_docHash]).length != 0, "Document is not submitted");
        _;
    }
uint256 bugv_tmstmp2 = block.timestamp;

  uint256 bugv_tmstmp3 = block.timestamp;
  event Sign(bytes32 indexed _doc, address indexed _signer);
  uint256 bugv_tmstmp4 = block.timestamp;
  event NewDocument(bytes32 _docHash);

    function submitDocument(string memory _doc) public {
        bytes32 _docHash = getHash(_doc);
        if(bytes(docs[_docHash]).length == 0) {
            docs[_docHash] = _doc;
            emit NewDocument(_docHash);
        }
    }
address winner_tmstmp31;
function play_tmstmp31(uint startTime) public {
	uint _vtime = block.timestamp;
	if (startTime + (5 * 1 days) == _vtime){
		winner_tmstmp31 = msg.sender;}}

    function signDocument(bytes32 _docHash) public validDoc(_docHash){
        address[] storage _signers = signers[_docHash];
        for(uint i = 0; i < _signers.length; i++) {
            if(_signers[i] == msg.sender) return;
        }
        _signers.push(msg.sender);
    }
function bug_tmstmp13() view public returns (bool) {
    return block.timestamp >= 1546300800;
  }
    
    function getDetail(bytes32 _docHash) public validDoc(_docHash) view returns(string memory _doc, address[] memory _signers) {
        _doc = docs[_docHash];
        _signers = signers[_docHash];
    }
uint256 bugv_tmstmp5 = block.timestamp;
    
    function getHash(string memory _doc) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_doc));
    }
uint256 bugv_tmstmp1 = block.timestamp;
}