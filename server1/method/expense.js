var User = require('../models/user');
var jwt = require('jwt-simple');
var expense = require('../models/expense');
var config = require('../config/dbconfig');

var functions = {
  addExpense: async (req, res) =>{
    try{
      console.log("hey")
    var token = req.body.token;
    console.log(token)
    var decodedtoken = jwt.decode(token, config.secret);
    var newExpense = expense({
      name: req.body.name,
      amount: req.body.amount,
      category: req.body.category,
      userId: decodedtoken._id,
      
    });
    var userId = decodedtoken._id
    var user = await User.findOne({ _id: userId });
      const budget = parseFloat(+user.budget.toString())
      const expenses = parseFloat(+user.expense.toString())
      const amount = parseFloat(req.body.amount)
      console.log(budget, amount,expenses);
      const updateValue = {
        budget:budget-amount,
        expense:parseFloat(expenses)+amount,
      }
      console.log(updateValue)
      const updateduser = await User.findOneAndUpdate({_id:userId},updateValue)
    const value = newExpense.save()
    res.status(200).json({success:true,msg:"Added Successfully"})
    }catch(e){
      res.status(400).json({success:false,msg:e.message})
    }
  },
  getExpenses: function (req, res) {
    var token = req.query['token'];
    console.log(req.headers);
    var decodedtoken = jwt.decode(token, config.secret);
    var userId1 = decodedtoken._id;
    var { category, date, name } = req.query;
    const queryObject = { userId: userId1 };
    if (category) {
      queryObject.category = category;
    }
    if (date) {
      queryObject.date = date;
    }
    if (name) {
      queryObject.name = name;
    }
    //for Sorting
    var { sortDate, sortAmount } = req.query;
    const sortQuery = { sortDate: -1 };
    if (sortAmount) {
      sortQuery.amount = sortAmount;
    }
    expense
      .find(queryObject, {
        amount: true,
        category: true,
        name: true,
        date: true,
        _id: true,
      })
      .sort(sortQuery)
      .then((result, next) => {
        res.status(200).json({ ans: result });
      })
      .catch((err) => {
        res.status(400).json({ success: false, msg: err.message });
      });
  },
  deleteExpense: async (req, res) => {
    try {
      var token = req.query['token'];
      var decodedtoken = jwt.decode(token, config.secret);
      var userId = decodedtoken._id;
      var expenseId = req.params.id;
      var oneExpense = await expense.findOneAndDelete({ _id: expenseId });
      var user = await User.findOne({ _id: userId });
      const budget = parseFloat(+user.budget.toString())
      const expenses = parseFloat(+user.expense.toString())
      const {amount} = oneExpense
      const updateValue = {
        budget:budget+amount,
        expense:expenses-amount,
      }
      console.log(updateValue)
      const updateduser = await User.findOneAndUpdate({_id:userId},updateValue)
      res
        .status(200)
        .json({ success: true, msg: 'Deleted Succesfully', data: oneExpense });
    } catch (e) {
      res.status(500).json({ success: false, msg: e.message });
    }
  },
  addIncome: async (req, res) => {
    try {
      var token = req.query['token'];
      console.log(token)
      var decodedtoken = jwt.decode(token, config.secret);
      var userId = decodedtoken._id;
      var user = await User.findOne({ _id: userId });
      const budget = parseFloat(+user.budget.toString());
      var amount = parseFloat(req.body.amount)
      const updateValue={
        budget:budget +amount
      }
      console.log(updateValue)
      const updateduser = await User.findByIdAndUpdate(
        { _id: userId },
        updateValue
      );

      res.status(200).json({ success: true, msg: 'Added successfully' });
    } catch (e) {
      res.status(400).json({ success: false, msg: e.message });
    }
  },
};
module.exports = functions;
