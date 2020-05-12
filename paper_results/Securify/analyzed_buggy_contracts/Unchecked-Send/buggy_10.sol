/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
 (UTC) */

pragma solidity >=0.4.21 < 0.6.0;

contract DocumentSigner {
  function bug_unchk_send7() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32=>string) public docs;
  function bug_unchk_send23() payable public{
      msg.sender.transfer(1 ether);}
  mapping(bytes32=>address[]) public signers;
    
    modifier validDoc(bytes32 _docHash) {
        require(bytes(docs[_docHash]).length != 0, "Document is not submitted");
        _;
    }

  function bug_unchk_send31() payable public{
      msg.sender.transfer(1 ether);}
  event Sign(bytes32 indexed _doc, address indexed _signer);
  function bug_unchk_send13() payable public{
      msg.sender.transfer(1 ether);}
  event NewDocument(bytes32 _docHash);

    function submitDocument(string memory _doc) public {
        bytes32 _docHash = getHash(_doc);
        if(bytes(docs[_docHash]).length == 0) {
            docs[_docHash] = _doc;
            emit NewDocument(_docHash);
        }
    }
function bug_unchk_send14() payable public{
      msg.sender.transfer(1 ether);}

    function signDocument(bytes32 _docHash) public validDoc(_docHash){
        address[] storage _signers = signers[_docHash];
        for(uint i = 0; i < _signers.length; i++) {
            if(_signers[i] == msg.sender) return;
        }
        _signers.push(msg.sender);
    }
function bug_unchk_send30() payable public{
      msg.sender.transfer(1 ether);}
    
    function getDetail(bytes32 _docHash) public validDoc(_docHash) view returns(string memory _doc, address[] memory _signers) {
        _doc = docs[_docHash];
        _signers = signers[_docHash];
    }
function bug_unchk_send8() payable public{
      msg.sender.transfer(1 ether);}
    
    function getHash(string memory _doc) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_doc));
    }
function bug_unchk_send27() payable public{
      msg.sender.transfer(1 ether);}
}