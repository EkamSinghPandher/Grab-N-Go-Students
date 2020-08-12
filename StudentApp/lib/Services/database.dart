import 'dart:math';

import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Message.dart';
import 'package:StudentApp/Models/Order.dart';
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
  Stream<List<Location>> get locations {
    return locationsCollection.snapshots().map(locationsFromSnapshot);
  }

  //get a List of locations from a snapshot
  List<Location> locationsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Location.fromJson(doc.data);
    }).toList();
  }

  //Get a list of vendors at the particular location
  Stream<List<Vendor>> vendorsFromLocation(String locName) {
    return locationsCollection
        .document(locName)
        .collection("Stalls")
        .snapshots()
        .map(vendorsFromSnapshot);
  }

  //Get a list of vendors from a snapshot
  List<Vendor> vendorsFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Vendor.fromJson(doc.data);
    }).toList();
  }

  //Get a list of all vendors
  Stream<List<Vendor>> get vendors {
    return vendorsCollection.snapshots().map(vendorListFromSnapshot);
  }

  //Get a list of all vendors from a snapshot
  List<Vendor> vendorListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Vendor.fromJson(doc.data);
    }).toList();
  }

  //Get a list of vendors at the particular location
  Stream<List<Food>> menuFromLocation(Vendor vendor, String locName) {
    return locationsCollection
        .document(locName)
        .collection("Stalls")
        .document(vendor.uid)
        .collection('Menu')
        .snapshots()
        .map(menuFromSnapshot);
  }

  //Get a list of food from a vendor
  List<Food> menuFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Food.fromJson(doc.data);
    }).toList();
  }

  //gets a stream of the students orders
  Stream<List<Order>> get myOrders {
    return studentsCollection
        .document(uid)
        .collection('Orders')
        .snapshots()
        .map(ordersFromSnapshot);
  }

  //gets a list of orders from a snapshot
  List<Order> ordersFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((e) => Order.fromJson(e.data)).toList();
  }

  Future orderFood(Food food, int quantity, DateTime dateTime, Vendor vendor,
      Student student) async {
    String orderID = Random(DateTime.now().hashCode).nextInt(999999).toString();
    Order newOrder = Order(
        orderImage: food.foodImage,
        dateTime: dateTime,
        vendorUID: vendor.uid,
        studentUID: student.uid,
        stallName: vendor.stallName,
        studName: student.name,
        foodName: food.foodName,
        foodPrice: food.foodPrice,
        quantity: quantity,
        isCollected: false,
        isDone: false,
        orderID: orderID);
    await vendorsCollection
        .document(vendor.uid)
        .collection('Menu')
        .document(food.uid)
        .setData(Food(
                foodImage: food.foodImage,
                foodName: food.foodName,
                foodPrice: food.foodPrice,
                stock: (food.stock - quantity),
                uid: food.uid)
            .toJson());
    await locationsCollection
        .document(vendor.loc)
        .collection('Stalls')
        .document(vendor.uid)
        .collection('Menu')
        .document(food.uid)
        .setData(Food(
                foodImage: food.foodImage,
                foodName: food.foodName,
                foodPrice: food.foodPrice,
                stock: (food.stock - quantity),
                uid: food.uid)
            .toJson());
    vendorsCollection
        .document(vendor.uid)
        .collection('Orders')
        .document(orderID)
        .setData(newOrder.toJson());
    studentsCollection
        .document(student.uid)
        .collection('Orders')
        .document(orderID)
        .setData(newOrder.toJson());
    sendMessage(
        newOrder,
        Message(
            studName: newOrder.studName,
            stallName: newOrder.stallName,
            time: DateTime.now(),
            studentID: newOrder.studentUID,
            vendorID: newOrder.vendorUID,
            sendorID: newOrder.vendorUID,
            text:
                'Your order has been recieved and your order number is ${newOrder.orderID.toString()}, please check your current orders for more details'));
  }

  //Get Stream of messages from an order
  Stream<List<Message>> messagesFromOrder(Order order) {
    return studentsCollection
        .document(uid)
        .collection('Orders')
        .document(order.orderID)
        .collection("Messages")
        .snapshots()
        .map(messagesFromSnapshot);
  }

  //get a list of messages from a snapshot
  List<Message> messagesFromSnapshot(QuerySnapshot snaphsot) {
    return snaphsot.documents.map((e) => Message.fromJson(e.data)).toList();
  }

  //send message
  Future sendMessage(Order order, Message message) async {
    await studentsCollection
        .document(order.studentUID)
        .collection('Orders')
        .document(order.orderID)
        .collection("Messages")
        .document(message.time.toIso8601String())
        .setData(message.toJson());
    vendorsCollection
        .document(order.vendorUID)
        .collection('Orders')
        .document(order.orderID)
        .collection("Messages")
        .document(message.time.toIso8601String())
        .setData(message.toJson());
  }
}
