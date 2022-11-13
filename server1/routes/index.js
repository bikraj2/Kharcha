const express = require('express')
var actions = require('../method/actions')
var expenseActions = require('../method/expense')
const router = express.Router()

router.get('/',(req,res)=>{
    res.send('hello world')
})

router.get('/dashboard',(req,res)=>{
    res.send("YOu are in the dashboard section")
})
//adding new user
//router Post /adduser
router.post('/adduser',actions.addNew)
router.post('/authenticate',actions.authenticate)
router.get('/getinfo',actions.getinfo)
router.get('/helloa',(req,res)=>{
    res.send("hello hi")
})
router.post('/addExpense',expenseActions.addExpense)
router.get('/getExpense',expenseActions.getExpenses)
router.delete('/:id',expenseActions.deleteExpense)
router.post('/income',expenseActions.addIncome)
router.get('/income', expenseActions.getIncome);
router.post('/changePassword',actions.changePassword)
router.post('/forgotPassword', actions.forgotPassword);
module.exports =router 