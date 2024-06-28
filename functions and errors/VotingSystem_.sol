// SPDX-License-Identifier: MIT

pragma solidity 0.8.25;

contract VotingSystem_{
    struct Voteproposal {
        string descp;
        uint countVote_;
        bool exists;
    }

    mapping(uint=>Voteproposal) public proposals;
    mapping(address=>mapping(uint=>bool)) public hasVoted;

    uint public Countproposal;
    address public Owner;

    constructor() {
        Owner = msg.sender;
    }

    modifier OwnerOnly() {
        require(msg.sender == Owner, "Only owner has the right to call this action.");
        _;   
    }
    function newProposal(string memory descp) public OwnerOnly {
        proposals[Countproposal] = Voteproposal ({
            descp : descp,
            countVote_ : 0,
            exists: true
        });
        Countproposal++;
    }
    function checkvote(uint Id) public view returns(bool) {
        require(Id < Countproposal, "Propopsal of a voter does not exist.");
        require(!hasVoted[msg.sender][Id],"You have already voted");

        return true;
    }
    function recordVotes(uint Id) public {
        require(checkvote(Id), "Invalid");
        Voteproposal storage Proposal = proposals[Id];
        Proposal.countVote_++;
        hasVoted[msg.sender][Id] = true;
    }
    function getVotecount(uint Id) public view returns(uint) {
        require(Id < Countproposal);
        return proposals[Id].countVote_;
    }
    function removeProposal(uint Id) public OwnerOnly {
        require(Id < Countproposal);
        Voteproposal storage Proposal = proposals[Id];
        require(Proposal.exists);
        Proposal.exists = false;
    }
    function Votingcloses() public OwnerOnly {
        assert(Countproposal == 0);
        payable(Owner).transfer(address(this).balance);
    }
    receive() external payable{
        revert("These voter contracts does not accepts the transactions/payments.");
    } 
}
