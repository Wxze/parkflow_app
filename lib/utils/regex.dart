abstract class Regex {
  static const String email =
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$";
  static const String phone =
      r"^\([1-9]{2}\) (?:[2-8]|9[0-9])[0-9]{3}\-[0-9]{4}$";
  static const String cpf = r"^([0-9]){3}\.([0-9]){3}\.([0-9]){3}-([0-9]){2}$";
}
