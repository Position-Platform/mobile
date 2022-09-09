/*
 * @Author: Boris Gautier 
 * @Date: 2022-01-09 08:58:30 
 * @Last Modified by: Boris Gautier
 * @Last Modified time: 2022-01-10 05:34:39
 */

class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  /* static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );*/

  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    // return _passwordRegExp.hasMatch(password);
    return password.length >= 6 ? true : false;
  }

  static bool isValidTelephone(String telephone) {
    return telephone.length == 9 ? true : false;
  }

  static bool isValidCPassword(String password, String cPassword) {
    return cPassword == password ? true : false;
  }
}
