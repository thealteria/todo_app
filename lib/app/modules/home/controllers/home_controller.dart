import 'package:get/get.dart';
import 'package:todo_app/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final RxList _todosList = RxList();
  List<dynamic> get todosList => _todosList;
  set todosList(List<dynamic> dataList) => _todosList.addAll(dataList);

  @override
  void onReady() {
    super.onReady();
  }

  void onAddTodo() {
    Get.toNamed(Routes.ADD_TODO);
  }
}
