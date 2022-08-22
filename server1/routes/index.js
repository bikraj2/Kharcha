const express = require('express')
var actions = require('../method/actions')
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
router.post('/addExpense',actions.addExpense)
router.get('/getExpense',actions.getExpense)

module.exports =router 