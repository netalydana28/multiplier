
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IGrothVerifier {
    function verifyProof(
        uint256[2] memory a,
        uint256[2][2] memory b,
        uint256[2] memory c,
        uint256[1] memory input
    ) external view returns (bool);
}

contract SimpleMultiplier {
    address public s_grothVerifierAddress;

    constructor(address grothVerifierAddress) {
        s_grothVerifierAddress = grothVerifierAddress;
    }

    function submitProof(uint256[2] memory a,
        uint256[2][2] memory b,
        uint256[2] memory c,
        uint256[1] memory input) public view returns (bool) {
        bool result = IGrothVerifier(s_grothVerifierAddress).verifyProof(a, b, c, input);
        require(result, "Invalid Proof");
        return true;
    }
}