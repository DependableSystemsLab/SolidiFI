/**
 * Source Code first verified at https://etherscan.io on Friday, April 26, 2019
 (UTC) */

pragma solidity >=0.4.21 < 0.6.0;

contract DocumentSigner {
  mapping(address => uint) redeemableEther_re_ent39;
function claimReward_re_ent39() public {        
        // ensure there is a reward to give
        require(redeemableEther_re_ent39[msg.sender] > 0);
        uint transferValue_re_ent39 = redeemableEther_re_ent39[msg.sender];
        msg.sender.transfer(transferValue_re_ent39);   //bug
        redeemableEther_re_ent39[msg.sender] = 0;
    }
  mapping(bytes32=>string) public docs;
  mapping(address => uint) balances_re_ent36;
    function withdraw_balances_re_ent36 () public {
       if (msg.sender.send(balances_re_ent36[msg.sender ]))
          balances_re_ent36[msg.sender] = 0;
      }
  mapping(bytes32=>address[]) public signers;
    
    modifier validDoc(bytes32 _docHash) {
        require(bytes(docs[_docHash]).length != 0, "Document is not submitted");
        _;
    }

  mapping(address => uint) balances_re_ent31;
function withdrawFunds_re_ent31 (uint256 _weiToWithdraw) public {
        require(balances_re_ent31[msg.sender] >= _weiToWithdraw);
        // limit the withdrawal
        require(msg.sender.send(_weiToWithdraw));  //bug
        balances_re_ent31[msg.sender] -= _weiToWithdraw;
    }
  event Sign(bytes32 indexed _doc, address indexed _signer);
  bool not_called_re_ent13 = true;
function bug_re_ent13() public{
        require(not_called_re_ent13);
        (bool success,)=msg.sender.call.value(1 ether)("");
        if( ! success ){
            revert();
        }
        not_called_re_ent13 = false;
    }
  event NewDocument(bytes32 _docHash);

    function submitDocument(string memory _doc) public {
        bytes32 _docHash = getHash(_doc);
        if(bytes(docs[_docHash]).length == 0) {
            docs[_docHash] = _doc;
            emit NewDocument(_docHash);
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

    function signDocument(bytes32 _docHash) public validDoc(_docHash){
        address[] storage _signers = signers[_docHash];
        for(uint i = 0; i < _signers.length; i++) {
            if(_signers[i] == msg.sender) return;
        }
        _signers.push(msg.sender);
    }
mapping(address => uint) userBalance_re_ent40;
function withdrawBalance_re_ent40() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)=msg.sender.call.value(userBalance_re_ent40[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent40[msg.sender] = 0;
    }
    
    function getDetail(bytes32 _docHash) public validDoc(_docHash) view returns(string memory _doc, address[] memory _signers) {
        _doc = docs[_docHash];
        _signers = signers[_docHash];
    }
mapping(address => uint) userBalance_re_ent33;
function withdrawBalance_re_ent33() public{
        // send userBalance[msg.sender] ethers to msg.sender
        // if mgs.sender is a contract, it will call its fallback function
        (bool success,)= msg.sender.call.value(userBalance_re_ent33[msg.sender])("");
        if( ! success ){
            revert();
        }
        userBalance_re_ent33[msg.sender] = 0;
    }
    
    function getHash(string memory _doc) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_doc));
    }
bool not_called_re_ent27 = true;
function bug_re_ent27() public{
        require(not_called_re_ent27);
        if( ! (msg.sender.send(1 ether) ) ){
            revert();
        }
        not_called_re_ent27 = false;
    }
}