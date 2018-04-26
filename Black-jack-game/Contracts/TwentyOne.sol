pragma solidity ^0.4.17;


contract Croupier {

    address public owner;
    uint256 public card;
    uint256 public totalCard;
    uint256 public casinoFee;
    address[] public players;

    // initalize struct of all casino Players
    struct Player {
        uint256 amountBet;
        uint256 sumOfCard;
        uint16 countWin;
        uint16 hit;
    }
    event Table (address player,
                    uint playerCard,
                    uint bet);

    // Map address and Players
    mapping(address => Player) public playersInfo;


    function Croupier (uint256 _fee) public {
        require(_fee > 0);
        owner = msg.sender;
        casinoFee = _fee;
        emit Table(owner, totalCard, casinoFee);

    }

    // Check is player exist ( it will be use in near future )
    function checkPlayerExists(address player) public constant returns(bool){
        for(uint256 i = 0; i < players.length; i++){
            if(players[i] == player) return true;
        }
    }

    // Generate card in casino (it could be unsecure)
    function generateCard(address _address, uint256 _bet) private returns (uint) {
        uint256 foo = uint16(keccak256(_address)) % 10 + _bet;
        card = uint(keccak256((casinoFee + block.number + foo))) % 9 + 2;
        return card;
    }

    // Write players bet and sum of card on the blockchain
    function generateBet(uint256 _bet, address _player) private {
        if (playersInfo[_player].hit > 0){
        playersInfo[_player].amountBet += _bet;
    } else playersInfo[_player].amountBet == _bet;

        playersInfo[_player].sumOfCard +=  generateCard(_player, _bet);
        playersInfo[_player].hit++;

    }

    // Take croupier bet ( It is unsafety and cost gas function but now it's private which prevent fraud )
    function croupierBet() public returns (uint) {
        require(owner == msg.sender);
        totalCard += generateCard(owner, casinoFee);
        Table(owner, totalCard, casinoFee);
        return totalCard;
    }

    function countCard() public view returns (uint){
        return totalCard;
    }

    // Bet an amount of ether if player bet first time it will generate two cards else only one
    function bet(uint256 _bet) public payable {
        if (playersInfo[msg.sender].hit == 0) {
            for(uint8 i = 0; i < 2; i++){
                generateBet(_bet, msg.sender);
                totalCard += generateCard(owner, casinoFee);
            }
        } else {
            generateBet(_bet, msg.sender);
        }
        Table(msg.sender, playersInfo[msg.sender].sumOfCard, playersInfo[msg.sender].amountBet);
        players.push(msg.sender);
    }

    // It will be function wchich can be use in future to count time and distribute prize by winners
    function distributedTime() public pure returns(uint) {
        return 5 * 1 minutes;
    }

    function resetData() private {
      players.length = 0; // Delete all the players array
      totalCard = 0;
      }

    // Check casino budget if player check card and win pay him bet multiply by two
    function casinoBudget(address _player) public view returns (bool) {
        uint256 _playerBet = playersInfo[_player].sumOfCard;
        if (casinoFee >= (_playerBet * 2)) return true;
    }

    // Check card
    function stand(address _player) public{
        uint256 _sumOfPlayerCard = playersInfo[_player].sumOfCard;
        uint256 _amountOfBet = playersInfo[_player].amountBet;
        // Is it game rules are met
        require(_sumOfPlayerCard <= 21);
        // Chceck casino budget is higher than sum of player bet
        require(casinoBudget(_player));
        if (_sumOfPlayerCard > totalCard) {
            _player.transfer(casinoFee);
            resetData();
        } else {
            owner.transfer(_amountOfBet);
            resetData();
       }
    }
}
