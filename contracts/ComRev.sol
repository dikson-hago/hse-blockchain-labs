// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity >=0.8.0 <0.9.0;

contract ComRev {
    uint[] public candidates = 
    [
        1, // rock
        2, // paper
        3 // scissors
    ];

    mapping(address => bytes32) public commits;
    mapping(uint => uint) public votes;
    bool votingStopped;
    uint counter = 0;
    mapping(uint => uint) public counterMap;

    function commitVote(bytes32 _hashedVote) public {
        require(!votingStopped);
        require(commits[msg.sender] == bytes32(0));

        commits[msg.sender] = _hashedVote;

        counter++;
        counterMap[0] = counter;
    }

    // open, who wins
    function revealVoting(uint _candidate, bytes32 _secret) external {
        require(votingStopped);

        bytes32 commit = keccak256(abi.encodePacked(_candidate, _secret, msg.sender));

        require(commit == commits[msg.sender]);

        delete commits[msg.sender];

        votes[_candidate]++;
    }

    function stopVoting() external {
        require(!votingStopped);

        votingStopped = true;
    }
}