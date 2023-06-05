// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity >=0.8.0 <0.9.0;

contract ComRev {
    uint[] public candidates = 
    [
        1, // rock
        2, // paper
        3  // scissors
    ];

    mapping(address => bytes32) public commits;
    address address1 = address(0);
    uint choice1 = 0;
    address address2 = address(0);
    uint choice2 = 0;
    
    function commitVote(bytes32 _hashedVote) external {
        require(address2 == address(0));
        require(commits[msg.sender] == bytes32(0));

        if(address1 == address(0)) {
            address1 = msg.sender;
        }
        else {
            address2 = msg.sender;
        }

        commits[msg.sender] = _hashedVote;
    }

    // open, who wins
    function revealVoting(uint _candidate, bytes32 _secret) external {
        require(address2 != address(0));

        bytes32 commit = keccak256(abi.encodePacked(_candidate, _secret, msg.sender));

        require(commit == commits[msg.sender]);

        delete commits[msg.sender];

        if(address1 == msg.sender) {
            choice1 = _candidate;
        }
        else {
            choice2 = _candidate;
        }
    }

    function getWinner() external view returns(address) {
        require(choice2 != 0);

        if(choice1 == choice2) {
            return address(0);
        }
        else if (choice1 > choice2 || choice1 == 1 && choice2 == 3) {
            return address1;
        }
        return address2;
    }

    function clearGame() external {
        if(address1 != address(0)) {
            delete commits[address1];
        }
        if(address2 != address(0)) {
            delete commits[address2];
        }
        address1 = address(0);
        address2 = address(0);
        choice1 = 0;
        choice2 = 0;
    }
}