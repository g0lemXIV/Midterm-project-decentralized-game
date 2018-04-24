pragma solidity ^0.4.19;

contract Operation {
      
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
            } else {o
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
