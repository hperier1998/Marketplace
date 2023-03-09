const MarketplaceToken = artifacts.require("MarketplaceToken");

module.exports = async function(deployer, network, accounts) {
    const customerAddress = "0xc71fDbDE4938D7605528FD998a7a5F5420eAbB6A"; // Customer address to use in the MarketplaceToken.sol constructor
    await deployer.deploy(MarketplaceToken, customerAddress);
  };