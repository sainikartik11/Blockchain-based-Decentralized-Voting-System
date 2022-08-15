pragma solidity >=0.4.21 <0.8.7;

contract Election{
    //  candidate structure
    struct Candidate{
      uint id;
      string name;
      uint voteCount;
    }
    // storing accounts that have voted
    mapping(address => bool) public voters;
   // store a candiate 
   // fetch candidate 
    mapping(uint => Candidate) public candidates;
    
   uint public candidatesCount;
    event votedEvent(uint indexed_candidateId);
    constructor() public{
      addCandidate("Modi Ji");
      addCandidate("Rahul Gandhi");
    }

    function addCandidate (string memory _name) private {
      candidatesCount++;
      candidates[candidatesCount] = Candidate(candidatesCount,_name,0);
    }
    
    function vote (uint _candidateId) public {
      // address has not voted before
      require(!voters[msg.sender]);
      // voting for valid candidate
      require(_candidateId>0 && _candidateId<=candidatesCount);
      // update the voter has voted
      voters[msg.sender] = true;
      //update the votes of candidate
      candidates[_candidateId].voteCount ++;

      //trigger voted event
      emit votedEvent(_candidateId);
       
    }

}