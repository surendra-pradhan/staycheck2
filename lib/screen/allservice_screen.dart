import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:staycheck/screen/pages/product_page.dart';

// ignore: use_key_in_widget_constructors
class ServiceScreen extends StatelessWidget {
  static const routname = '/allservice';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Select',
                        style: Theme.of(context).textTheme.headline2),
                    Text(
                      'Your Service',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ]),
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: serviceCard(context, 0xFFE4FBFF,
                            'assets/images/placeorder.svg', 'Place Orders'),
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(ProductPage.routerName);
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      serviceCard(context, 0xFFFCFFA6,
                          'assets/images/productsearch.svg', "Product Search"),
                      SizedBox(
                        height: 15,
                      ),
                      serviceCard(context, 0xFFFFDEDE, 'assets/images/faq.svg',
                          'Faq or Raise a Ticket'),
                      SizedBox(
                        height: 15,
                      ),
                      serviceCard(context, 0xFFB6C9F0,
                          'assets/images/expire.svg', "Expiry Settlement"),
                      SizedBox(
                        height: 15,
                      ),
                      serviceCard(context, 0xFFFFE5B9,
                          'assets/images/payment.svg', 'Payment Analities'),
                      SizedBox(
                        height: 15,
                      ),
                      serviceCard(
                          context,
                          0xFFCCFFBD,
                          'assets/images/previousorders.svg',
                          'Previouse Orders')
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget serviceCard(ctx, color, imgsrc, tittle) {
    return Card(
      color: Color(color),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: SvgPicture.asset(
                imgsrc,
                height: MediaQuery.of(ctx).size.height / 8,
              ),
            ),
            Flexible(
                child: Text(
              tittle,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
    );
  }
}
