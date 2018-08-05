pragma solidity ^0.4.7;

contract ReliefFundsAdmin {
    address admin;
    constructor() public {
        admin = msg.sender;
    }
    modifier restricted {
        require(msg.sender == admin);
        _;
    }
    address[] public listOfReliefFunds;
    function createReliefFund(string nameOfFund, string description, string causeForFund) public restricted {
        address newReliefFund = new ReliefFunds(nameOfFund, description, causeForFund, admin);
        listOfReliefFunds.push(newReliefFund);
    }
    
    function getlistOfReliefFunds() public view returns(address[]){
        return listOfReliefFunds;
    }
}

contract ReliefFunds {
    
    struct FundTransferHistory {
        address toAddress;
        uint256 fundsSent;
        string reasonForSendingFunds;
        bool hasTranscationCompleted;
        string linkTrancationVerification;
        uint256 dateOfSentFunds;
    }
    
    struct FundDonatorsHistory {
        address fromAddress;
        uint256 fundsDonated;
        uint dateOfDonation;
    }
    
    FundTransferHistory[] public fundTransferHistory;
    FundDonatorsHistory[] public fundDonatorsHistory;
    string public nameOfFund;
    string public description;
    address public admin;
    string public cause;
    uint256 public donators;
    
    constructor(string name, string des, string causeForFund, address reliefFundAdmin) public {
        admin = reliefFundAdmin;
        description = des;
        cause = causeForFund;
        donators = 0;
        nameOfFund = name;
    }
    
    modifier restricted {
        require(msg.sender ==  admin);
        _;
    }
    function getName() public view returns(string) {
        return nameOfFund;
    }
    function sendFunds(uint256 date, address senderAddress, uint256 fund, string reason) public restricted{
        
        require(fund <=  address(this).balance);
        
        senderAddress.transfer(fund);
        
        FundTransferHistory memory newFundTransfer = FundTransferHistory({
            toAddress: senderAddress,
            fundsSent: fund,
            reasonForSendingFunds: reason,
            hasTranscationCompleted: false,
            linkTrancationVerification: "",
            dateOfSentFunds: date
        });
        
        fundTransferHistory.push(newFundTransfer);
    }
    
    function contributeToReliefFund(uint256 date, uint256 fund) public payable {
        
        FundDonatorsHistory memory newFundDonator = FundDonatorsHistory({
            fromAddress: msg.sender,
            fundsDonated: fund,
            dateOfDonation: date
        });
        
        fundDonatorsHistory.push(newFundDonator);
        donators++;
    }
    
    function updateFundTranscation(string link, uint256 index) public restricted {
        fundTransferHistory[index].linkTrancationVerification = link;
        fundTransferHistory[index].hasTranscationCompleted = true;
    }
    
    function getCurrentBalance() public view returns(uint256) {
        return address(this).balance;
    }

    function getSummary() public view returns (string,string,string,uint256, uint256) {
        return (
            nameOfFund,
            description,
            cause,
            donators,
            this.balance
        );
    }

}
