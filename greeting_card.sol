// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GreetingCard {
    struct Card {
        address sender;
        string message;
        uint256 amount;
    }

    mapping(address => Card[]) private receivedCards;
    mapping(address => uint256) private balances;

    event CardSent(address indexed from, address indexed to, uint256 amount, string message);
    event Withdrawn(address indexed recipient, uint256 amount);

    function sendCard(address _to, string memory _message) public payable {
        require(msg.value > 0, "Must send some ETH");

        receivedCards[_to].push(Card({
            sender: msg.sender,
            message: _message,
            amount: msg.value
        }));

        balances[_to] += msg.value;

        emit CardSent(msg.sender, _to, msg.value, _message);
    }

    function withdraw() public {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "No balance to withdraw");

        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit Withdrawn(msg.sender, amount);
    }

    function getReceivedCards(address _recipient) public view returns (Card[] memory) {
        return receivedCards[_recipient];
    }
}
