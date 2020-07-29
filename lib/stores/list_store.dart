import 'package:mobx/mobx.dart';
import 'package:todomobx/stores/todo_store.dart';

part 'list_store.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  String newTodoTitle = "";

  /*@observable wrong way
  List<String> todoList = [];*/

  @observable
  ObservableList<TodoStore> todoList = ObservableList<TodoStore>();

  @action
  void setNewTodoTitle(String value) => newTodoTitle = value;

  @action
  void addTodo() {
//    todoList = List.from(todoList..add(newTodoTitle)); wrong way
    todoList.insert(0, TodoStore(newTodoTitle));
    newTodoTitle = "";
  }

  @computed
  bool get isFormValid => newTodoTitle.isNotEmpty;
}
