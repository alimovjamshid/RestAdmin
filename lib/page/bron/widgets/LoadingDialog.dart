import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static final LoadingDialog _singleton = LoadingDialog._internal();
  late BuildContext _context;
  bool isDisplayed = false;

  factory LoadingDialog() {
    return _singleton;
  }

  LoadingDialog._internal();

  show(BuildContext context, {String text = 'Loading...'}) {
    if (isDisplayed) {
      return;
    }
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    showDialog<void>(
        context: context,
        useRootNavigator: true,
        useSafeArea: false,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _context = context;
          isDisplayed = true;
          return WillPopScope(
            onWillPop: () async => false,
            child: Dialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              backgroundColor: Colors.white,
              insetPadding: EdgeInsets.symmetric(
                  horizontal: width / 2 - 30, vertical: height / 2 - 30),
              child: Center(
                child: Container(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            )
          );
        });
  }

  dismiss() {
    if (isDisplayed) {
      Navigator.of(_context).pop();
      isDisplayed = false;
    }
  }
}
