require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

const ALCHEMY_POLYGON_MAINNET_API_KEY_URL = process.env.ALCHEMY_POLYGON_MAINNET_API_KEY_URL;

const POLYGON_MAINNET_PRIVATE_KEY = process.env.POLYGON_MAINNET_PRIVATE_KEY;
const POLYGONSCAN_KEY = process.env.POLYGONSCAN_KEY;

module.exports = {
  solidity: "0.8.4",
  networks: {
    polygon_mainnet: {
      url: ALCHEMY_POLYGON_MAINNET_API_KEY_URL,
      accounts: [POLYGON_MAINNET_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: {
      polygon: POLYGONSCAN_KEY,
    },
  },
};
