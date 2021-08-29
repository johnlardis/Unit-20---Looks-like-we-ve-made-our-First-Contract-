pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    address payable employee_one; //CEO //0x18116dCEE566a03a30F719C368AA94D44Bc397D7
    address payable employee_two; //CTO //0xd51703a6531CdBE2C2Fb662167c1832F1ACc5225
    address payable employee_three;//BOB //0x4fE92df43eb1c278202509167951Bc052f6fEEf5
    
    // Test addresses:0x18116dCEE566a03a30F719C368AA94D44Bc397D7,0xd51703a6531CdBE2C2Fb662167c1832F1ACc5225,0x4fE92df43eb1c278202509167951Bc052f6fEEf5

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    // Should always return 0! Use this to test your `deposit` function's logic
    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // @TODO: Calculate and transfer the distribution percentage
        // Step 1: Set amount to equal `points` * the number of percentage points for this employee
        // Step 2: Add the `amount` to `total` to keep a running total
        // Step 3: Transfer the `amount` to the employee
        
        //employee_one 
        amount = points * 60;
        total += amount;
        employee_one.transfer(amount);

        // @TODO: Repeat the previous steps for `employee_two` and `employee_three`
        // Your code here!
        
        //employee_two
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);
        
        //employee_three 
        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);
        

        employee_one.transfer(msg.value - total); // ceo gets the remaining wei
    }

    function() external payable {
        deposit();
    }
}
