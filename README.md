# Greeting Card Contract with ETH Gifting  

## Description  
Greeting Card Contract allows users to attach a message while sending ETH as a gift. The recipient can later withdraw the gifted ETH.  

## Smart Contract Address  
`0xA24E212Fea06446804224C7aef2e50e4a6387722`  

## Features  
- Send ETH with a personalized message.  
- Store and view received greeting cards.  
- Recipients can withdraw ETH at any time.  

## How to Use  
1. Deploy the contract or interact with the existing one.  
2. Call `sendCard(address _to, string memory _message)` with ETH to send a greeting.  
3. The recipient can call `withdraw()` to collect their ETH.  
4. Use `getReceivedCards(address _recipient)` to view received messages.  

## License  
This project is open-source under the MIT License.  
