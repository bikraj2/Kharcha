var mongoose = require('mongoose')
var Schema = mongoose.Schema;
var expense = new Schema({
    name:{
        type:String,
        require:true,
    },
    amount:{
        type:Number,
        require:true,
    },
    category:{
        type:String,
        require:true
    },
    date:{
        type:Date,
        default:Date.now()
    },
    userId:{
        required:true,
        type:String
    },
})
module.exports=mongoose.model("expense",expense)