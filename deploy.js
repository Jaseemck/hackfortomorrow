const HDWalletProvider = require("truffle-hdwallet-provider");
const Web3 = require("web3");
const compiledFactory = require("./build/ReliefFundsAdmin.json");

const provider = new HDWalletProvider(
    "illness glass polar alpha power drum public estate vehicle visa excess six",
    "https://rinkeby.infura.io/v3/c4946dbb689b4636ba8f399c1610f281"
);

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log("Attempting to deploy from account: ", accounts[0]);

    const result = await new web3.eth.Contract(
        JSON.parse(compiledFactory.interface)
    )
        .deploy({ data: "0x" + compiledFactory.bytecode })
        .send({ gas: "2000000", from: accounts[0] });

    console.log("Contract deployed to ", result.options.address);
};

deploy();
