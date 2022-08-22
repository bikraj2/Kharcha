var JwtStartegy = require('passport-jwt').Strategy
var ExtractJwt = require('passport-jwt').ExtractJwt


const passport = require('passport')
var User = require('../models/user')
var config = require('./dbconfig')

module.exports =function (passport) {
    var opts ={}
    opts.secretOrKey = config.secret
    opts.jwtFromRequest = ExtractJwt.fromAuthHeaderWithScheme('jwt')

    passport.use(new JwtStartegy(opts,function (jwt_playload,done){
        User.find({
            id:jwt_playload.id
        },(err,user)=>{
            if(err){
                return done(err,false)
            }
            if(user){
                return done(null,user)
            }
            else{
                return done(null,false)
            }
        })
    }))
}


