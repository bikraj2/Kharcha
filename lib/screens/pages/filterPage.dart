import 'package:demo2/screens/charts/graphs_page.dart';
import 'package:demo2/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FilterPage extends StatefulWidget {
  FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> with TickerProviderStateMixin {
  String? value;

  String? categories = "";
  final years_list = ['2020', '2021', '2022', '2023'];
  String? category = "";
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
    "November",
    "December"
  ];
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 40,
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppTheme.colors.basecolor,
                ),
                controller: tabController,
                labelColor: Colors.black,
                isScrollable: true,
                labelPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    child: Container(
                        child: Text(
                      "Date",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    )),
                  ),
                  Tab(
                    child: Container(
                        child: Text("Category",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black))),
                  ),
                  Tab(
                    child: Container(
                        child: Text("Expenses",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.black))),
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
                            "Filter by year",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17,
                                color: AppTheme.colors.basecolor,
                                fontWeight: FontWeight.w600),
                          ),
                          DropdownButton<String>(
                            value: value,
                            iconSize: 20,
                            isDense: false,
                            isExpanded: true,
                            iconEnabledColor: AppTheme.colors.basecolor,
                            icon: Icon(Icons.arrow_drop_down_circle,
                                color: AppTheme.colors.secondarycolor),
                            items: years_list.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.value = value;
                            }),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Text(
                            "Filter by month",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17,
                                color: AppTheme.colors.basecolor,
                                fontWeight: FontWeight.w600),
                          ),
                          DropdownButton<String>(
                            value: value,
                            iconSize: 20,
                            isDense: false,
                            isExpanded: true,
                            iconEnabledColor: AppTheme.colors.basecolor,
                            icon: Icon(Icons.arrow_drop_down_circle,
                                color: AppTheme.colors.secondarycolor),
                            items: months_list.map(buildMenuItem).toList(),
                            onChanged: (value) => setState(() {
                              this.value = value;
                            }),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Filter by start and end date",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17,
                                color: AppTheme.colors.basecolor,
                                fontWeight: FontWeight.w600),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: width / 2.5,
                                  height: height / 9,
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        labelText: 'Start Date ',
                                        border: OutlineInputBorder(),
                                      ))),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: width / 2.5,
                                  height: height / 9,
                                  padding: EdgeInsets.all(15),
                                  child: TextField(
                                      controller: _dateController,
                                      decoration: InputDecoration(
                                        labelText: ' End Date',
                                        border: OutlineInputBorder(),
                                      ))),
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
                            height: 30,
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
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.fastfood),
                                iconSize: 60,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.shopping_basket_rounded),
                                iconSize: 60,
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
                                onPressed: () {},
                                icon: Icon(Icons.house_rounded),
                                iconSize: 60,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.health_and_safety_rounded),
                                iconSize: 60,
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
                                onPressed: () {},
                                icon: Icon(Icons.laptop_mac_rounded),
                                iconSize: 60,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.soap_rounded),
                                iconSize: 60,
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
                            height: 30,
                          ),
                          Text(
                            "Filter by Expenses",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17,
                                color: AppTheme.colors.basecolor,
                                fontWeight: FontWeight.w600),
                          ),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              width: width / 2,
                              height: height / 9,
                              padding: EdgeInsets.all(15),
                              child: TextField(
                                  controller: _dateController,
                                  decoration: InputDecoration(
                                    labelText: 'Sort the Expenses by Category ',
                                    border: OutlineInputBorder(),
                                  ))),
                        ],
                      ),
                    );
                  }),
            ],
          ))
        ],
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
