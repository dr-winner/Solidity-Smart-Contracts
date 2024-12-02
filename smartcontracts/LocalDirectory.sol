// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

//  This Smart Contract creates a local storage for a local area where residents can be added and 
//  their states are being updated

//  Local directory for the area
//  List of residents in the area
//  Details: Name, age, Live in the area or not? (relate data)
//  One should add their details (tx) -> write
//  If we can add a resident, we want a log of the change in state
//  Check if in our list, a resident is still residing in the area or not
//  Get the total number of residents still residing in the area

contract LocalDirectory {
    struct Person{
        string name;
        uint256 age;
        ResidencyStatus reseidencyStatus;
    }
    enum ResidencyStatus {
        LivesHere,
        MovedAway
    }

    // List all residents
    Person[] public listOfResidents; // state variable -> store on the blockchain

    //events
    event PersonAdded(string name, uint256 age, ResidencyStatus residencyStatus);

    mapping (string => Person) public nameToResidentDetails;

    // Adding a member
    function addNewMember(string memory _name, uint256 _age, ResidencyStatus _residencyStatus) public {
        listOfResidents.push(Person(_name, _age, _residencyStatus)); // adding details to the array
        // mapping the details being added to the array
        nameToResidentDetails[_name] = Person(_name, _age, _residencyStatus);
        emit PersonAdded(_name, _age, _residencyStatus);
    }
}
