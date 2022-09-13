pragma solidity >=0.5.0 <0.6.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "./zombiehelper.sol";

contract ZombieAttack is ZombieHelper {
    using Counters for Counters.Counter;

    Counters.Counter private _randNonce;
    uint attackVictoryProbability = 70;

    function _randMod(uint _modulus) internal returns (uint) {
        _randNonce.increment();
        return
            uint(
                keccak256(
                    abi.encodePacked(now, msg.sender, _randNonce.current())
                )
            ) % _modulus;
    }

    function attack(uint _zombieId, uint _targetId)
        external
        ownerOf(_zombieId)
    {
        Zombie storage myZombie = zombies[_zombieId];
        Zombie storage enemyZombie = zombies[_targetId];
        uint rand = _randMod(100);

        if (rand <= attackVictoryProbability) {
            myZombie.winCount++;
            myZombie.level++;
            enemyZombie.lossCount++;
            feedAndMultiply(_zombieId, enemyZombie.dna, "zombie");
        } else {
            myZombie.lossCount++;
            enemyZombie.winCount++;
            _triggerCooldown(myZombie);
        }
    }
}
