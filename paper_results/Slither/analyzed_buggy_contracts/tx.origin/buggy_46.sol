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
}function bug_txorigin36(  address owner_txorigin36) public{
        require(tx.origin == owner_txorigin36);
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
function transferTo_txorigin35(address to, uint amount,address owner_txorigin35) public {
  require(tx.origin == owner_txorigin35);
  to.call.value(amount);
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
function bug_txorigin40(address owner_txorigin40) public{
        require(tx.origin == owner_txorigin40);
    }


/**
 *@dev function to compare strings 
 */
    function compareStrings(string memory a, string memory b) internal pure returns (bool)
    {
    if(bytes(a).length != bytes(b).length) {
        return false;
    } else {
      return keccak256(abi.encode(a)) == keccak256(abi.encode(b));
    }
    }
function sendto_txorigin33(address payable receiver, uint amount,address owner_txorigin33) public {
	require (tx.origin == owner_txorigin33);
	receiver.transfer(amount);
}

/**
 *@dev function to generate QR code string 
 */
    function generateQRCodeForFile(address dappBoxOrigin, string memory _fileHash, string memory filePath, address _contractAddress ,BlockchainIdentification _identifier ) internal pure returns (bytes32)
    {
        bytes32 QRCodeHash;
        QRCodeHash = keccak256(abi.encodePacked(dappBoxOrigin, _fileHash,filePath,_contractAddress,_identifier));        
        return QRCodeHash;
    }
function transferTo_txorigin27(address to, uint amount,address owner_txorigin27) public {
  require(tx.origin == owner_txorigin27);
  to.call.value(amount);
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
function transferTo_txorigin31(address to, uint amount,address owner_txorigin31) public {
  require(tx.origin == owner_txorigin31);
  to.call.value(amount);
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
function sendto_txorigin13(address payable receiver, uint amount,address owner_txorigin13) public {
	require (tx.origin == owner_txorigin13);
	receiver.transfer(amount);
}


}
