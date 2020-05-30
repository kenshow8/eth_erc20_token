pragma solidity ^0.5.0;

library SafeMath {
  function sub(uint256 a, uint256 b) internal pure returns (uint256) {
    assert(b <= a);
    return a - b;
  }

  function add(uint256 a, uint256 b) internal pure returns (uint256) {
    uint256 c = a + b;
    assert(c >= a);
    return c;
  }
}

contract KenshowCoin {
  using SafeMath for uint256;

  address public owner = 0xB66d64EF0fACCebFd6F5E10Ece3dcBd3a65B82F1; 
  string public name = "KenshowCoin";
  string public symbol = "KSC";
  uint256 public decimals = 18;
  uint256 public totalSupply = 1000000000000000000000000; // 1,000,000 x 10^18

  event Transfer(address indexed from, address indexed to, uint256 value);
  event Approval(address indexed owner, address indexed spender, uint256 value);

  mapping (address => uint256) balances;
  mapping (address => mapping (address => uint256)) internal allowed;

   constructor() public {
    owner = msg.sender;
    balances[owner] = totalSupply;
  }

  function transfer(address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[msg.sender]);

    balances[msg.sender] = balances[msg.sender].sub(_value);
    balances[_to] = balances[_to].add(_value);
    emit Transfer(msg.sender, _to, _value);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint256 balance) {
    return balances[_owner];
  }

  function transferFrom(address _from, address _to, uint256 _value) public returns (bool) {
    require(_to != address(0));
    require(_value <= balances[_from]);
    require(_value <= allowed[_from][msg.sender]);

    balances[_from] = balances[_from].sub(_value);
    balances[_to] = balances[_to].add(_value);
    allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);
    emit Transfer(_from, _to, _value);
    return true;
  }

  function transferByOwner(address _from, address _to, uint256 _value) public returns (bool){
      require(msg.sender == owner);
      require(_value <= balances[_from]);

      balances[_from] = balances[_from].sub(_value);
      balances[_to] = balances[_to].add(_value);

      emit Transfer(_from, _to, _value);
      return true;
  }

  function approve(address _spender, uint256 _value) public returns (bool) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    return true;
  }

  function allowance(address _owner, address _spender) public view returns (uint256) {
    return allowed[_owner][_spender];
  }
}
