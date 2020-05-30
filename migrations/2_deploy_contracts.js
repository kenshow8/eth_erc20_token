var KenshowCoin = artifacts.require("./kenshowcoin.sol");

module.exports = function(deployer) {
  deployer.deploy(KenshowCoin);
};
