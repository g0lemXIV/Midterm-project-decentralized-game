pragma solidity ^0.4.17;


contract Croupier {

    address public owner;
    uint256 public card;
    uint256 public totalCard;
    uint256 public casinoFee;
    address[] public players;

    struct Player {
        uint256 amountBet;
        uint256 sumOfCard;
        uint16 countWin;
        uint16 hit;
    }
    mapping(address => Player) public playersInfo;

    constructor(uint256 _fee) public {
        require(_fee > 0);
        owner = msg.sender;
        casinoFee = _fee;
    }
    function kill() public {
        if(msg.sender == owner) selfdestruct(owner);
    }

    function generateCard() public returns (uint) {
        uint256 foo = uint16(keccak256(msg.sender)) % 10 + totalCard;
        card = uint(keccak256((casinoFee + block.number + foo))) % 9 + 2;
        totalCard += card;
        return card;
    }
    function generateBet(uint256 _bet) payable public {
        playersInfo[msg.sender].amountBet = _bet;
        playersInfo[msg.sender].sumOfCard +=  generateCard();
        players.push(msg.sender);
    }

    function bet(uint256 _bet) public {
        require(owner == msg.sender);
        require(playersInfo[msg.sender].sumOfCard <= 21);
        if (playersInfo[msg.sender].hit == 0) {
            for(int8 i = 0; i < 2; i++){
                generateBet(_bet);
                playersInfo[msg.sender].hit++;
            }
        } else {
            generateBet(_bet);
            playersInfo[msg.sender].hit++;
        }
    }

    function countCard() public view returns (uint){
        return totalCard;
    }
///    function stand() {
///        uint256 _amountBet = playersInfo[msg.sender].amountBet;
 ///      uint256 _sumOfCard = playersInfo[msg.sender].sumOfCard;
 ///       }
}
