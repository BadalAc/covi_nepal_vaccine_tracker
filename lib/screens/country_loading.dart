import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';

class CountryLoading extends StatelessWidget {
  final bool inputTextLoading;

  CountryLoading({@required this.inputTextLoading});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          inputTextLoading
              ? Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4, vertical: 17),
                      child: Container(
                        height: 100,
                        padding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey[300],
                          highlightColor: Colors.grey[100],
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(),
                              ),
                              Container(
                                width: double.infinity,
                                height: 15,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: double.infinity,
                                height: 30,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        elevation: 1,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Container(),
          loadingCard(),
          loadingCard(),
          // loadingChartCard(),
        ],
      ),
    );
  }

  Widget loadingCard() {
    return Card(
      elevation: 1,
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Column(
            children: <Widget>[
              // Container(
              //   width: 100,
              //   height: 20,
              //   color: Colors.white,
              // ),
              Expanded(
                child: Container(),
              ),
              Container(
                width: double.infinity,
                height: 15,
                color: Colors.white,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadingInputCard() {
    return Card(
      elevation: 1,
      child: Container(
        height: 105,
        padding: EdgeInsets.all(24),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300],
          highlightColor: Colors.grey[100],
          child: Container(
            width: double.infinity,
            height: 57,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
