import 'package:bootcamp_starter/models/link.dart';
import 'package:bootcamp_starter/prefs/shared_pref_controller.dart';
import 'package:flutter/cupertino.dart';
import '../api/api_response.dart';
import '../api/link_reprository.dart';


class LinkProvider extends ChangeNotifier {
  late LinkRepository _linkRepository;
   late Link link;
   String username = SharedPreController().getValueFor<String?>(key: Prefkeys.name.name) ?? '' ;

  late ApiResponse<List<Link>> _linkList;

  ApiResponse<List<Link>> get linkList => _linkList;

  LinkProvider() {
    _linkRepository = LinkRepository();
    fetchLinkList();
  }

  fetchLinkList() async {
    _linkList = ApiResponse.loading('Fetching Links');
    notifyListeners();
    try {
      List<Link> links =  await _linkRepository.fetchLinkList();
      _linkList = ApiResponse.completed(links);
      notifyListeners();
    } catch (e) {
      _linkList = ApiResponse.error(e.toString());
      notifyListeners();
      print(_linkList);
    }
  }

  addNewLink (Link link)async{
    await _linkRepository.addLink(title: link.title!, link: link.link!, username: username, isActive: '1');
    _linkList.data?.add(link);
    fetchLinkList();
     notifyListeners();

  }

  updateLink (Link link)async{
    await _linkRepository.updateLink(id: link.id, title: link.title!, link: link.link!, username: username, isActive: '1');
    // int? index = _linkList.data?.indexWhere((element) => element.id == link.id);
    // if (index != -1) {
    //   _linkList.data?[index!] = link;

    // }
    fetchLinkList();
    notifyListeners();


  }

   deleteLink (Link link)async{
  await _linkRepository.deleteLink(id: link.id);
  _linkList.data!.remove(link);
    fetchLinkList();
    notifyListeners();


  }
}