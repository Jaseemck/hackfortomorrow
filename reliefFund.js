import web3 from "./web3";
import ReliefFund from "./build/ReliefFunds";

export default address => {
    return new web3.eth.Contract(JSON.parse(ReliefFund.interface), address);
};
