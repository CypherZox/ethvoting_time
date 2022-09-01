// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
pragma experimental ABIEncoderV2;

contract Election {
    // Read/write candidate
    string public candidate;
    mapping(uint => Candidate) public candidates;
    uint256 public candidatesCount;
    mapping(address => bool) public voters;
    string public message;

    struct Candidate {
        string name;
        uint256 votes;
        uint id;
    }
    error votedBefore();

    // Constructor
    constructor() {
        addCandidate("Jake");
        addCandidate("Finn");
    }

    function update(string memory newMessage) public {
        message = newMessage;
    }

    event votedEvent(uint256 indexed _candidateId);

    function addCandidate(string memory candidateName) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(
            candidateName,
            0,
            candidatesCount
        );
    }

    modifier uniqueVote() {
        if (voters[msg.sender]) revert votedBefore();
        _;
    }

    function vote(uint256 candidateId) public uniqueVote returns (uint256) {
        if (candidateId > 0 && candidateId <= candidatesCount) {
            voters[msg.sender] = true;
            candidates[candidateId].votes++;
            emit votedEvent(candidateId);
            return candidates[candidateId].votes;
        } else {
            revert();
        }
    }

    // function getCandidates()
    //     public
    //     view
    //     returns (mapping(uint =>  Candidate ) memory)
    // {
    //     return candidates;
    // }
}
