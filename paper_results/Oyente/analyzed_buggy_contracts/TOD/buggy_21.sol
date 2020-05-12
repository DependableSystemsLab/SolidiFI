pragma solidity >=0.4.21 <0.6.0;

contract Token {
  function transfer(address to, uint256 value) public returns (bool success);
bool claimed_TOD20 = false;
address owner_TOD20;
uint256 reward_TOD20;
function setReward_TOD20() public payable {
        require (!claimed_TOD20);

        require(msg.sender == owner_TOD20);
        owner_TOD20.transfer(reward_TOD20);
        reward_TOD20 = msg.value;
    }

    function claimReward_TOD20(uint256 submission) public {
        require (!claimed_TOD20);
        require(submission < 10);

        msg.sender.transfer(reward_TOD20);
        claimed_TOD20 = true;
    }
  function transferFrom(address from, address to, uint256 value) public returns (bool success);
bool claimed_TOD32 = false;
address owner_TOD32;
uint256 reward_TOD32;
function setReward_TOD32() public payable {
        require (!claimed_TOD32);

        require(msg.sender == owner_TOD32);
        owner_TOD32.transfer(reward_TOD32);
        reward_TOD32 = msg.value;
    }

    function claimReward_TOD32(uint256 submission) public {
        require (!claimed_TOD32);
        require(submission < 10);

        msg.sender.transfer(reward_TOD32);
        claimed_TOD32 = true;
    }
     function balanceOf(address account) external view returns(uint256);
bool claimed_TOD38 = false;
address owner_TOD38;
uint256 reward_TOD38;
function setReward_TOD38() public payable {
        require (!claimed_TOD38);

        require(msg.sender == owner_TOD38);
        owner_TOD38.transfer(reward_TOD38);
        reward_TOD38 = msg.value;
    }

    function claimReward_TOD38(uint256 submission) public {
        require (!claimed_TOD38);
        require(submission < 10);

        msg.sender.transfer(reward_TOD38);
        claimed_TOD38 = true;
    }
     function allowance(address _owner, address _spender)external view returns(uint256);
bool claimed_TOD4 = false;
address owner_TOD4;
uint256 reward_TOD4;
function setReward_TOD4() public payable {
        require (!claimed_TOD4);

        require(msg.sender == owner_TOD4);
        owner_TOD4.transfer(reward_TOD4);
        reward_TOD4 = msg.value;
    }

    function claimReward_TOD4(uint256 submission) public {
        require (!claimed_TOD4);
        require(submission < 10);

        msg.sender.transfer(reward_TOD4);
        claimed_TOD4 = true;
    }
}

library SafeMath{
      function mul(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        if (a == 0) {
        return 0;}
        uint256 c = a * b;
        assert(c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a / b;
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        assert(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) 
    {
        uint256 c = a + b;
        assert(c >= a);
        return c;
    }

}

contract StableDEX {
    using SafeMath for uint256;
    
  address winner_TOD13;
function play_TOD13(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD13 = msg.sender;
        }
    }

function getReward_TOD13() payable public{
     
       winner_TOD13.transfer(msg.value);
    }
  event DepositandWithdraw(address from,address tokenAddress,uint256 amount,uint256 type_); //Type = 0-deposit 1- withdraw , Token address = address(0) - eth , address - token address;
    
  address winner_TOD11;
function play_TOD11(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD11 = msg.sender;
        }
    }

function getReward_TOD11() payable public{
     
       winner_TOD11.transfer(msg.value);
    }
  address admin;
    
  address winner_TOD1;
function play_TOD1(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD1 = msg.sender;
        }
    }

function getReward_TOD1() payable public{
     
       winner_TOD1.transfer(msg.value);
    }
  address public feeAddress;
    
  bool claimed_TOD2 = false;
address owner_TOD2;
uint256 reward_TOD2;
function setReward_TOD2() public payable {
        require (!claimed_TOD2);

        require(msg.sender == owner_TOD2);
        owner_TOD2.transfer(reward_TOD2);
        reward_TOD2 = msg.value;
    }

    function claimReward_TOD2(uint256 submission) public {
        require (!claimed_TOD2);
        require(submission < 10);

        msg.sender.transfer(reward_TOD2);
        claimed_TOD2 = true;
    }
  bool private dexStatus;   
      
  address winner_TOD17;
function play_TOD17(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD17 = msg.sender;
        }
    }

function getReward_TOD17() payable public{
     
       winner_TOD17.transfer(msg.value);
    }
  uint256 public tokenId=0;
      
    struct orders{
        address userAddress;
        address tokenAddress;
        uint256 type_;
        uint256 price;
        uint256 total;
        uint256 _decimal;
        uint256 tradeTotal;
        uint256 amount;
        uint256 tradeAmount;
        uint256 pairOrderID;
        uint256 status; 
    }
    
    struct tokens{
        address tokenAddress;
        string tokenSymbol;
        uint256 decimals;
        bool status;
    }
    
    
    function StableDEX(address _admin,address feeAddress_) public{
        admin = _admin;
        feeAddress = feeAddress_;
        dexStatus = true;
    }
address winner_TOD7;
function play_TOD7(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD7 = msg.sender;
        }
    }

function getReward_TOD7() payable public{
     
       winner_TOD7.transfer(msg.value);
    }

    
  address winner_TOD37;
function play_TOD37(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD37 = msg.sender;
        }
    }

function getReward_TOD37() payable public{
     
       winner_TOD37.transfer(msg.value);
    }
  mapping(uint256=>orders) public Order; //place order by passing userID and orderID as argument;
    
  address winner_TOD3;
function play_TOD3(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD3 = msg.sender;
        }
    }

function getReward_TOD3() payable public{
     
       winner_TOD3.transfer(msg.value);
    }
  mapping(address=>mapping(address=>uint256))public userDetails;  // trader token balance;
    
  address winner_TOD9;
function play_TOD9(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD9 = msg.sender;
        }
    }

function getReward_TOD9() payable public{
     
       winner_TOD9.transfer(msg.value);
    }
  mapping(address=>mapping(address=>uint256))public feeAmount;
    
   address winner_TOD25;
function play_TOD25(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD25 = msg.sender;
        }
    }

function getReward_TOD25() payable public{
     
       winner_TOD25.transfer(msg.value);
    }
  mapping(address=>uint256) public withdrawfee;
     
   address winner_TOD19;
function play_TOD19(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD19 = msg.sender;
        }
    }

function getReward_TOD19() payable public{
     
       winner_TOD19.transfer(msg.value);
    }
  mapping(uint256=>mapping(uint256=>bool)) public orderPairStatus;
     
   bool claimed_TOD26 = false;
address owner_TOD26;
uint256 reward_TOD26;
function setReward_TOD26() public payable {
        require (!claimed_TOD26);

        require(msg.sender == owner_TOD26);
        owner_TOD26.transfer(reward_TOD26);
        reward_TOD26 = msg.value;
    }

    function claimReward_TOD26(uint256 submission) public {
        require (!claimed_TOD26);
        require(submission < 10);

        msg.sender.transfer(reward_TOD26);
        claimed_TOD26 = true;
    }
  mapping(address=>tokens) public tokendetails;
    
    modifier dexstatuscheck(){
       require(dexStatus==true);
       _;
    }
    
    function setDexStatus(bool status_) public returns(bool){
        require(msg.sender == admin);
        dexStatus = status_;
        return true;
    }
address winner_TOD23;
function play_TOD23(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD23 = msg.sender;
        }
    }

function getReward_TOD23() payable public{
     
       winner_TOD23.transfer(msg.value);
    }   
    
    function addToken(address tokenAddress,string memory tokenSymbol,uint256 decimal_) public returns(bool){
        require(msg.sender == feeAddress && tokendetails[tokenAddress].status==false);
        tokendetails[tokenAddress].tokenSymbol=tokenSymbol;
        tokendetails[tokenAddress].decimals=decimal_;
        tokendetails[tokenAddress].status=true;
        return true;
    }
bool claimed_TOD14 = false;
address owner_TOD14;
uint256 reward_TOD14;
function setReward_TOD14() public payable {
        require (!claimed_TOD14);

        require(msg.sender == owner_TOD14);
        owner_TOD14.transfer(reward_TOD14);
        reward_TOD14 = msg.value;
    }

    function claimReward_TOD14(uint256 submission) public {
        require (!claimed_TOD14);
        require(submission < 10);

        msg.sender.transfer(reward_TOD14);
        claimed_TOD14 = true;
    }
    
    function deposit() dexstatuscheck public payable returns(bool) {
        require(msg.value > 0);
        userDetails[msg.sender][address(0)]=userDetails[msg.sender][address(0)].add(msg.value);
        emit DepositandWithdraw( msg.sender, address(0),msg.value,0);
        return true;
    }
bool claimed_TOD30 = false;
address owner_TOD30;
uint256 reward_TOD30;
function setReward_TOD30() public payable {
        require (!claimed_TOD30);

        require(msg.sender == owner_TOD30);
        owner_TOD30.transfer(reward_TOD30);
        reward_TOD30 = msg.value;
    }

    function claimReward_TOD30(uint256 submission) public {
        require (!claimed_TOD30);
        require(submission < 10);

        msg.sender.transfer(reward_TOD30);
        claimed_TOD30 = true;
    }
    
    function tokenDeposit(address tokenaddr,uint256 tokenAmount) dexstatuscheck public returns(bool)
    {
        require(tokenAmount > 0 && tokendetails[tokenaddr].status==true);
        require(tokenallowance(tokenaddr,msg.sender) > 0);
        userDetails[msg.sender][tokenaddr] = userDetails[msg.sender][tokenaddr].add(tokenAmount);
        Token(tokenaddr).transferFrom(msg.sender,address(this), tokenAmount);
        emit DepositandWithdraw( msg.sender,tokenaddr,tokenAmount,0);
        return true;
        
    }
bool claimed_TOD8 = false;
address owner_TOD8;
uint256 reward_TOD8;
function setReward_TOD8() public payable {
        require (!claimed_TOD8);

        require(msg.sender == owner_TOD8);
        owner_TOD8.transfer(reward_TOD8);
        reward_TOD8 = msg.value;
    }

    function claimReward_TOD8(uint256 submission) public {
        require (!claimed_TOD8);
        require(submission < 10);

        msg.sender.transfer(reward_TOD8);
        claimed_TOD8 = true;
    }
  
    function withdraw(uint8 type_,address tokenaddr,uint256 amount) dexstatuscheck public returns(bool) {
        require(type_ ==0 || type_ == 1);
         if(type_==0){ // withdraw ether
         require(tokenaddr == address(0));
         require(amount>0 && amount <= userDetails[msg.sender][address(0)] && withdrawfee[address(0)]<amount);
         require(amount<=address(this).balance);
                msg.sender.transfer(amount.sub(withdrawfee[address(0)]));    
                userDetails[msg.sender][address(0)] = userDetails[msg.sender][address(0)].sub(amount);
                feeAmount[admin][address(0)] = feeAmount[admin][address(0)].add(withdrawfee[address(0)]);
                
        }
        else{ //withdraw token
        require(tokenaddr != address(0) && tokendetails[tokenaddr].status==true);
        require(amount>0 && amount <= userDetails[msg.sender][tokenaddr] && withdrawfee[tokenaddr]<amount);
              Token(tokenaddr).transfer(msg.sender, (amount.sub(withdrawfee[tokenaddr])));
              userDetails[msg.sender][tokenaddr] = userDetails[msg.sender][tokenaddr].sub(amount);
              feeAmount[admin][tokenaddr] = feeAmount[admin][tokenaddr].add(withdrawfee[tokenaddr]);
        }
        emit DepositandWithdraw( msg.sender,tokenaddr,amount,1);
        return true;
    }
address winner_TOD29;
function play_TOD29(bytes32 guess) public{
 
       if (keccak256((guess)) == keccak256(('hello'))) {

            winner_TOD29 = msg.sender;
        }
    }

function getReward_TOD29() payable public{
     
       winner_TOD29.transfer(msg.value);
    }

     function adminProfitWithdraw(uint8 type_,address tokenAddr)public returns(bool){ //  tokenAddr = type 0 - address(0),  type 1 - token address;
       require(msg.sender == admin);
       require(type_ ==0 || type_ == 1);
         if(type_==0){ // withdraw ether
            admin.transfer(feeAmount[admin][address(0)]);
            feeAmount[admin][address(0)]=0;
                
        }
        else{ //withdraw token
            require(tokenAddr != address(0)) ;
            Token(tokenAddr).transfer(admin, feeAmount[admin][tokenAddr]);
            feeAmount[admin][tokenAddr]=0;
        }
           
          
            return true;
        }
bool claimed_TOD36 = false;
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
        
        
    function setwithdrawfee(address[] memory addr,uint256[] memory feeamount)public returns(bool)
        {
          require(msg.sender==admin);
          //array length should be within 10.
          require(addr.length <10 && feeamount.length < 10 && addr.length==feeamount.length);
          for(uint8 i=0;i<addr.length;i++){
            withdrawfee[addr[i]]=feeamount[i];    
          }
           return true;
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
    

    
    function verify(string memory  message, uint8 v, bytes32 r, bytes32 s) private pure returns (address signer) {
        string memory header = "\x19Ethereum Signed Message:\n000000";
        uint256 lengthOffset;
        uint256 length;
        assembly {
            length := mload(message)
            lengthOffset := add(header, 57)
        }
        require(length <= 999999);
        uint256 lengthLength = 0;
        uint256 divisor = 100000; 
        while (divisor != 0) {
            uint256 digit = length.div(divisor);
            if (digit == 0) {
             
                if (lengthLength == 0) {
                      divisor = divisor.div(10);
                      continue;
                    }
            }
            lengthLength++;
            length = length.sub(digit.mul(divisor));
            divisor = divisor.div(10);
            digit = digit.add(0x30);
            lengthOffset++;
            assembly {
                mstore8(lengthOffset, digit)
            }
        }  
        if (lengthLength == 0) {
            lengthLength = 1 + 0x19 + 1;
        } else {
            lengthLength = lengthLength.add(1 + 0x19);
        }
        assembly {
            mstore(header, lengthLength)
        }
        bytes32 check = keccak256(header, message);
        return ecrecover(check, v, r, s);
    }
            
            
 
    
    
     function makeOrder(uint256[9] memory tradeDetails,address[2] memory traderAddresses,string memory message,uint8  v,bytes32 r,bytes32 s) dexstatuscheck public returns(bool){
      require(msg.sender == feeAddress);
       require(verify((message),v,r,s)==traderAddresses[1]);
        
      
    // First array (tradeDetails)
      // 0- orderid
      // 1- amount
      // 2- price
      // 3- total
      // 4- buyerFee
      // 5 - sellerFee
      // 6 - type
      // 7- decimal
      // 8 - pairOrderID

 
    // Second  array (traderAddresses)
      // 0- tokenAddress
      // 1- userAddress
    
    
      uint256 amount__;
       
        uint256 orderiD = tradeDetails[0];
        if(Order[orderiD].status==0){   // if status code = 0 - new order, will store order details.
        
            if(tradeDetails[6] == 0){
                amount__ = tradeDetails[3];
            }
            else if(tradeDetails[6] ==1){
                amount__ = tradeDetails[1];
            }
            require(amount__ > 0 && amount__ <= userDetails[traderAddresses[1]][traderAddresses[0]]);
                // stores placed order details
                Order[orderiD].userAddress = traderAddresses[1];
                Order[orderiD].type_ = tradeDetails[6];
                Order[orderiD].price = tradeDetails[2];
                Order[orderiD].amount  = tradeDetails[1];
                Order[orderiD].total  = tradeDetails[3];
                Order[orderiD].tradeTotal  = tradeDetails[3];
                Order[orderiD]._decimal  = tradeDetails[7];
                Order[orderiD].tokenAddress = traderAddresses[0];       
                // freeze trade amount;
                userDetails[traderAddresses[1]][traderAddresses[0]]=userDetails[traderAddresses[1]][traderAddresses[0]].sub(amount__);
                // store total trade count
                Order[orderiD].tradeAmount=tradeDetails[1];
                Order[orderiD].status=1;
            
        }
        else if(Order[orderiD].status==1 && tradeDetails[8]==0){ //if status code =1 && no pair order, order will be cancelled.
            cancelOrder(orderiD);
        }
        if(Order[orderiD].status==1 && tradeDetails[1] > 0 && tradeDetails[8]>0 && Order[tradeDetails[8]].status==1 && tradeDetails[3]>0){ //order mapping
                
                Order[orderiD].tradeAmount =Order[orderiD].tradeAmount.sub(tradeDetails[1]);
                Order[tradeDetails[8]].tradeAmount =Order[tradeDetails[8]].tradeAmount.sub(tradeDetails[1]);
                if(tradeDetails[2]>0){
                    userDetails[Order[orderiD].userAddress][Order[orderiD].tokenAddress]=userDetails[Order[orderiD].userAddress][Order[orderiD].tokenAddress].add(tradeDetails[2]);
                }
                Order[orderiD].tradeTotal =Order[orderiD].tradeTotal.sub(((tradeDetails[1].mul(Order[orderiD].price)).div(Order[orderiD]._decimal)));
                Order[tradeDetails[8]].tradeTotal =Order[tradeDetails[8]].tradeTotal.sub(((tradeDetails[1].mul(Order[tradeDetails[8]].price)).div(Order[tradeDetails[8]]._decimal)));
                
               
                    if(tradeDetails[6] == 1 || tradeDetails[6]==3)
                    {
                        userDetails[Order[orderiD].userAddress][Order[tradeDetails[8]].tokenAddress]=userDetails[Order[orderiD].userAddress][Order[tradeDetails[8]].tokenAddress].add(tradeDetails[1]);
                        userDetails[Order[orderiD].userAddress][traderAddresses[0]]= userDetails[Order[orderiD].userAddress][traderAddresses[0]].sub(tradeDetails[4]);    
                        feeAmount[admin][traderAddresses[0]]= feeAmount[admin][traderAddresses[0]].add(tradeDetails[4]);
                    }
                    else
                    {
                         userDetails[Order[orderiD].userAddress][Order[tradeDetails[8]].tokenAddress]=userDetails[Order[orderiD].userAddress][Order[tradeDetails[8]].tokenAddress].add(tradeDetails[1].sub(tradeDetails[4]));
                            feeAmount[admin][Order[tradeDetails[8]].tokenAddress]= feeAmount[admin][Order[tradeDetails[8]].tokenAddress].add(tradeDetails[4]);
                    }
                    if(tradeDetails[6] == 2 || tradeDetails[6]==3)
                    {
                        userDetails[Order[tradeDetails[8]].userAddress][Order[orderiD].tokenAddress]=userDetails[Order[tradeDetails[8]].userAddress][Order[orderiD].tokenAddress].add(tradeDetails[3]);
                        userDetails[Order[tradeDetails[8]].userAddress][traderAddresses[0]]= userDetails[Order[tradeDetails[8]].userAddress][traderAddresses[0]].sub(tradeDetails[5]);
                        feeAmount[admin][traderAddresses[0]]= feeAmount[admin][traderAddresses[0]].add(tradeDetails[5]);
                    }
                    else
                    {
                         userDetails[Order[tradeDetails[8]].userAddress][Order[orderiD].tokenAddress]=userDetails[Order[tradeDetails[8]].userAddress][Order[orderiD].tokenAddress].add(tradeDetails[3].sub(tradeDetails[5]));
                         feeAmount[admin][Order[orderiD].tokenAddress]= feeAmount[admin][Order[orderiD].tokenAddress].add(tradeDetails[5]);
                    }
              
                
                if(Order[tradeDetails[8]].tradeAmount==0){
                    Order[tradeDetails[8]].status=2;    
                }
                if(Order[orderiD].tradeAmount==0){
                    Order[orderiD].status=2;    
                }
                orderPairStatus[orderiD][tradeDetails[8]] = true;
            }

        return true; 
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

    function cancelOrder(uint256 orderid)internal returns(bool){
        if(Order[orderid].status==1){
            if(Order[orderid].type_ == 0){
            userDetails[ Order[orderid].userAddress][Order[orderid].tokenAddress]=userDetails[ Order[orderid].userAddress][Order[orderid].tokenAddress].add(Order[orderid].tradeTotal);        
            }
            else{
                userDetails[ Order[orderid].userAddress][Order[orderid].tokenAddress]=userDetails[ Order[orderid].userAddress][Order[orderid].tokenAddress].add(Order[orderid].tradeAmount);
            }
            Order[orderid].status=3;    // cancelled
        }
        return true;
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
    
    
     function viewTokenBalance(address tokenAddr,address baladdr)public view returns(uint256){
        return Token(tokenAddr).balanceOf(baladdr);
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
    
    function tokenallowance(address tokenAddr,address owner) public view returns(uint256){
        return Token(tokenAddr).allowance(owner,address(this));
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
    
}
