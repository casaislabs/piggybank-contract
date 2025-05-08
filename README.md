# PiggyBank Smart Contract

The PiggyBank smart contract is a robust and secure Ethereum-based solution designed for efficiently managing ETH deposits and withdrawals. It integrates key features to ensure a seamless user experience while leveraging best practices such as OpenZeppelin's `ReentrancyGuard` for enhanced security. This contract is deployed on the Sepolia testnet, offering a safe environment for testing and interacting with the Ethereum blockchain.

## 📍 Contract Address (Sepolia Testnet)

The deployed contract on Sepolia testnet can be found at the following address:

`0xc810bf49064D3eC2e1583a143948eD35f11d3E30`

---

## 🛠️ Repository Information

The source code for the PiggyBank smart contract can be found on GitHub:

[GitHub - PiggyBank Contract](https://github.com/martinperezcss/piggybank-contract)

---

## 🚀 Features

- **ETH Deposit**: Securely deposit ETH into the contract.  
- **ETH Withdrawal**: Withdraw deposited ETH, protected against reentrancy attacks.  
- **Balance Query**: Easily query the contract to check your balance.  
- **Direct ETH Reception**: Handle ETH transfers without needing a direct function call.  
- **Reentrancy Protection**: Prevent reentrancy attacks by using OpenZeppelin’s `ReentrancyGuard`.

---

## 🧑‍💻 Technical Specifications

- **Solidity Version**: `0.8.28`  
- **Network**: Sepolia Testnet  
- **Smart Contract Libraries**:  
    - OpenZeppelin Contracts (`v5.3.0`)  
    - Hardhat (`v2.24.0`)  
    - dotenv (`v16.5.0`)  

---

## 📦 Prerequisites

To successfully interact with this project, ensure that the following dependencies are installed:

- **Node.js** (v16 or higher recommended)  
- **NPM** or **Yarn** (package managers)  
- **Hardhat** (installed as a project dependency)  

---

## ⚙️ Setup Instructions

1. **Clone the repository**:  
     ```bash
     git clone https://github.com/martinperezcss/piggybank-contract.git
     cd piggybank-contract
     ```

2. **Install dependencies**:  
     ```bash
     npm install
     ```

3. **Configure Environment Variables**:  
     Create a `.env` file in the root directory and add the following variables:  
     ```ini
     ALCHEMY_API_URL=<Your_Alchemy_API_URL>
     PRIVATE_KEY=<Your_Wallet_Private_Key>
     ETHERSCAN_API_KEY=<Your_Etherscan_API_Key>
     ```
     Replace `<Your_Alchemy_API_URL>`, `<Your_Wallet_Private_Key>`, and `<Your_Etherscan_API_Key>` with your actual values.

4. **Compile the Smart Contract**:  
     ```bash
     npx hardhat compile
     ```

5. **Deploy the Contract to Sepolia Testnet**:  
     ```bash
     npx hardhat run scripts/deploy.js --network sepolia
     ```
     Ensure your `.env` file contains the correct Alchemy API URL, Private Key, and Etherscan API Key for deployment.

6. **Verify Contract on Etherscan**:  
     ```bash
     npx hardhat verify --network sepolia <Your_Contract_Address>
     ```
     Replace `<Your_Contract_Address>` with the actual address where the contract is deployed.

---

## 💡 Usage

### Deposit ETH
To deposit ETH into the PiggyBank contract, use the `deposit()` function or send ETH directly to the contract address. The contract will automatically process the deposit and emit a `Deposited` event.

### Withdraw ETH
Withdraw your deposited ETH securely using the `withdraw()` function. The function is protected against reentrancy attacks using OpenZeppelin’s `ReentrancyGuard`.

### Check Balance
Query your balance in the contract using the `getBalanceOf(address user)` function.

### Direct ETH Reception
The contract accepts ETH directly through the `receive()` function, automatically handling and storing the funds.

### Reentrancy Protection
The `withdraw()` function is protected against reentrancy attacks using OpenZeppelin’s `ReentrancyGuard` modifier.

---

## 🧪 Testing the Contract

Run the provided test cases using Hardhat:  
```bash
npx hardhat test
```

This will execute the test suite located in the `test/` directory to ensure the contract behaves as expected.

---

## 📂 File Structure

```bash
.
├── contracts/
│   └── PiggyBank.sol       # Smart contract source code
├── test/
│   └── PiggyBank.js        # Contract test cases
├── scripts/
│   └── deploy.js           # Deployment script
├── hardhat.config.js       # Hardhat configuration file
├── .env                    # Environment variables
├── package.json            # Project dependencies and scripts
└── README.md               # Project documentation
```

---

## 🔐 Security Features

- **Reentrancy Protection**: The `withdraw()` function is protected against reentrancy attacks using OpenZeppelin's `ReentrancyGuard` modifier.  
- **Fallback Handling**: The contract contains a `fallback()` function to reject unexpected calls safely.

---

## 📜 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

---

## 📝 Acknowledgements

- **OpenZeppelin** for providing secure, reusable smart contract libraries such as `ReentrancyGuard`.  
- **Hardhat** for offering a powerful development environment for Ethereum smart contracts.  
- **Alchemy** for providing a reliable API for interacting with the Ethereum blockchain.  
- **Etherscan** for offering tools to verify and track smart contracts on the Ethereum network.  