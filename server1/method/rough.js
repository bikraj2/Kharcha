var date = new Date("2022")
var lastMonth = new Date(date.getFullYear(),12,0)
console.log(lastMonth.setDate(lastMonth.getDate()+1))
console.log(lastMonth)
