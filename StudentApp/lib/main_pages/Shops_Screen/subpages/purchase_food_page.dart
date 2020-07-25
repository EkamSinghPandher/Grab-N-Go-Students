import 'package:StudentApp/Models/Food.dart';
import 'package:StudentApp/Models/Vendor.dart';
import 'package:StudentApp/Services/database.dart';
import 'package:StudentApp/main_pages/page_logic.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:stripe_payment/stripe_payment.dart';

class PurchaseFood extends StatefulWidget {
  final Food food;
  final Vendor vendor;
  final String studentID;

  const PurchaseFood(
      {Key key,
      @required this.food,
      @required this.vendor,
      @required this.studentID})
      : super(key: key);
  @override
  _PurchaseFoodState createState() => _PurchaseFoodState();
}

class _PurchaseFoodState extends State<PurchaseFood> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51H8m1jKoQQFZlp0JvTXIGIKeugXPJVPZIXXiSUN51cV0Vm1qhbH6STEjbyoWGIDbLuEc25IOq4VSQELuU1dCr8IN00lv8OPlHQ'));
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(
                'Add or change Card',
                style: TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent),
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Text(
                'CONFIRM',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                DataService(uid: widget.studentID).orderFood(
                    widget.food, quantity, DateTime.now(), widget.vendor);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => PageLogic()),
                    ModalRoute.withName(PageLogic.id));
              },
            ),
          ],
        ),
      ),
    );
  }

  _squarePayment() async {
    await InAppPayments.setSquareApplicationId('sq0idp-_pqcBeHgzPTL6DeEFmUCwQ');
    await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: (CardDetails result) {
          try {
            InAppPayments.completeCardEntry(
                onCardEntryComplete: () => print('yay'));
          } on Exception catch (ex) {
            print('problem');
            InAppPayments.showCardNonceProcessingError(ex.toString());
          }
        },
        onCardEntryCancel: () {});
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
