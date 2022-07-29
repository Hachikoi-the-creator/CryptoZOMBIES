// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Counters.sol";

contract ZombieFactory {
    /** Changes
    1. Added safe counter lib
    2. removed deprecaed return of .push method
     */

    /**TODO:
     1. Instead of using an array use a mapping whit the counter
      */
    using Counters for Counters.Counter;

    uint dnaDigits = 16;
    uint dnaModulus = 10**dnaDigits;
    Counters.Counter private _zombieIndex;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    event NewZombie(uint zombieId, string name, uint dna);

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        emit NewZombie(_zombieIndex.current(), _name, _dna);
        _zombieIndex.increment();
    }

    function _generateRandomDna(string memory _str)
        private
        view
        returns (uint)
    {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomZombie(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }
}
