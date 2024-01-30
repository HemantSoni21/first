import 'package:flutter/material.dart';

class DataState with ChangeNotifier {
  int? language;
  setLanguage(int value) {
    language = value;
    notifyListeners();
  }

  bool isShipper = false;
  bool isTransporter = false;
  toggleShipperSelected() {
    isShipper = true;
    isTransporter = false;
    notifyListeners();
  }

  toggeleTransporterSelected() {
    isShipper = false;
    isTransporter = true;
    notifyListeners();
  }

  int? phoneNumber;
  bool isPhoneScreenLoading = false;
  bool isOTPScreenLoading = false;
}
