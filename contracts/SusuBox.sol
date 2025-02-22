// SPDX-License-Identifier: MIT

//Create a dApp for a bank

pragma solidity ^0.8.4;

contract SusuBox{
    uint private balance;//Can not be modified outside
    uint public trxnId;

 // Read-only function to get balance 
function showBalance() public view returns (uint) {
return balance;
}

    //Transaction Structs
   struct TransactionStruct{
    uint id;
    uint amount;
    uint timeStamp;  
      }

    //Transaction Array
    TransactionStruct [] public transactions;

    // Events for logging deposits and withdrawals
    event Deposit(uint indexed id, uint amount, uint timeStamp);

    //Function to deposit amount
    function deposit(uint amount) public returns (string memory){
        balance += amount;
        trxnId ++ ;
        
        
        string memory message = "Transaction is successful";

        transactions.push(TransactionStruct(trxnId, amount , block.timestamp));
       
        emit Deposit(trxnId, amount, block.timestamp); // Emit eventto log the transaction details

                return  message;
    }

    //Function to withdraw amount
    function withdraw(uint amount) public returns(string memory) {
        require(balance >=amount,"You are broke!");
         balance -= amount;
         trxnId ++ ;

         string memory message = "Transaction is successful";
         transactions.push(TransactionStruct(trxnId, amount , block.timestamp)); //log the transaction in array
        return  message;
     }

 // Function to get all transactions
    function getAllTransactions() public view returns (TransactionStruct[] memory) {
        return transactions;
    }


}

