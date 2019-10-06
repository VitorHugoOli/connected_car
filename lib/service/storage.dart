
import 'package:cloud_firestore/cloud_firestore.dart';

class Store{
  final databaseReference = Firestore.instance;

  void createUserDate(String uid,String status,String bio) async {
    await databaseReference.collection("Usuarios")
        .document(uid)
        .setData({
      'bio': bio,
      'status': status
    });
  }

  Future<DocumentSnapshot> getUserData(String uid) async{
    return await databaseReference
        .collection('Usuarios')
        .document(uid)
        .get()
        .then((DocumentSnapshot ds) {
          print(ds.data);
          return ds;
    });
  }

//  void updateData(String uid,String) {
//    try {
//      databaseReference
//          .collection('Usuario')
//          .document(uid)
//          .updateData({'description': 'Head First Flutter'});
//    } catch (e) {
//      print(e.toString());
//    }
//  }

  bool deleteData(String uid) {
    try {
      databaseReference
          .collection('Usuario')
          .document(uid)
          .delete();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

}