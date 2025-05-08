// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/// @title PiggyBank - A simple contract to securely deposit and withdraw ETH
contract PiggyBank is ReentrancyGuard {
    // Mapping to store balances for each address (user)
    mapping(address => uint256) public balances;

    // Events to log deposits and withdrawals
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    /// @notice Deposit ETH into the contract
    function deposit() public payable {
        require(msg.value > 0, "Deposit failed: No ETH sent");
        // Gas optimization: unchecked increment
        unchecked {
            balances[msg.sender] += msg.value;
        }
        emit Deposited(msg.sender, msg.value);
    }

    /// @notice Receive ETH sent directly to the contract
    receive() external payable {
        deposit();
    }

    /// @notice Fallback function to handle unexpected calls
    fallback() external payable {
        revert("Fallback: Function does not exist");
    }

    /// @notice Withdraw the sender's balance, protected against reentrancy
    function withdraw() public nonReentrant {
        uint256 amount = balances[msg.sender];
        require(amount > 0, "Withdraw failed: No balance to withdraw");
        balances[msg.sender] = 0;
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "Withdraw failed: Unable to send Ether");
        emit Withdrawn(msg.sender, amount);
    }

    /// @notice Get the balance of any user
    function getBalanceOf(address user) public view returns (uint256) {
        return balances[user];
    }
}