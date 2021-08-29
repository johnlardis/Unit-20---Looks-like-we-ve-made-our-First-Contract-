pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address payable employee_one; //0x18116dCEE566a03a30F719C368AA94D44Bc397D7
    address payable employee_two; //0xd51703a6531CdBE2C2Fb662167c1832F1ACc5225
    address payable employee_three; //0x4fE92df43eb1c278202509167951Bc052f6fEEf5
    
    // Test addresses:0x18116dCEE566a03a30F719C368AA94D44Bc397D7,0xd51703a6531CdBE2C2Fb662167c1832F1ACc5225,0x4fE92df43eb1c278202509167951Bc052f6fEEf5
    constructor(address payable _one, address payable _two, address payable _three) public {
        
        
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value/3; 

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount); 
        employee_three.transfer(amount); 
        
        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        msg.sender.transfer(msg.value-amount*3);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        // Your code here!
    }
}
