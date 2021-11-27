import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList _todosList = RxList();
  List<dynamic> get todosList => _todosList;
  set todosList(List<dynamic> dataList) => _todosList.addAll(dataList);

  @override
  void onReady() {
    super.onReady();
  }

  void onAddTodo() {
    
  }
}
