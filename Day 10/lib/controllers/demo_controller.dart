import 'package:get/get.dart';

class DemoController extends GetxController {
  var counter = 0.obs;

  var names = ["Ahmed", "Samira", "badr"].obs;

  var females = ["Martina", "Rokkia", "Alaa"].obs;
  // bool isLogin = false; //bool
  // RxBool isMarried = false.obs; //RxBool
  // Map<String, int> values = {"ahmed": 13, "samir": 14, "esraa": 15};
  // var grades = {"ahmed": 13, "samir": 14, "esraa": 15}.obs;

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
