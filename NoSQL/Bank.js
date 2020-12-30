const mongoose = require('mongoose');
const Schema = mongoose.Schema;

// Create a Schema and a Model
const BranchSchema = new Schema({
	Branch_id: Number
	Address: String,
    Name: String,
	Accounts: [AccountSchema],
	Loans: [LoanSchema]
});

const BankSchema = new Schema({
	Bank_code: Number,
	Name: String,
	Address: String,
	branches: [BranchSchema]
});

const AccountSchema = new Schema({
	Account_No: Number,
	Acc_Type: Number,
	Balance: Number,
	Customers: [CustomerSchema]
});

const LoanSchema = new Schema({
	Loan_id: Number,
	Loan_type: Number,
	Amount: Number,
	Customers: [CustomerSchema]
	
});

const CustomerSchema = new Schema({
	Customer_id: Number,
	Name: String,
	Phone: Number,
	Address: String,
	Loans: [LoanSchema],
	Accounts: [AccountSchema]
});
