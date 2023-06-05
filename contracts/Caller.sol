// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity >=0.8.0 <0.9.0;

contract Caller {
    mapping(uint => bytes32) public resultMap;

    function callSetValue(address _address, uint _candidate, bytes32 _secret) public {
        bytes32 _value = keccak256(abi.encodePacked(_candidate, _secret, msg.sender));
        resultMap[0] = _value;
        (bool success,) = _address.delegatecall(abi.encodeWithSignature("commitVote(bytes32)", _value));
        require(success);
    }
}