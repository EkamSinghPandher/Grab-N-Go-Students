import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/User.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromData);
  }

  User _userFromData(FirebaseUser user) {
    return user == null ? null : User(uid: user.uid);
  }

  // sign in with email and password
  Future signInUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      if (user.isEmailVerified) return _userFromData(user);
      return null;
    } catch (error) {
      return null;
    }
  }

  //register with email and password
  Future registerUser(String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DataService(uid: user.uid).updateStudentData(
          Student(uid: user.uid, email: user.email, name: name));
      await user.sendEmailVerification();
      return _userFromData(user);
    } catch (error) {
      print("error occured while sending email verification");
      return null;
    }
  }

  // logout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await _auth.currentUser();
  }

  Future<void> sendEmailVerification() async {
    var user = await _auth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    var user = await _auth.currentUser();
    return user.isEmailVerified;
  }
}
