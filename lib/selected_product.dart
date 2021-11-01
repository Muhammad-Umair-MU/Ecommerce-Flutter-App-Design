// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/checkout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Color iconColor = Colors.black;
int stackIndex = 0;

class SelectedProduct extends StatefulWidget {
  const SelectedProduct({Key? key}) : super(key: key);

  @override
  State<SelectedProduct> createState() => _SelectedProductState();
}

class _SelectedProductState extends State<SelectedProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new_sharp)),
                    Text(' Products',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 25.0)),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            iconColor == Colors.black
                                ? iconColor = Colors.red.shade900
                                : iconColor = Colors.black;
                          });
                        },
                        iconSize: 25.0,
                        icon: Icon(Icons.favorite, color: iconColor))
                  ]),
              SizedBox(
                height: 5.0,
              ),
              Expanded(
                  child: IndexedStack(
                index: stackIndex,
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset('assets/selectedProduct/osmond1.png'),
                  Image.asset('assets/selectedProduct/osmond2.png'),
                  Image.asset('assets/selectedProduct/osmond3.png'),
                ],
              )),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Osmond Armchair',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'oswald'),
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10.0),
                  child: Text(
                    '\$240',
                    style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'oswald'),
                  ),
                ),
              ]),
              Text(
                'Chair',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'oswald'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  ProductImages(
                    function: () {
                      setState(() {
                        stackIndex = 0;
                      });
                    },
                    imageLabel: '1',
                  ),
                  ProductImages(
                    function: () {
                      setState(() {
                        stackIndex = 1;
                      });
                    },
                    imageLabel: '2',
                  ),
                  ProductImages(
                    function: () {
                      setState(() {
                        stackIndex = 2;
                      });
                    },
                    imageLabel: '3',
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'In best traditions, constructed of hardwood with padding of high-resilient foam. Created by award winning duo of Manchesti Bernadi and Fresco Duli Brothers',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'lato'),
              ),
              SizedBox(
                height: 25.0,
              ),
              Align(
                alignment: Alignment.center,
                child: MaterialButton(
                  onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckOut()),
                );},
                  child: Icon(
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  minWidth: 50.0,
                  height: 50.0,
                  color: Color(0xFF35354F),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    '+ Add to Cart',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImages extends StatelessWidget {
  const ProductImages(
      {Key? key, required this.function, required this.imageLabel})
      : super(key: key);

  final VoidCallback function;

  final String imageLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black45)),
      margin: EdgeInsets.only(right: 5.0),
      child: TextButton(
        onPressed: function,
        child: Image.asset(
          'assets/selectedProduct/osmond$imageLabel.png',
          height: 65,
          width: 75,
        ),
      ),
    );
  }
}



// class ProductSides extends StatefulWidget {
//   const ProductSides({Key? key, required this.index,required this.imageLabel}) : super(key: key);

//   final int index;
//   final String imageLabel;
//   @override
//   _ProductSidesState createState() => _ProductSidesState();
// }

// class _ProductSidesState extends State<ProductSides> {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {
//         setState(() {
//           indexx = widget.index;
//         });
//       },
//       child: Image.asset(
//         'assets/selectedProduct/osmond${widget.imageLabel}.png',
//         height: 65,
//         width: 75,
//       ),
//     );
//   }
// }