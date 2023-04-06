import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/modal/user.dart' as modal;
import 'package:untitled/method/storagemethod.dart';

class AuthMethod {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required String imagepath,
  }) async {
    String res = "some error";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty &&
      imagepath.isNotEmpty
      ) {
        // register user
        UserCredential cred = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        print(cred.user!.uid);

       await  StorageMethod().uploadImageToStorage('/user/', false, imagepath);

        // add databse user detail

        modal.User user = modal.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: imagepath,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );
        await firestore.collection("users").doc(cred.user!.uid).set(user.toJson()
         );
     var  shareP =    await  SharedPreferences.getInstance();
        shareP.setString("uid",  cred.user!.uid,);
        shareP.setString("username", username);
        shareP.setString("userimage", imagepath);

        res = "success";
      }
    }
    catch (e) {
      res = e.toString();
      Get.snackbar("user", res);
    }
    return res;
  }
  // log in user
  loginUser({required String email, required String password}) async {
    String res = "some erroe";
    try{
      if(email.isNotEmpty && password.isNotEmpty){
       await auth.signInWithEmailAndPassword(email: email, password: password);
       res = "success";
       Get.snackbar("user", res);
      }else{
        res = "please enter all field";
      }


    }catch(e){
      res = e.toString();
      Get.snackbar("user", res);
    }
  }
  fireStoreData() {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      firestore.doc(auth.currentUser!.uid).get().then((value) => {

      });
    } catch (e) {
      print(e);
    }
  }

}
