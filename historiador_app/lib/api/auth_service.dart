import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  String? _token;
  String? _email;
  String? _baseUrl;

  String? get token => _token;
  String? get email => _email;
  String? get baseUrl => _baseUrl;

  void setBaseUrl(String url) {
    _baseUrl = url;
  }

  void login(String token, String email) {
    _token = token;
    _email = email;
    notifyListeners();
  }

  void logout() {
    _token = null;
    _email = null;
    notifyListeners();
  }

  bool get isAuthenticated => _token != null;
}