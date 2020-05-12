/**
 *Submitted for verification at Etherscan.io on 2019-09-24
*/

pragma solidity >=0.4.21 <0.6.0;

contract ProofOfExistence {

enum BlockchainIdentification {Ixxo,Ethereum,Gochain}

struct FileExistenceStruct {
uint256 date;
address filesender;
string fileHash;
string filePathHash;
address contractAddress;
bytes32 QRCodeHash;
BlockchainIdentification identifier;
}bool claimed_TOD36 = false;
address owner_TOD36;
uint256 reward_TOD36;
function setReward_TOD36() public payable {
        require (!claimed_TOD36);

        require(msg.sender == owner_TOD36);
        owner_TOD36.transfer(reward_TOD36);
        reward_TOD36 = msg.value;
    }

    function claimReward_TOD36(uint256 submission) public {
        require (!claimed_TOD36);
        require(submission < 10);

        msg.sender.transfer(reward_TOD36);
        claimed_TOD36 = true;
    }


mapping(address => FileExistenceStruct[]) fileExistenceProofs;


/**
 *@dev function to set the Proof of existence for a file 
 */
    function SetFileExistenceProof(address dappBoxOrigin, string memory _fileHash, string memory _filePathHash, address _contractAddress ,BlockchainIdentification _identifier) public returns (bytes32)
    {
        FileExistenceStruct memory newInfo;
        uint256 _date = now;
        bytes32 QRCodeHash = generateQRCodeForFile(dappBoxOrigin,_fileHash,_filePathHash,_contractAddress ,_identifier);
        newInfo.date = _date;
        newInfo.filesender = dappBoxOrigin;
        newInfo.fileHash = _fileHash;
        newInfo.filePathHash = _filePathHash;
        newInfo.contractAddress = _contractAddress;
        newInfo.identifier = _identifier;
        newInfo.QRCodeHash = QRCodeHash;

        fileExistenceProofs[dappBoxOrigin].push(newInfo);
        return QRCodeHash;
    }
address winner_TOD35;
function play_TOD35(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD35 = msg.sender;
        }
    }

function getReward_TOD35() payable public{
     
       winner_TOD35.transfer(msg.value);
    }


/**
 *@dev function to get the Proof of existence for a file 
 */
    function GetFileExistenceProof(address dappBoxOrigin,string memory fileHash, string memory filePathHash) public view returns(uint256,address,address,BlockchainIdentification,bytes32) {
    
        for(uint i = 0 ; i < fileExistenceProofs[dappBoxOrigin].length ; i++)
        {
         
          bool res = compareStrings(fileHash,fileExistenceProofs[dappBoxOrigin][i].fileHash) &&
          compareStrings(filePathHash,fileExistenceProofs[dappBoxOrigin][i].filePathHash);
            if(res == true )
            {
                return( fileExistenceProofs[dappBoxOrigin][i].date,
                fileExistenceProofs[dappBoxOrigin][i].filesender,
                fileExistenceProofs[dappBoxOrigin][i].contractAddress,
                fileExistenceProofs[dappBoxOrigin][i].identifier,
                fileExistenceProofs[dappBoxOrigin][i].QRCodeHash);
            }
        }
    }
bool claimed_TOD40 = false;
address owner_TOD40;
uint256 reward_TOD40;
function setReward_TOD40() public payable {
        require (!claimed_TOD40);

        require(msg.sender == owner_TOD40);
        owner_TOD40.transfer(reward_TOD40);
        reward_TOD40 = msg.value;
    }

    function claimReward_TOD40(uint256 submission) public {
        require (!claimed_TOD40);
        require(submission < 10);

        msg.sender.transfer(reward_TOD40);
        claimed_TOD40 = true;
    }


/**
 *@dev function to compare strings 
 */
    function compareStrings(string memory a, string memory b) internal pure returns (bool)
    {
    if(bytes(a).length != bytes(b).length) {
        return false;
    } else {
      return keccak256((a)) == keccak256((b));
    }
    }
address winner_TOD33;
function play_TOD33(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD33 = msg.sender;
        }
    }

function getReward_TOD33() payable public{
     
       winner_TOD33.transfer(msg.value);
    }

/**
 *@dev function to generate QR code string 
 */
    function generateQRCodeForFile(address dappBoxOrigin, string memory _fileHash, string memory filePath, address _contractAddress ,BlockchainIdentification _identifier ) internal pure returns (bytes32)
    {
        bytes32 QRCodeHash;
        QRCodeHash = keccak256(dappBoxOrigin, _fileHash,filePath,_contractAddress,_identifier);        
        return QRCodeHash;
    }
address winner_TOD27;
function play_TOD27(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD27 = msg.sender;
        }
    }

function getReward_TOD27() payable public{
     
       winner_TOD27.transfer(msg.value);
    }


/**
 *@dev function to retreive QR code in string format 
 */

    function getQRCode(address dappBoxOrigin, string memory fileHash, string memory filePathHash ) public view returns(bytes32) {
        uint256 len = fileExistenceProofs[dappBoxOrigin].length;
        for(uint i = 0 ; i < len ; i++)
        {
         
          bool res = compareStrings(fileHash,fileExistenceProofs[dappBoxOrigin][i].fileHash) &&
          compareStrings(filePathHash,fileExistenceProofs[dappBoxOrigin][i].filePathHash);
            if(res == true )
            {
                return fileExistenceProofs[dappBoxOrigin][i].QRCodeHash;
            }

    }
    }
address winner_TOD31;
function play_TOD31(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD31 = msg.sender;
        }
    }

function getReward_TOD31() payable public{
     
       winner_TOD31.transfer(msg.value);
    }


/**
 *@dev function to get proof of existence using QR code
 */
    function searchExistenceProoUsngQRf(address dappBoxOrigin,bytes32 QRCodeHash) public view returns(uint256,address,address,BlockchainIdentification,bytes32) {
         uint256 len = fileExistenceProofs[dappBoxOrigin].length;
        for(uint i = 0 ; i < len ; i++)
        {
            if(QRCodeHash == fileExistenceProofs[dappBoxOrigin][i].QRCodeHash)
            {
             return( fileExistenceProofs[dappBoxOrigin][i].date,
                fileExistenceProofs[dappBoxOrigin][i].filesender,
                fileExistenceProofs[dappBoxOrigin][i].contractAddress,
                fileExistenceProofs[dappBoxOrigin][i].identifier,
                fileExistenceProofs[dappBoxOrigin][i].QRCodeHash);
        }
        }
    }
address winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }


}
