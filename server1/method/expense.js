var User = require('../models/user');
var jwt = require('jwt-simple');
var expense = require('../models/expense');
var config = require('../config/dbconfig');

var functions = {
  addExpense: function (req, res) {
    var token = req.query('token');
    var decodedtoken = jwt.decode(token, config.secret);
    console.log(decodedtoken);
    console.log(req.body.date);
    var newExpense = expense({
      name: req.body.name,
      amount: req.body.amount,
      category: req.body.category,
      userId: decodedtoken._id,
      date: req.body.date.split('T')[0],
    });
    newExpense.save((err, newExpense) => {
      if (err) {
        res.json({ success: false, msg: err });
      } else {
        res.json({ success: true, msg: 'Expense added successfully' });
      }
    });
  },
  getExpenses: function (req, res) {
    var token = req.headers.authorization;
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
    const sortQuery = {sortDate:-1}
    if(sortAmount){
      sortQuery.amount=sortAmount
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
      var expenseId = req.params.id;
      var oneExpense = await expense.findOneAndDelete({ _id: expenseId });
      res
        .status(200)
        .json({ success: true, msg: 'Deleted Succesfully', data: oneExpense });
    } catch (e) {
      res.status(500).json({ success: false, msg: e });
    }
  },
};
module.exports = functions;
