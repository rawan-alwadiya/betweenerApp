import 'package:flutter/material.dart';


import '../../../../api/api_response.dart';
import '../models/follwers_model.dart';
import '../repo/FollwerRepository.dart';

class FollwerProvider extends ChangeNotifier {
  late FollwerRepository _FollwerRepository;
  FollwerResponse? follwerResponse;

  late ApiResponse<List<Following>> _FollowingList;
  late ApiResponse<List<Followers>> _FollowersList;

  ApiResponse<List<Following>> get FollowingList => _FollowingList;
   ApiResponse<List<Followers>> get FollowersList => _FollowersList;

  FollwerProvider() {
    _FollwerRepository = FollwerRepository();
   fetchtFollowing();
    // fetchtFollwer();
  }
  fetchtFollowing() async {
    _FollowingList = ApiResponse.loading('Fetching Follwing');
    notifyListeners();
    try {
      follwerResponse = await _FollwerRepository.fetchFollwer();
      _FollowingList = ApiResponse.completed(follwerResponse!.following);
      _FollowersList = ApiResponse.completed(follwerResponse!.followers);
      notifyListeners();
    } catch (e) {
      _FollowingList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }


  addFollwer()async{
    _FollowersList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<Followers>? followers = await _FollwerRepository.addFollwer();
      _FollowersList = ApiResponse.completed(followers);
      notifyListeners();
    } catch (e) {
      _FollowersList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }}

//true only follwing
//   fetchtFollowing() async {
//     _FollowingList = ApiResponse.loading('Fetching Follwing');
//     notifyListeners();
//     try {
//       List<Following>? following = await _FollwerRepository.fetchFollwing();
//       _FollowingList = ApiResponse.completed(following);
//       notifyListeners();
//     } catch (e) {
//       _FollowingList = ApiResponse.error(e.toString());
//       notifyListeners();
//     }
//   }


