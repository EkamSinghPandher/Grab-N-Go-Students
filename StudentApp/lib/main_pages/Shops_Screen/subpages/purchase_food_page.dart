import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Student.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/page_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PurchaseFood extends StatefulWidget {
  final Food food;
  final Vendor vendor;
  final Student student;

  const PurchaseFood(
      {Key key,
      @required this.food,
      @required this.vendor,
      @required this.student})
      : super(key: key);
  @override
  _PurchaseFoodState createState() => _PurchaseFoodState();
}

class _PurchaseFoodState extends State<PurchaseFood> {
  int quantity = 1;
  TimeOfDay timeNow = TimeOfDay.now();
  TimeOfDay timePicked;
  TimeOfDay validTime;
  String errorMsg;

  Future<Null> selectTime(BuildContext context) async {
    timePicked = await showTimePicker(
        context: context, initialTime: validTime == null ? timeNow : validTime);
    setState(() {
      if ((timePicked.hour < timeNow.hour) ||
          (timePicked.hour == timeNow.hour &&
              timePicked.minute < (timeNow.minute + 15))) {
        errorMsg = 'Choose a valid time';
        validTime = null;
      } else if ((timePicked.hour < widget.vendor.openingHour.hour ||
              (timePicked.hour == widget.vendor.openingHour.hour &&
                  timePicked.minute < widget.vendor.openingHour.minute)) ||
          (timePicked.hour > widget.vendor.closingHour.hour ||
              (timePicked.hour == widget.vendor.closingHour.hour &&
                  timePicked.minute > widget.vendor.closingHour.minute))) {
        errorMsg = 'The vendor is not open at the specified time';
        validTime = null;
      } else {
        validTime = timePicked;
        errorMsg = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //Payment payment = Payment.initialize();
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Confirm Your Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.blueAccent,
                fontFamily: "Montserrat",
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: ReusableCard(
                        color: Colors.white,
                        cardChild: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.blue.shade800,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (quantity > 0) {
                                    quantity--;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'QUANTITY',
                                  style: TextStyle(color: Colors.blue.shade800),
                                  //style: kTextStyle,
                                ),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(color: Colors.blue.shade800),
                                  //style: kNumberStyle,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            IconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.blue.shade800,
                              ),
                              onPressed: () {
                                setState(() {
                                  quantity >= widget.food.stock
                                      // ignore: unnecessary_statements
                                      ? quantity
                                      : quantity++;
                                });
                              },
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            FlatButton(
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.alarm),
                    SizedBox(width: 10),
                    Text(validTime == null
                        ? 'Collect at ${TimeOfDay.now().hour.toString()}:${TimeOfDay.now().minute.toString()}'
                        : 'Collect at ${validTime.hour.toString()}:${validTime.minute.toString()}')
                  ],
                ),
              ),
              onPressed: () async {
                await selectTime(context);
              },
            ),
            errorMsg == null
                ? SizedBox(height: 12)
                : Container(
                    alignment: Alignment.center,
                    child: Text(
                      errorMsg,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            /*FlatButton(
              child: Text(
                'Add or change Card',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onPressed: () {
                //payment.addCard();
              },
            ),*/
            FlatButton(
              child: Text(
                'CONFIRM',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (validTime != null) {
                  DataService().orderFood(
                      widget.food,
                      quantity,
                      DateTime(DateTime.now().year, DateTime.now().month,
                          DateTime.now().day, validTime.hour, validTime.minute),
                      widget.vendor,
                      widget.student);
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => PageLogic()),
                      ModalRoute.withName(PageLogic.id));
                } else {
                  setState(() {
                    if (errorMsg == null) {
                      errorMsg = 'Please Choose a time for your order';
                    }
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.color, this.onPress, this.cardChild});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData iconDisplay;
  final Function onPressed;

  RoundIconButton({this.iconDisplay, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconDisplay),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Colors.white,
    );
  }
}
