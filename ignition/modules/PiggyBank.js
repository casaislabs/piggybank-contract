const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("PiggyBankModule", (m) => {
  const piggyBank = m.contract("PiggyBank");
  return { piggyBank };
});