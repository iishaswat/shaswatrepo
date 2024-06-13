// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract token {

    // Public variables to store token details
    string public coinName = "shaswat";
    string public coinSymbol = "SST";
    uint public circulatingSupply = 0;

    // Mapping to store balances of addresses
    mapping(address => uint) public accountBalances;

    // Function to issue new tokens
    function issueTokens(address to, uint amount) public {
        circulatingSupply += amount;
        accountBalances[to] += amount;
    }

    // Function to destroy existing tokens
    function destroyTokens(address from, uint amount) public {
        // Ensure the account has enough balance to destroy
        require(accountBalances[from] >= amount, "Insufficient balance to destroy");
        circulatingSupply -= amount;
        accountBalances[from] -= amount;
    }
}
