import 'package:get/get.dart';

class DemoController extends GetxController {
  var counter = 0.obs;

  var names = ["john" , "micheal"] .obs;

  var females = ["Rahma", "Mai", "Menna"].obs;


  increaseReactiveValue() {
    counter.value++;
  }

  decreaseReactiveValue() => counter.value--;

  void addNewStudent({required String hisName}) {
    names.add(hisName);
  }

  void addHer({required String herName}) {
    females.add(herName);
    update();
  }

  void removeStudent(String name) {
    females.remove(name);
    update();
  }


}
