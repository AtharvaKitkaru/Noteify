import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noteify/views/utils/reused_widgets/app_drawer.dart';
import 'package:noteify/views/utils/reused_widgets/card_home.dart';
import 'package:noteify/views/utils/reused_widgets/dropdown_button.dart';
import 'package:noteify/views/utils/routes/routes.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum Labels { label1, label2 }

class _HomeState extends State<Home> {
  bool _searchBar = false;

  Future _showFilterModal() async {
    switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Select Label'),
            children: <Widget>[
              const Divider(
                color: Colors.black45,
                height: 5,
                thickness: 0.2,
                // indent: 20,
                endIndent: 0,
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Labels.label1);
                },
                child: const Text('Label 1'),
              ),
              SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context, Labels.label2);
                },
                child: const Text('Label 2'),
              ),
            ],
          );
        })) {
      case Labels.label1:
        break;
      case Labels.label2:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // HEADER

        Container(
          padding: EdgeInsets.only(bottom: 5),
          // decoration: BoxDecoration(boxShadow: BoxShadow(color: Colors.grey)),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 0),
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 30, bottom: 0),
                child: Column(children: [
                  Text('NOTEIFY',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                ]),
              ),
              _searchBar
                  ? Container(
                      child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.grey[700],
                              decoration: TextDecoration.none),
                          autofocus: true,
                          decoration: InputDecoration(
                              prefixIcon: IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.black45,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _searchBar = false;
                                  });
                                },
                              ),
                              filled: true,
                              fillColor: Colors.grey[100],
                              contentPadding: EdgeInsets.all(15),
                              border: InputBorder.none,
                              suffixIcon: Icon(
                                Icons.search,
                                color: Colors.black45,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              hintText: 'Search...',
                              hintStyle: TextStyle(color: Colors.grey[800]))),
                    )
                  : Container(
                      padding: EdgeInsets.symmetric(horizontal: 3),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropDownButton(
                                hint: "Sort by",
                                options: ["Name", "Creation Date"]),
                            Container(
                              margin: EdgeInsets.only(right: 7),
                              // padding: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(15)),
                              child: IconButton(
                                disabledColor: Color(0xff68CDAA),
                                focusColor: Color(0xff68CDAA),
                                icon: FaIcon(
                                  FontAwesomeIcons.filter,
                                  size: 18,
                                  color: Color(0xff68CDAA),
                                ),
                                onPressed: () {
                                  _showFilterModal();
                                },
                              ),
                            )
                          ]),
                    ),
            ],
          ),
        ),

        // NOTES LIST

        Expanded(
          child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: 8),
              // width: double.infinity,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: SingleChildScrollView(
                  child: Column(children: [
                HomeCard(),
                HomeCard(),
                HomeCard(),
                HomeCard(),
              ]))),
        ),
      ]),

      //FLOATING ACTION BUTTON

      floatingActionButton: Container(
          height: 65,
          child: FittedBox(
              child: FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, Routes.note),
            backgroundColor: Color(0xff68CDAA),
            mini: false,
            foregroundColor: Colors.white,
            child: Icon(Icons.add),
          ))),

      // BOTTOM NAV BAR

      bottomNavigationBar: BottomAppBar(
        elevation: 20,
        shape: const CircularNotchedRectangle(),
        color: Color(0xffC7FFEC),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(builder: (BuildContext context) {
                return IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              }),
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _searchBar = !_searchBar;
                  });
                },
              ),
            ],
          ),
        ),
      ),

      //DRAWER

      drawer: AppDrawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
