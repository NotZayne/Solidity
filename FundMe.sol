//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    mapping(address => uint256) public addressToAmountFunded;
    
    address public Owner;

    constructor() {
        Owner = msg.sender;
    }




    function Fund() public payable {
        //$10 is the minimum for example
        uint256 minimumUSD = 10 * 10 ** 18; //18 digits*
        //1 Gwei < $10
        require(getConversionRate(msg.value) >= minimumUSD, "Please send $10 or more");
        addressToAmountFunded[msg.sender] += msg.value;
        //Conversion rate

    }

    function getVersion() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return priceFeed.version();
    }

    function getPrice() public view returns(uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 answer,,,) = priceFeed.latestRoundData();
        //ETH/USD rate in 18 digits
        return uint256(answer * 10000000000); 
    }
    //converts Wei,Gwei,eth amount to USD by line 30
    //When inputting 1 gwei the output = 0.00001777721219840
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        return ethAmountInUsd;
    }

    modifier onlyOwner {
        require(msg.sender == Owner);
        _;
    }
    
    function Withdraw() public onlyOwner payable {
        //We only want the contract owner to use this functions
        //require msg.sender = owner
        payable(msg.sender).transfer(address(this).balance);
    }


}
