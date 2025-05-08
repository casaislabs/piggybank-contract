const { expect } = require("chai");

describe("PiggyBank", function () {
  let piggyBank, owner, addr1;

  beforeEach(async function () {
    const PiggyBank = await ethers.getContractFactory("PiggyBank");
    [owner, addr1] = await ethers.getSigners();
    piggyBank = await PiggyBank.deploy();
    await piggyBank.waitForDeployment();
  });

  it("Should accept deposits", async function () {
    await piggyBank.connect(addr1).deposit({ value: 1000 });
    expect(await piggyBank.balances(addr1.address)).to.equal(1000);
  });

  it("Should allow withdrawal", async function () {
    await piggyBank.connect(addr1).deposit({ value: 1000 });
    await piggyBank.connect(addr1).withdraw();
    expect(await piggyBank.balances(addr1.address)).to.equal(0);
  });

  it("Should not allow withdrawal if balance is zero", async function () {
    await expect(piggyBank.connect(addr1).withdraw()).to.be.revertedWith(
      "Withdraw failed: No balance to withdraw"
    );
  });
});