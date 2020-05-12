/**
 *Submitted for verification at Etherscan.io on 2019-09-22
*/

pragma solidity ^0.5.0;

interface IERC20 {
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

library SafeMath {
  function mul(uint256 a, uint256 b) internal pure returns (uint256) {
    if (a == 0) {
      return 0;
    }
    uint256 c = a * b;
    assert(c / a == b);
    return c;
  }

  function div(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a / b;
    return c;
  }

  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }

  function ceil(uint256 a, uint256 m) internal pure returns (uint256) {
    uint256 c = add(a,m);
    uint256 d = sub(c,1);
    return mul(div(d,m),m);
  }
}

contract Ownable {
    address public owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


   constructor() public {
      owner = msg.sender;
    }
    
 
    modifier onlyOwner() {
      require(msg.sender == owner);
      _;
    }
    

    function transferOwnership(address newOwner) public onlyOwner {
      require(newOwner != address(0));
      emit OwnershipTransferred(owner, newOwner);
      owner = newOwner;
    }
    
    
}

contract ERC20Detailed is IERC20 {

  string private _name;
  string private _symbol;
  uint8 private _decimals;

  constructor(string memory name, string memory symbol, uint8 decimals) public {
    _name = name;
    _symbol = symbol;
    _decimals = decimals;
  }

  function name() public view returns(string memory) {
    return _name;
  }

  function symbol() public view returns(string memory) {
    return _symbol;
  }

  function decimals() public view returns(uint8) {
    return _decimals;
  }
}

contract DanPanCoin is ERC20Detailed , Ownable{

  using SafeMath for uint256;
  mapping (address => uint256) private _balances;
  mapping (address => mapping (address => uint256)) private _allowed;

  string constant tokenName = "Dan Pan Coin";
  string constant tokenSymbol = "DPC";
  uint8  constant tokenDecimals = 2;
  uint256 _totalSupply = 10000000000;
  uint256 public basePercent = 100;
  uint256 public dpPercent = 5;
  address public DanPanAddress = msg.sender;
  event DanPanPercentChanged(uint256 previousDanPanPercent, uint256 newDanPanPercent);
  event DanPanAddressChanged(address indexed previousDanPan, address indexed newDanPan);
  event WhitelistFrom(address _addr, bool _whitelisted);
  event WhitelistTo(address _addr, bool _whitelisted);
  
   // fee whitelist
    mapping(address => bool) public whitelistFrom;
    mapping(address => bool) public whitelistTo;

  constructor() public ERC20Detailed(tokenName, tokenSymbol, tokenDecimals) {
    _mint(msg.sender, _totalSupply);
  }

  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }

  function balanceOf(address owner) public view returns (uint256) {
    return _balances[owner];
  }

  function allowance(address owner, address spender) public view returns (uint256) {
    return _allowed[owner][spender];
  }

  function findOnePercent(uint256 value) public view returns (uint256)  {
    uint256 roundValue = value.ceil(basePercent);
    uint256 onePercent = roundValue.mul(basePercent).div(10000);
    return onePercent;
  }
  function findDPPercent(uint256 value) public view returns (uint256)  {
    uint256 roundValue = value.ceil(basePercent);
    uint256 DPPercent = roundValue.mul(basePercent).div(10000).mul(dpPercent);
    return DPPercent;
  }

  function transfer(address to, uint256 value) public returns (bool) {
    require(value <= _balances[msg.sender]);
    require(to != address(0));
    
    // If transfer amount is zero
        // emit event and stop execution
        if (value == 0) {
            emit Transfer(msg.sender, to, 0);
            return true;
        }

   
    
    // Calculate receiver balance
        // initial receive is full value
        uint256 tokensToTransfer = value;
        uint256 tokensToBurn = 0;
        uint256 tokensToDanPan = 0;
    
    
    // Change sender balance
        _balances[msg.sender] = _balances[msg.sender].sub(value);

        // If the transaction is not whitelisted
        // calculate fees
        if (!_isWhitelisted(msg.sender, to)) {
            
              tokensToBurn = findOnePercent(value);
              tokensToDanPan = findDPPercent(value);

            // Subtract fees from receiver amount
             tokensToTransfer = value.sub(tokensToBurn).sub(tokensToDanPan);

            // Burn tokens
            _totalSupply = _totalSupply.sub(tokensToBurn);
            emit Transfer(msg.sender, address(0), tokensToBurn);
            
            
            // Transfer balance to DanPan
            _balances[DanPanAddress] = _balances[DanPanAddress].add(tokensToDanPan);
            emit Transfer(msg.sender, DanPanAddress, tokensToDanPan);

        }

        // Sanity checks
        // no tokens where created
        assert(tokensToBurn.add(tokensToTransfer).add(tokensToDanPan) == value);

        // Add tokens to receiver
        _balances[to] = _balances[to].add(tokensToTransfer);
        emit Transfer(msg.sender, to, tokensToTransfer);
    
    
    
    return true;
  }

  function multiTransfer(address[] memory receivers, uint256[] memory amounts) public {
    for (uint256 i = 0; i < receivers.length; i++) {
      transfer(receivers[i], amounts[i]);
    }
  }

  function approve(address spender, uint256 value) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = value;
    emit Approval(msg.sender, spender, value);
    return true;
  }

 function transferFrom(address from, address to, uint256 value) public returns (bool) {
    require(value <= _balances[from]);
    require(value <= _allowed[from][msg.sender]);
    require(to != address(0));
    
    // If transfer amount is zero
        // emit event and stop execution
        if (value == 0) {
            emit Transfer(from, to, 0);
            return true;
        }

    // Calculate receiver balance
        // initial receive is full value
        uint256 tokensToTransfer = value;
        uint256 tokensToBurn = 0;
        uint256 tokensToDanPan = 0;
    
    // Change sender balance
        _balances[from] = _balances[from].sub(value);

        // If the transaction is not whitelisted
        // calculate fees
        if (!_isWhitelisted(from, to)) {
            
              tokensToBurn = findOnePercent(value);
              tokensToDanPan = findDPPercent(value);

            // Subtract fees from receiver amount
             tokensToTransfer = value.sub(tokensToBurn).sub(tokensToDanPan);

            // Burn tokens
            _totalSupply = _totalSupply.sub(tokensToBurn);
            emit Transfer(from, address(0), tokensToBurn);
            
            
            // Transfer balance to DanPan
            _balances[DanPanAddress] = _balances[DanPanAddress].add(tokensToDanPan);
           emit Transfer(from, DanPanAddress, tokensToDanPan);

        }

        // Sanity checks
        // no tokens where created
        assert(tokensToBurn.add(tokensToTransfer).add(tokensToDanPan) == value);

        // Add tokens to receiver
        _balances[to] = _balances[to].add(tokensToTransfer);
	_allowed[from][msg.sender] = _allowed[from][msg.sender].sub(value);
        emit Transfer(from, to, tokensToTransfer);
    
    
    
    return true;
  }

  function increaseAllowance(address spender, uint256 addedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].add(addedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function decreaseAllowance(address spender, uint256 subtractedValue) public returns (bool) {
    require(spender != address(0));
    _allowed[msg.sender][spender] = (_allowed[msg.sender][spender].sub(subtractedValue));
    emit Approval(msg.sender, spender, _allowed[msg.sender][spender]);
    return true;
  }

  function _mint(address account, uint256 amount) internal {
    require(amount != 0);
    _balances[account] = _balances[account].add(amount);
    emit Transfer(address(0), account, amount);
  }

  function burn(uint256 amount) external {
    _burn(msg.sender, amount);
  }

  function _burn(address account, uint256 amount) internal {
    require(amount != 0);
    require(amount <= _balances[account]);
    _totalSupply = _totalSupply.sub(amount);
    _balances[account] = _balances[account].sub(amount);
    emit Transfer(account, address(0), amount);
  }

  function burnFrom(address account, uint256 amount) external {
    require(amount <= _allowed[account][msg.sender]);
    _allowed[account][msg.sender] = _allowed[account][msg.sender].sub(amount);
    _burn(account, amount);
  }
  
  function NewDanPanAddress(address newDanPanaddress) external onlyOwner {
    require(newDanPanaddress != address(0));
      emit DanPanAddressChanged(DanPanAddress, newDanPanaddress);
      DanPanAddress = newDanPanaddress;
  }

  function NewDanPanPercent(uint256 newDanPanpercent) external onlyOwner {
      emit DanPanPercentChanged(dpPercent, newDanPanpercent);
      dpPercent = newDanPanpercent;
  }
  
  function _isWhitelisted(address _from, address _to) internal view returns (bool) {
      
        return whitelistFrom[_from]||whitelistTo[_to];
}
    
    function setWhitelistedTo(address _addr, bool _whitelisted) external onlyOwner {
        emit WhitelistTo(_addr, _whitelisted);
        whitelistTo[_addr] = _whitelisted;
    }

    function setWhitelistedFrom(address _addr, bool _whitelisted) external onlyOwner {
        emit WhitelistFrom(_addr, _whitelisted);
        whitelistFrom[_addr] = _whitelisted;
}
}
