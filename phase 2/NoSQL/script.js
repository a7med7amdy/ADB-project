//import performance
//switch to Bank_database
use Bank_database
//-------query1---------//
var before = new Date()
//join three collections Bank, Branch and account 
db.Branch.aggregate([{ "$lookup": {   "localField": "Bank_code",   "from": "Bank",   "foreignField": "Bank_code",   "as": "Bank" } },{"$lookup":{"localField":"Branch_id", "from":"Account", "foreignField":"Bno","as":"Account"}}])
var after = new Date()
execution_mills = after - before
print("the execution time of first query = ",execution_mills, "milliseconds")


//-------query2-------// 
before = new Date()
db.Availed_by.aggregate([{ "$lookup": {   "localField": "Cust_no",   "from": "Customer",   "foreignField": "Customer_ID",   "as": "Customer" } },{"$lookup":{"localField":"Loan_no", "from":"Loan", "foreignField":"Loan_id","as":"Loan"}},{$project:{"Customer.Name":1, "Loan.Bno":1, "Loan.Amount":1 }}])
after = new Date()
execution_mills = after - before
print("the execution time of second query = ",execution_mills," milliseconds")

//--------query3------//
before = new Date()
db.Hold_by.aggregate([{ "$lookup": {   "localField": "Cust_no",   "from": "Customer",   "foreignField": "Customer_ID",   "as": "Customer" } },{"$lookup":{"localField":"Acc_No", "from":"Account", "foreignField":"Account_No","as":"Account"}},{$project:{"Account.Account_No":1, "Account.Balance":1, "Customer.Phone Number":1 }}])
after = new Date()
execution_mills = after - before
print("the execution time of third query = ",execution_mills, "milliseconds")
