# Table of contents
- [Table of contents](#table-of-contents)
  - [**TODO**](#todo)
  - [Chapter 1](#chapter-1)
  - [Chapter 2](#chapter-2)
  - [Chapter 3](#chapter-3)
  - [Chapter 4](#chapter-4)
  - [Updates](#updates)
    - [ownable import](#ownable-import)
    - [kitty contract interface](#kitty-contract-interface)
    - [_generateRandomDna](#_generaterandomdna)
    - [_createZombie](#_createzombie)
    - [counters lib](#counters-lib)
- [Jobs](#jobs)
  - [Blockchain Headhunter](#blockchain-headhunter)
  - [crypto-job](#crypto-job)
  - [crypto-job list](#crypto-job-list)
  - [crypto-jobs](#crypto-jobs)

## **TODO**
- Find a way to combine 2 numbers len-18 and get another number len-18 in return

## Chapter 1
- Generation of some pseudo-random zombie DNA
- zombie factory, mapping(addres=>amount of zombies it has) & mapping(uint=>ZombieStructWhitAllProps)

## Chapter 2
- Eat humans behaviour
- Handles changes in DNA when eating a cat (changes 99 as last numbers)
- update the interface stuff (constructor)

## Chapter 3
- Attack coldown(22hrs), cat data getter w/interface
- onlyOwner import

## Chapter 4
- Handle logic for when a zombie fights another(if attacker wins +1 zombie, if it looses +1 lose battles)
- handle some cool logic that takes into account the stats of the zombie, and gives a weighted random number (get random number then use the num-num/10000000)


## Updates
### ownable import
```c#
import "@openzeppelin/contracts/access/Ownable.sol";

contract Zomething is Ownable {}
```

### kitty contract interface
```c#
{
  KittyInterface kittyContract;

  constructor(address _catAddress) {
    kittyContract = KittyInterface(_catAddress);
  }

  function updateKittyContract(address _catAddress) onlyOwner {
    kittyContract = KittyInterface(_catAddress);
  }
}
```

### _generateRandomDna
**New way to remove decimals**

```c#
uint dnaDigits = 16;
uint dnaModulus = 10**dnaDigits;

function _generateRandomDna(string memory _str)
    private
    view
    returns (uint)
{
    uint rand = uint(keccak256(abi.encodePacked(_str)));
    return rand / dnaModulus;
}
```

### _createZombie
**Get zombie id at creation**
```c#
function _createZombie(string memory _name, uint _dna) internal {
    zombies.push(Zombie(_name, _dna, 1, uint32(now + cooldownTime), 0, 0));
    uint id = zombies.length - 1;
    
    zombieToOwner[id] = msg.sender;
    ownerZombieCount[msg.sender]++;
    emit NewZombie(id, _name, _dna);
}
```


### counters lib
```c#
import "@openzeppelin/contracts/utils/Counters.sol";

contract myCheatCodeForGTA {
  using Counters for Counters.Counter;

  Counters.Counter private _tokenIdCounter;
}

```
```c#```
```c#```



# Jobs
## Blockchain Headhunter
Explore open positions & apply on our website - https://bit.ly/3jIlL77

## crypto-job
Website
http://crypto-job.com/

## crypto-job list
Website
https://cryptojobslist.com

## crypto-jobs
Website
https://crypto.jobs/

