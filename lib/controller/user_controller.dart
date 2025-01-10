// controllers/user_controller.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

class UserController with ChangeNotifier {
  List<User> _users = [];
  List<User> filteredUsers = [];

  bool _isLoading = false;
  String _error = '';

  List<User> get users => _users;
  bool get isLoading => _isLoading;
  String get error => _error;


  void filterUsers(String query) {
    if (query.isEmpty) {
      filteredUsers = _users;
    } else {
      filteredUsers = _users
          .where((user) =>
      user.name!.toLowerCase().contains(query.toLowerCase()) ||
          user.email!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }


  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    const String apiUrl = 'https://jsonplaceholder.typicode.com/users';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _users = data.map((json) => User.fromJson(json)).toList();
        filteredUsers = List.from(_users);
        print(_users);

      } else {
        _error = 'Failed to fetch users. Status code: ${response.statusCode}';
      }
    } catch (e) {
      _error = 'Failed to fetch users. Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
