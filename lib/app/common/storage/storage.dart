import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app/common/constants.dart';
import 'package:todo_app/app/model/todo.dart';

class Storage {
  const Storage._();

  static final GetStorage _storage = GetStorage();

  static GetStorage get storage => _storage;

  static Future<void> saveValue(String key, dynamic value) =>
      _storage.write(key, value);

  static T? getValue<T>(String key) => _storage.read<T>(key);

  static bool hasData(String key) => _storage.hasData(key);

  static Future<void> removeValue(String key) => _storage.remove(key);

  static Future<void> clearStorage() => _storage.erase();

  static List<Todo> get todoList {
    if (_storage.read(Constants.todosList) != null) {
      final list = _storage.read(Constants.todosList);
      if (list is List<Todo>) return list;

      final mainList = list.map<Todo>((e) {
        return e is Todo ? e : Todo.fromJson(e);
      }).toList();

      return mainList;
    }

    return <Todo>[];
  }

  static set todoList(List<Todo> v) => _storage.write(
        Constants.todosList,
        v,
      );
}
