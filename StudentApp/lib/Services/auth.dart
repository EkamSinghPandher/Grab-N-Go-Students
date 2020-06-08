import 'package:StudentApp/Models/Student.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Stream<Student> get user {
    return _auth.onAuthStateChanged.map(_studentFromUser);
  }

  Student _studentFromUser(FirebaseUser user) {
    return user == null
        ? null
        : Student(
            uid: user.uid,
            email: user.email
        );
  }

  // sign in with email nd password
  Future signInUser(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _studentFromUser(user);
    }catch(error){
      return null;
    }
  }

  //register with email and password
  Future registerUser(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _studentFromUser(user);
    }catch(error){
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

}
