const HDWalletProvider = require('@truffle/hdwallet-provider');
const API_KEY = 'H_C4K0F1wGmbBXoCz-uU2yxplVZCu_Vf'; 
const RINKEBY_RPC_URL = `https://eth-mainnet.g.alchemy.com/v2/H_C4K0F1wGmbBXoCz-uU2yxplVZCu_Vf${API_KEY}`; 

module.exports = {
  networks: {
    rinkeby: {
      provider: function() {
        return new HDWalletProvider({
          mnemonic: 'le chat de la mere simone', 
          providerOrUrl: RINKEBY_RPC_URL
        });
      },
      network_id: 4,
      gas: 5500000,
      gasPrice: 10000000000 
    }
  },
  compilers: {
    solc: {
      version: "0.8.0"
    }
  }
};