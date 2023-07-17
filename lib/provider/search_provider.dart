import 'package:flutter/cupertino.dart';

import '../api/api_response.dart';
import '../models/search_model.dart';
import '../api/search_repository.dart';


class SearchProvider extends ChangeNotifier {
  late SearchRepository _searchRepository;

  late ApiResponse<List<User>> _userList;

  ApiResponse<List<User>> get userList => _userList;

  SearchProvider() {
    _searchRepository = SearchRepository();
    searchUserName();
  }

  searchUserName() async {
    _userList = ApiResponse.loading('search');
    notifyListeners();
    try {
      List<User> users = await _searchRepository.searchByName();
      _userList = ApiResponse.completed(users);
      notifyListeners();
    } catch (e) {
      _userList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }
}
