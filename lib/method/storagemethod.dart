import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethod{
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  //image add in firestoregae

Future<String> uploadImageToStorage(String childName, bool isPost,String filepath)async{
   String storeImage = "";
  Reference ref = firebaseStorage.ref().child(childName).child(auth.currentUser!.uid);

  if(isPost){
    String id = Uuid().v1();
    ref.child(id);
  }
  UploadTask uploadTask = ref.putFile(File(filepath));
    Future.value(uploadTask);
    storeImage = await ref.getDownloadURL();
    print(storeImage);
    return storeImage;
}

}