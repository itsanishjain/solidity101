require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

const HACKED_ACCOUNT_PRIVATE_KEY = process.env.HACKED_ACCOUNT_PRIVATE_KEY;
const ALCHEMY_MUMBAI_API_KEY_URL = process.env.ALCHEMY_MUMBAI_API_KEY_URL;

const POLYGON_MAINNET_PRIVATE_KEY = process.env.POLYGON_MAINNET_PRIVATE_KEY;
const POLYGONSCAN_KEY = process.env.POLYGONSCAN_KEY;

module.exports = {
  solidity: "0.8.4",
  networks: {
    mumbai: {
      url: ALCHEMY_MUMBAI_API_KEY_URL,
      accounts: [HACKED_ACCOUNT_PRIVATE_KEY],
    },

    // polygon_mainnet: {
    //   url: ALCHEMY_POLYGON_MAINNET_API_KEY_URL,
    //   accounts: [POLYGON_MAINNET_PRIVATE_KEY],
    // },
  },
  etherscan: {
    apiKey: {
      polygonMumbai: POLYGONSCAN_KEY,
    },
  },
};
