import 'package:flutter/cupertino.dart';
import 'package:movies_app/features/home/data/model/home_data.dart';
import 'package:movies_app/features/home/data/repository/home_repository.dart';

class HomeProvider extends ChangeNotifier{

  final HomeRepository _homeRepository;

  HomeProvider(HomeRepository homeRepository): _homeRepository = homeRepository;

  List<HomeData> homeDataList = [];

  int selectedIndex = 0;

  getHomeData() {
    homeDataList = _homeRepository.getHomeScreens();
    notifyListeners();
  }

  updateSelectedIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }


}