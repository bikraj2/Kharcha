import 'package:demo2/models/expenseList.dart';
import 'package:demo2/screens/charts/graphs_page.dart';
import 'package:demo2/screens/pages/home_screen.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expenses.dart';
import 'home_page.dart';
import 'package:demo2/services/authservices.dart';
import 'package:demo2/token/token.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> with TickerProviderStateMixin {
  String year = "2022";
  String? month;
  TextEditingController _nameController = TextEditingController();
  final years_list = [
    ...List.generate(23, (index) => (2000 + index).toString())
  ];
  String sortAmount = "-1";
  String sortDate = "-1";
  final months_list = [
    "Jan",
    "Feb",
    "March",
    "April",
    "May",
    "June",
    "July",
    "Aug",
    "Sept",
    "October",
    "November",
    "December"
  ];
  String category = "Food";
  DateTime? _startDate = DateTime.now();
  DateTime? _endDate = DateTime.now();
  @override
  void getStartDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((val) => {
              setState(() => {_startDate = val}),
            });
  }

  void getEndDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2018),
            lastDate: DateTime.now())
        .then((val) => {
              setState(() => {_endDate = val}),
            });
  }

  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return HomeScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.arrow_back_ios),
              iconSize: 20,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.colors.basecolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TabBar(
                      indicatorColor: AppTheme.colors.backgroundcolor,
                      indicatorWeight: 5,
                      indicatorSize: TabBarIndicatorSize.label,
                      controller: tabController,
                      labelColor: Colors.white,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(horizontal: 20),
                      tabs: [
                        Tab(
                          child: Container(
                              child: Text(
                            "  Expense  ",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          )),
                        ),
                        Tab(
                          child: Container(
                              child: Text("Date",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))),
                        ),
                        Tab(
                          child: Container(
                              child: Text("Category",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white))),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
                child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              "Search BY name",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: AppTheme.colors.basecolor,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: width / 2,
                                  height: height / 9,
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                    controller: _nameController,
                                    decoration: InputDecoration(
                                      labelText: 'Search by Name',
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () async {
                                    try {
                                      var tk =
                                          await token.storage.read(key: 'jwt');
                                      var value = await AuthService()
                                          .getExpenseByName(tk as String,
                                              _nameController.text as String);
                                      ExpenseList.expenseList = [];
                                      for (Map i in value.data['ans']) {
                                        ExpenseList.expenseList.add(
                                          Expense(
                                              id: i['_id'],
                                              amount: double.parse(
                                                  i['amount'].toString()),
                                              name: i['name'],
                                              date1: DateTime.parse(i['date'])
                                                  .toLocal(),
                                              category: i['category']),
                                        );
                                      }
                                      print(ExpenseList.expenseList);
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  icon: Icon(Icons.search_rounded),
                                ),
                              ],
                            ),
                            Container(
                              child: Column(
                                key: ValueKey(sortAmount),
                                children: [
                                  Text(
                                    "Amount",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: AppTheme.colors.basecolor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  RadioListTile(
                                      title: Text("Ascending"),
                                      value: "-1",
                                      groupValue: sortAmount,
                                      onChanged: (value) {
                                        setState(() {
                                          sortAmount = (value.toString());
                                        });
                                      }),
                                  RadioListTile(
                                      title: Text("Descending"),
                                      value: "1",
                                      groupValue: sortAmount,
                                      onChanged: (value) {
                                        setState(() {
                                          sortAmount = (value.toString());
                                        });
                                      })
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text(
                                    "Date",
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: AppTheme.colors.basecolor,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  RadioListTile(
                                      title: Text("Ascending"),
                                      value: "-1",
                                      groupValue: sortDate,
                                      onChanged: (value) {
                                        setState(() {
                                          sortDate = (value.toString());
                                        });
                                      }),
                                  RadioListTile(
                                      title: Text("Descending"),
                                      value: " 1",
                                      groupValue: sortDate,
                                      onChanged: (value) {
                                        setState(() {
                                          sortDate = (value.toString());
                                        });
                                      })
                                ],
                              ),
                            ),
                            IconButton(
                                onPressed: () async {
                                  try {
                                    var tk =
                                        await token.storage.read(key: 'jwt');
                                    var value = await AuthService()
                                        .getExpenseSorted(
                                            tk as String, sortAmount, sortDate);
                                    print(value);
                                    ExpenseList.expenseList = [];
                                    for (Map i in value.data['ans']) {
                                      ExpenseList.expenseList.add(
                                        Expense(
                                            id: i['_id'],
                                            amount: double.parse(
                                                i['amount'].toString()),
                                            name: i['name'],
                                            date1: DateTime.parse(i['date'])
                                                .toLocal(),
                                            category: i['category']),
                                      );
                                    }
                                    print(ExpenseList.expenseList);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                icon: Icon(Icons.search_rounded))
                          ],
                        ),
                      );
                    }),
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Filter by year",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppTheme.colors.secondarycolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: IconButton(
                                    onPressed: () async {
                                      try {
                                        var tk = await token.storage
                                            .read(key: 'jwt');
                                        var value = await AuthService()
                                            .getYearlyExpense(
                                                tk as String, year as String);
                                        ExpenseList.expenseList = [];
                                        for (Map i in value.data['ans']) {
                                          ExpenseList.expenseList.add(
                                            Expense(
                                                id: i['_id'],
                                                amount: double.parse(
                                                    i['amount'].toString()),
                                                name: i['name'],
                                                date1: DateTime.parse(i['date'])
                                                    .toLocal(),
                                                category: i['category']),
                                          );
                                        }
                                        print(ExpenseList.expenseList);
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    icon: Icon(Icons.search_rounded),
                                    color: AppTheme.colors.secondarycolor,
                                    splashRadius: 22,
                                    hoverColor: AppTheme.colors.basecolor
                                        .withOpacity(0.2),
                                    iconSize: 25,
                                  ),
                                )
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              child: DropdownButton<String>(
                                value: year,
                                iconSize: 20,
                                isDense: false,
                                isExpanded: true,
                                iconEnabledColor: AppTheme.colors.basecolor,
                                icon: Icon(Icons.arrow_drop_down_circle,
                                    color: AppTheme.colors.secondarycolor),
                                items: years_list.map(buildMenuItem).toList(),
                                onChanged: (value) => setState(
                                  () {
                                    this.year = value as String;
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Filter by month",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppTheme.colors.secondarycolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: IconButton(
                                    onPressed: () async {
                                      try {
                                        var tk = await token.storage
                                            .read(key: 'jwt');
                                        var value = await AuthService()
                                            .getMonthlyExpense(tk as String,
                                                "${year == "" ? year : 2022}-${months_list.indexOf(month as String) + 1}");
                                        ExpenseList.expenseList = [];
                                        for (Map i in value.data['ans']) {
                                          ExpenseList.expenseList.add(
                                            Expense(
                                                id: i['_id'],
                                                amount: double.parse(
                                                    i['amount'].toString()),
                                                name: i['name'],
                                                date1: DateTime.parse(i['date'])
                                                    .toLocal(),
                                                category: i['category']),
                                          );
                                        }
                                        print(ExpenseList.expenseList);
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    icon: Icon(Icons.search_rounded),
                                    color: AppTheme.colors.secondarycolor,
                                    iconSize: 25,
                                    splashRadius: 22,
                                    hoverColor: AppTheme.colors.basecolor
                                        .withOpacity(0.2),
                                  ),
                                )
                              ],
                            ),
                            DropdownButton<String>(
                              value: month,
                              iconSize: 20,
                              isDense: false,
                              isExpanded: true,
                              iconEnabledColor: AppTheme.colors.basecolor,
                              icon: Icon(Icons.arrow_drop_down_circle,
                                  color: AppTheme.colors.secondarycolor),
                              items: months_list.map(buildMenuItem).toList(),
                              onChanged: (value2) => setState(() {
                                this.month = value2;
                              }),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "Filter by start and end date",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: AppTheme.colors.secondarycolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: 30,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30)),
                                  child: IconButton(
                                    onPressed: () async {
                                      try {
                                        var tk = await token.storage
                                            .read(key: 'jwt');
                                        var value = await AuthService()
                                            .getExpenseStartTofinish(
                                                tk as String,
                                                _startDate,
                                                _endDate);
                                        print(value);
                                        ExpenseList.expenseList = [];
                                        for (Map i in value.data['ans']) {
                                          ExpenseList.expenseList.add(
                                            Expense(
                                                id: i['_id'],
                                                amount: double.parse(
                                                    i['amount'].toString()),
                                                name: i['name'],
                                                date1: DateTime.parse(i['date'])
                                                    .toLocal(),
                                                category: i['category']),
                                          );
                                        }
                                        print(ExpenseList.expenseList);
                                      } catch (e) {
                                        print(e);
                                      }
                                    },
                                    icon: Icon(Icons.search_rounded),
                                    color: AppTheme.colors.secondarycolor,
                                    iconSize: 25,
                                    splashRadius: 22,
                                    hoverColor: AppTheme.colors.basecolor
                                        .withOpacity(0.2),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: width / 2,
                                  height: height / 9,
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Text(
                                          '${DateFormat.yMMMMd('en_US').format(_startDate as DateTime)}'),
                                      IconButton(
                                          onPressed: () {
                                            getStartDate();
                                          },
                                          icon:
                                              Icon(Icons.date_range_outlined)),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  width: width / 2,
                                  height: height / 9,
                                  padding: EdgeInsets.all(15),
                                  child: Row(
                                    children: [
                                      Text(
                                          '${DateFormat.yMMMMd('en_US').format(_endDate as DateTime)}'),
                                      IconButton(
                                          onPressed: () {
                                            getEndDate();
                                          },
                                          icon:
                                              Icon(Icons.date_range_outlined)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    }),
                ListView.builder(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            Text(
                              "Filter by Category",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 17,
                                  color: AppTheme.colors.basecolor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    category = "Food";
                                  },
                                  icon: Icon(Icons.fastfood),
                                  iconSize: 60,
                                  hoverColor: AppTheme.colors.secondarycolor
                                      .withOpacity(0.3),
                                ),
                                IconButton(
                                  onPressed: () {
                                    category = "Luxury";
                                  },
                                  icon: Icon(Icons.shopping_basket_rounded),
                                  iconSize: 60,
                                  hoverColor: AppTheme.colors.secondarycolor
                                      .withOpacity(0.3),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    category = "Rent";
                                  },
                                  icon: Icon(Icons.house_rounded),
                                  iconSize: 60,
                                  hoverColor: AppTheme.colors.secondarycolor
                                      .withOpacity(0.3),
                                ),
                                IconButton(
                                  onPressed: () {
                                    category = "Health";
                                  },
                                  icon: Icon(Icons.health_and_safety_rounded),
                                  iconSize: 60,
                                  hoverColor: AppTheme.colors.secondarycolor
                                      .withOpacity(0.3),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            IconButton(
                                onPressed: () async {
                                  try {
                                    var tk =
                                        await token.storage.read(key: 'jwt');
                                    var value = await AuthService()
                                        .getExpenseCategory(
                                            tk as String, category as String);
                                    ExpenseList.expenseList = [];
                                    for (Map i in value.data['ans']) {
                                      ExpenseList.expenseList.add(
                                        Expense(
                                            id: i['_id'],
                                            amount: double.parse(
                                                i['amount'].toString()),
                                            name: i['name'],
                                            date1: DateTime.parse(i['date'])
                                                .toLocal(),
                                            category: i['category']),
                                      );
                                    }
                                    print(ExpenseList.expenseList);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                icon: Icon(Icons.search_rounded))
                          ],
                        ),
                      );
                    }),
              ],
            ))
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: AppTheme.colors.secondarycolor),
      ));
}
