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
}
