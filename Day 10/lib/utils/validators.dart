class Validators {
  Validators._();

  static String? validateNationalId(String? id) {
    if (id == null) return "";
    if (id.length != 14) {
      return "National id must be 14 digits";
    }
    return null;

    // if(id)
  }

  static String? validateInput(String? input,[int digits = 6]) {
    if (input == null) return "Invalid input";
    if (input.length <= digits) {
      return "Name must be $digits digits";
    }
    return null;

    // if(id)
  }
}
