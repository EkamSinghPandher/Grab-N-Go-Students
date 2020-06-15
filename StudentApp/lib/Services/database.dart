import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/Models/LocationList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final String uid;

  DataService({this.uid});

  //collection references
  final CollectionReference studentsCollection =
      Firestore.instance.collection('Students');
  final CollectionReference vendorsCollection =
      Firestore.instance.collection('Vendors');
  final CollectionReference locationsCollection = 
      Firestore.instance.collection('LocationList');


  //uodating user data
  Future updateStudentData(Student student) async {
    return await studentsCollection
        .document(student.uid)
        .setData(student.toJson());
  }

  //get student stream
  Stream<Student> get students {
    return studentsCollection.snapshots().map(studentFromSnapshot);
  }

  //get Students from snapshot
  Student studentFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((doc) {
          return Student.fromJson((doc.data));
        })
        .toList()
        .firstWhere((element) => element.uid == this.uid);
  }

  //Get a list of locations
  Stream<List<Location>> get locations{
    return locationsCollection.snapshots().map(locationsFromSnapshot);
  }

  //get a List of locations from a snapshot
  List<Location> locationsFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc) {
      return Location.fromJson(doc.data);
    }).toList();
  }

  //Get a list of vendors at the particular location
  Stream<List<Vendor>> vendorsFromLocation(String locName){
    return locationsCollection.document(locName).collection("Stalls").snapshots().map(vendorsFromSnapshot);
  }

  //Get a list of vendors from a snapshot
  List<Vendor> vendorsFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Vendor.fromJson(doc.data);
    }).toList();
  }

  //Get a list of all vendors
  Stream<List<Vendor>> get vendors{
    return vendorsCollection.snapshots().map(vendorListFromSnapshot);
  }
  //Get a list of all vendors from a snapshot
  List<Vendor> vendorListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Vendor.fromJson(doc.data);
    }).toList();
  }

}
