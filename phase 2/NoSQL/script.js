//switch to Bank_database
use Bank_database
//-------query1---------//

//join three collections Bank, Branch and account 
db.Branch.aggregate([{ "$lookup": {   "localField": "Bank_code",   "from": "Bank",   "foreignField": "Bank_code",   "as": "Bank" } },{"$lookup":{"localField":"Branch_id", "from":"Account", "foreignField":"Bno","as":"Account"}}])




//-------query2-------// 
db.Availed_by.aggregate([{ "$lookup": {   "localField": "Cust_no",   "from": "Customer",   "foreignField": "Customer_ID",   "as": "Customer" } },{"$lookup":{"localField":"Loan_no", "from":"Loan", "foreignField":"Loan_id","as":"Loan"}},{$project:{"Customer.Name":1, "Loan.Bno":1, "Loan.Amount":1 }}])



//--------query3------//
db.Hold_by.aggregate([{ "$lookup": {   "localField": "Cust_no",   "from": "Customer",   "foreignField": "Customer_ID",   "as": "Customer" } },{"$lookup":{"localField":"Acc_No", "from":"Account", "foreignField":"Account_No","as":"Account"}},{$project:{"Account.Account_No":1, "Account.Balance":1, "Customer.Phone Number":1 }}])