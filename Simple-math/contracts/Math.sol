pragma solidity ^0.4.17;

contract MathGame {

      uint256 firstNum = uint(keccak256(block.number % 10, block.timestamp));
      uint256 secNum = uint(keccak256(block.timestamp % 10));
      uint256 score;
      uint minBet = 0.1 ether;
      uint16 level;  // if level is higher than 5 player should be pay more

      struct Player {
            uint256 totalPlay;
            uint256 totalBet;
      }
      mapping (address => Player) public PlayerInfo;

      function Addition(uint _level) public returns(uint _firstNum, uint _secNum, uint _score) {
            // if level is higher than 5 player should be pay more
           // require(_minimumBet >= minBet);
            if(_level >= 5) {
                  firstNum = firstNum % 100;
                  secNum = secNum % 100;
                  score = firstNum + secNum;
            } else {
                  firstNum = firstNum % 10;
                  secNum = secNum % 10;
                  score = firstNum + secNum;
            }
            return (firstNum, secNum, score);
      }
            function Subtraction(uint _level) public returns(uint _firstNum, uint _secNum, uint _score) {
            // if level is higher than 5 player should be pay more
           // require(_minimumBet >= minBet);
            if(_level >= 5) {
                  firstNum = firstNum % 100;
                  secNum = secNum % 100;
                  score = firstNum - secNum;
            } else {
                  firstNum = firstNum % 10;
                  secNum = secNum % 10;
                  if(firstNum <= secNum){
                  score = secNum - firstNum;
                  } else score = firstNum - secNum;

            }
            return (firstNum, secNum, score);
      }
            function Multiplication(uint _level) public returns(uint _firstNum, uint _secNum, uint _score) {
            // if level is higher than 5 player should be pay more
           // require(_minimumBet >= minBet);
            if(_level >= 5) {
                  firstNum = firstNum % 100;
                  secNum = secNum % 100;
                  score = firstNum * secNum;
            } else {
                  firstNum = firstNum % 10;
                  secNum = secNum % 10;
                  score = firstNum * secNum;
            }
            return (firstNum, secNum, score);
      }
            function Divide(uint _level) public returns(uint _firstNum, uint _secNum, uint _score) {
            // if level is higher than 5 player should be pay more
           // require(_minimumBet >= minBet);
            if(_level >= 5) {
                  firstNum = firstNum % 100;
                  secNum = secNum % 100;
                  score = firstNum / secNum;
            } else {
                  firstNum = firstNum % 10;
                  secNum = secNum % 10;
                  score = firstNum / secNum;
            }
            return (firstNum, secNum, score);
      }


}
