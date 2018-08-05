import web3 from "./web3";
import ReliefFundsAdmin from "./build/ReliefFundsAdmin";

const instance = new web3.eth.Contract(
    JSON.parse(ReliefFundsAdmin.interface),
    "0xF3d6c19583cD26dC84765a2A9735E687A5938f70"
);

export default instance;
