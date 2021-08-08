# Self Evaluation

### Funtionality
#### Grade:
- Above Expectations

#### Reasons:
1) Cracking method fully implemented
2) Command line interface fully implemented with full interaction pattern functionality intact

### Object Oriented Programming
#### Grade:
- Above Expectations

#### Reasons:
1) No class is over 75 lines long
2) Smallest classes are those handling CLI funtionality and inherit from a FileWorker super-class handling the bulk of the methods
3) Encyrption and Decrytption classes inherit from a Cypher super-class holding all but the one line difference between the two functionalities
4) Cracked class inherits from Decryption class as it is a decryptor
5) Cracked class only holds methods responsible for operating the process of trying keys until the correct one is found
6) KeyMaker module is used for randomly generating and formatting keys

### Ruby Convention and Mechanics
#### Grade:
- Above Expectations
#### Reasons:
1) Classes, methods, and variables are all well named to convey purpose and held data
2) Enumerables are chosen based on their efficiency and their purpose is well understood
3) All code is properly syntaxed and indented
4) Longest method is 10 lines long including 'def' and 'end'

### Test Driven Development
#### Grade:
- Meets Expectations
#### Reasons:
1) 100% coverage
2) All methods are tested at the unit and integration level
3) Stubs are used to handle randomness and varying inputs (current date)
4) Tests and code are occasionally in same commit

### Version Control
#### Grade:
- Meets Expectation
#### Reasons:
1) 70+ commits
2) 10+ pull requests
3) Branches used for all features
