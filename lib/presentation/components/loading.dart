import 'package:flutter/material.dart';

class Loading with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> delay() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));

    _isLoading = false;
    notifyListeners();
  }
} // 3초간 로딩 화면 표시
