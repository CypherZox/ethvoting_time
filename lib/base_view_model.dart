import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';

class MyBaseViewModel extends BaseViewModel {
  //
  BuildContext? viewContext;
  final formKey = GlobalKey<FormState>();
  setNavigator(NavigatorState navigator) {
    notifyListeners();
  }

  @override
  void initialise() {}

  @override
  dispose() {
    super.dispose();
  }

  openWebpageLink(String url) async {}
}
