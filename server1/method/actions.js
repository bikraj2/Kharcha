var User = require('../models/user')
var jwt = require('jwt-simple')
var expense = require('../models/expense')
var config = require('../config/dbconfig')

var functions = {
    addNew: function(req,res ){
        {
            var newUser  =User({
                firstName:req.body.firstName,
                lastName:req.body.lastName,
                middleName:req.body.middleName,
                email:req.body.email,
                username:req.body.username,
                password:req.body.password,
            });
            newUser.save((err,newUser)=>{
                    if(err) {
                        res.json({success:false,msg:'Failed to save'})
                        console.log(err)
                    }
                    else{
                        res.json({success:true,msg:'Successfully saved'})
                    }
            })
        } 
    },
    authenticate: function (req, res) {
        User.findOne({
            username: req.body.username
        }, function (err, user) {
                if (err) throw err
                if (!user) {
                    res.status(403).send({success: false, msg: 'Authentication Failed, User not found'})
                }

                else {
                    user.comparePassword(req.body.password, function (err, isMatch) {
                        if (isMatch && !err) {
                            var token = jwt.encode(user, config.secret)
                            res.json({success: true, token: token,username:req.body.username})
                        }
                        else {
                            return res.status(403).send({success: false, msg: 'Authentication failed, wrong password'})
                        }
                    })
                }
        }
        )
    },
    getinfo:function(req,res) {
        if(req.headers.authorization && req.headers.authorization.split(' ')[0]==="Bearer"){
            var token = req.headers.authorization.split(' ')[1]
            var decodedtoken =jwt.decode(token,config.secret)
            return res.json({success:true,msg:'Hello'+decodedtoken.name})
        }
        else{
            return res.json({success:false,msg:'No Headers'})
        }
    },
    addExpense:function (req,res) {
        var token = req.body.token;
        var decodedtoken =jwt.decode(token,config.secret)
        console.log(decodedtoken)
        console.log(req.body.date);
        var newExpense = expense({
            name:req.body.name,
            amount:req.body.amount,
            category:req.body.category,
            userId:decodedtoken._id,
            date:req.body.date
        })
        newExpense.save((err,newExpense)=>{
            if(err){
                res.json({success:false,msg:err})
            }
            else{
                res.json({success:true,msg:"Expense added successfully"})
            }
        })
    },
    getExpense:function (req,res){
        var token = req.query["token"];
        var decodedtoken =jwt.decode(token,config.secret)
        var userId1 = decodedtoken._id;

        expense
          .find(
            { userId: userId1 },
            { amount: true, category: true, name: true, date: true, _id: false }
          )
          .then((result, next) => {
            res.status(200).json({ ans: result });
          })
          .catch((err) => {});
    
    }
}
module.exports = functions