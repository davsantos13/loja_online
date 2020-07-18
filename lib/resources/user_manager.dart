import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:loja_virt/helpers/firebase_errors.dart';
import 'package:loja_virt/models/user.dart';

class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;

  bool _loading = false;
  User user;

  UserManager() {
    _loadCurrentUser();
  }

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    try {
      loading = true;
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.senha);

      await _loadCurrentUser(firebaseUser: result.user);

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getError(e.code));
    }

    loading = false;
  }

  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.senha);

      user.id = result.user.uid;
      this.user = user;

      await user.saveData();

      onSuccess();
    } on PlatformException catch (e) {
      onFail(getError(e.code));
    }
  }

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    FirebaseUser userAtual =
        firebaseUser != null ? firebaseUser : await auth.currentUser();
    if (userAtual != null) {
      final DocumentSnapshot docUser =
          await firestore.collection('users').document(userAtual.uid).get();

      user = User.fromDocument(docUser);
      notifyListeners();
    }
  }
}
