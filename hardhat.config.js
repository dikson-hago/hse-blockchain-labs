require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-waffle");
require("dotenv").config()


module.exports = {
  solidity: "0.8.18",
  // networks: {
  //   sepolia: {
  //     url: `https://sepolia.infura.io/v3/${process.env.INFURA_API_KEY}`,
  //     accounts: [process.env.SEPOLIA_PRIVATE_KEY]
  //   }
  // }
};
