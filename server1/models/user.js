var mongoose = require('mongoose')
var Schema = mongoose.Schema;
var bcrypt = require('bcrypt')
var userSchema1 = new Schema({
   firstName:{
    type:String,
    require:true,
   },
   middleName:{
    type:String,
    require:true,
   },
   lastName:{
    type:String,
    require:true,
   },
   email:{
    type:String,
    require:true,
   },
   username:{
    type:String,
    require:true,
   },
   password:{
    type:String,
    require:true,
   },
    


})

userSchema1.pre('save',function (next){
    var user = this;
    if (this.isModified('password') || this.isNew){
        bcrypt.genSalt(10,(err,salt) => {
            if(err){
                return next(err)
            }
        console.log(user.password)
           bcrypt.hash(user.password,salt, (err,hash)=>{
            if (err){
                return next(err)
            }
            user.password  = hash;
            next()
           })
        })
    }
    else {
        return next()
    }
})
userSchema1.methods.comparePassword = function (passw,cb){
    bcrypt.compare(passw,this.password,(err,isMatch)=>{
        if(err){
            return cb(err)
        }
        cb(null,isMatch)
    })
}
module.exports = mongoose.model('User', userSchema1)