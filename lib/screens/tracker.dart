import 'package:covi_nepal/screens/vaccines.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/constants.dart';

import '../screens/country.dart';

class Tracker extends StatefulWidget {
  @override
  _TrackerState createState() => _TrackerState();
}

class _TrackerState extends State<Tracker> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: kPrimaryColor.withOpacity(0.4)),
          backgroundColor: kPrimaryColor,
          bottom: TabBar(
            physics: NeverScrollableScrollPhysics(),
            tabs: [
              Tab(
                  icon: Text(
                'Tracker',
                style: TextStyle(color: Colors.white),
              )),
              Tab(
                icon: FittedBox(
                  child: Text('Vaccines locations',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
          elevation: 0,
          title: Text(
            "Covi Nepal - Tracker",
          ),
          centerTitle: true,
        ),
        body: TabBarView(children: [Country(), VaccinesLocation()]),
      ),
    );
  }
}
