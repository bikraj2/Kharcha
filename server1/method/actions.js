var User = require('../models/user');
var jwt = require('jwt-simple');
var expense = require('../models/expense');
var config = require('../config/dbconfig');
var sendMail = require('./nodeMailer');
const crypto = require('crypto');
var functions = {
  addNew: async (req, res) => {
    {
      try {
        var user = await User.create({
          firstName: req.body.firstName,
          lastName: req.body.lastName,
          middleName: req.body.middleName,
          email: req.body.email,
          username: req.body.username,
          password: req.body.password,
        });
        res.status(200).json({ success: true, msg: 'userCreateda' });
      } catch (e) {
        console.log(e);
        res.status(500).json({ success: true, msg: e });
      }
    }
  },
  authenticate: function (req, res) {
    console.log('hey');
    User.findOne(
      {
        username: req.body.username,
      },
      function (err, user) {
        if (err) throw err;
        if (!user) {
          res.status(403).send({
            success: false,
            msg: 'Authentication Failed, User not found',
          });
        } else {
          console.log(user);
          user.comparePassword(req.body.password, function (err, isMatch) {
            if (isMatch && !err) {
              var token = jwt.encode(user, config.secret);
              res.json({
                success: true,
                token: token,
                username: req.body.username,
              });
            } else {
              return res.status(403).send({
                success: false,
                msg: 'Authentication failed, wrong password',
              });
            }
          });
        }
      }
    );
  },
  getinfo: function (req, res) {
    if (
      req.headers.authorization &&
      req.headers.authorization.split(' ')[0] === 'Bearer'
    ) {
      var token = req.headers.authorization.split(' ')[1];
      var decodedtoken = jwt.decode(token, config.secret);
      return res.json({ success: true, msg: 'Hello' + decodedtoken.name });
    } else {
      return res.json({ success: false, msg: 'No Headers' });
    }
  },
  async changePassword(req, res) {
    var password = req.body.oldPassword;
    var newPassword = req.body.newPassword;
    var token = req.headers.authorization;
    var email = req.headers.email;
    if (token) {
      var decodedtoken = jwt.decode(token, config.secret);
      var userId1 = decodedtoken._id;
    } else {
    }
    
    try {
      var user = userId1
        ? await User.findOne({ _id: userId1 })
        : await User.findOne({ email: email });
        if(user){
      user.comparePassword(password, (err, isMatch) => {
        if (isMatch && !err) {
          user.password = newPassword;
          user.save();
          return res
            .status(200)
            .json({ success: true, msg: 'Password changed.' });
        } else {
          return res.status(403).send({
            success: false,
            msg: 'Authentication failed, wrong password',
          });
        }
      });}else{
        throw Error('Cannot find user Registered with this email.');
      }
    } catch (e) {
      return res.status(400).json({ success: false, msg: e.message });
    }
  },
  async forgotPassword(req, res) {
    try {
      var otp = crypto.randomBytes(5).toString('hex').toUpperCase();
      var email = req.body.email;
      var user = await User.findOne({ email: email });
      if (!user) {
        throw Error('Cannot find user Registered with this email.');
      }
      console.log(user)
      var username = user.username;
      sendMail(email, username, otp);
      res.status(200).json({ success: true, data: { otp: otp, email: email } });
    } catch (e) {
      res.status(400).json({ success: false, msg: e.message });
    }
  },
};

module.exports = functions;
