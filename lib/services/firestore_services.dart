import '../constants/constant.dart';

class FirestoreServices {
  //get total package
  static getTotalPackage() {
    return firestore.collection('all-data')
    .where('approved', isEqualTo: true)
    .snapshots();
  }

  //get total self package
  static getTotalSelfPackage() {
    return firestore.collection('self-package').snapshots();
  }

  //get total pending package
  static getTotalPendingPackage() {
    return firestore
        .collection('all-data')
        .where("approved", isEqualTo: false)
        .snapshots();
  }

  //get total app users
  static getTotalUsers() {
    return firestore.collection('users').snapshots();
  }

  //get pending package
  static getPendingPackages() {
    return firestore
        .collection("all-data")
        .where('approved', isEqualTo: false)
        .snapshots();
  }
}
