// SPDX-License-Identifier: LGPL-3.0-only
pragma solidity >=0.8.0 <0.9.0;

contract Token {
    struct TokenStruct {
        uint256 tokenInt;
        string tokenString;
        bool tokenBool;
    }

    string public constant name = "MyToken";

    mapping(address => TokenStruct) private structMapping;

    event ActionEvent(string value);

    function addStructure(uint256 _tokenInt, string memory _tokenString, bool _tokenBool) public {
        TokenStruct memory tokenStruct = TokenStruct(_tokenInt, _tokenString, _tokenBool);
        structMapping[msg.sender] = tokenStruct;
        emit ActionEvent("add");
    }

    function deleteStructure() public {
        delete structMapping[msg.sender];
        emit ActionEvent("delete");
    }

    
}