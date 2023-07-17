import 'package:flutter/material.dart';
import '../api/api_response.dart';
import '../models/followers_model.dart';
import '../api/FollowerRepository.dart';

class FollowerProvider extends ChangeNotifier {
  late FollowerRepository _FollowerRepository;
  FollowerResponse? followerResponse;

  late ApiResponse<List<Following?>> _FollowingList;
  late ApiResponse<List<Followers?>> _FollowersList;

  ApiResponse<List<Following?>> get FollowingList => _FollowingList;
   ApiResponse<List<Followers?>> get FollowersList => _FollowersList;

  FollowerProvider() {
    _FollowerRepository = FollowerRepository();
    fetchFollowing();

  }
  fetchFollowing() async {
    _FollowingList = ApiResponse.loading('Fetching Following');
    _FollowersList = ApiResponse.loading('Fetching followers');
    notifyListeners();
    try {
      followerResponse = await _FollowerRepository.fetchFollower();
      _FollowingList = ApiResponse.completed(followerResponse!.following);
      _FollowersList = ApiResponse.completed(followerResponse!.followers);
      notifyListeners();
    } catch (e) {
      _FollowingList = ApiResponse.error(e.toString());
      _FollowersList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }


  addFollower()async{
    _FollowersList = ApiResponse.loading('Fetching followrs');
    notifyListeners();
    try {
      List<Followers>? followers = await _FollowerRepository.addFollower();
      _FollowersList = ApiResponse.completed(followers);
      notifyListeners();
    } catch (e) {
      _FollowersList = ApiResponse.error(e.toString());
      notifyListeners();
    }
  }}




