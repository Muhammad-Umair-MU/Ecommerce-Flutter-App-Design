// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types

import 'package:ecommerce/products_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int totalQuantity = 1;
int delievery = 20;
int totalMoney = 250;

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 36.0,
                      width: 36.0,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new_sharp,
                          color: Colors.white,
                          size: 25.0,
                        ),
                        padding: EdgeInsets.all(0.0),
                        color: Colors.black,
                      ),
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'My',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0)),
                      TextSpan(
                          text: ' Cart',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 25.0)),
                    ])),
                    IconButton(
                      onPressed: () {},
                      iconSize: 28.0,
                      icon: Icon(Icons.delete_forever),
                    )
                  ]),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: CheckOutProducts(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckOutProducts extends StatefulWidget {
  CheckOutProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<CheckOutProducts> createState() => _CheckOutProductsState();
}

class _CheckOutProductsState extends State<CheckOutProducts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            child: ListView.builder(
                itemCount: productList1Images.length,
                itemBuilder: (context, index) {
                  String imagesList1 = productList1Images[index];
                  String productLabelList1 = productList1labels[index];

                  return Row(
                    children: [
                      Image.asset(
                        imagesList1,
                        width: 130.0,
                        height: 130.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(productLabelList1,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20.0)),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 15.0, bottom: 15.0),
                            child: Text('\$250',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 20.0)),
                          ),
                          Row(
                            children: [
                              SizedBox(
                                height: 35.0,
                                width: 35.0,
                                child: productMaterialButton(
                                  iconData: FontAwesomeIcons.minus,
                                  color: Colors.black54,
                                  function: () {
                                    setState(() {
                                      productQuantity[index]--;

                                      totalQuantity = productQuantity[index];
                                      totalMoney -= (totalQuantity * 250);
                                    });
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(right: 15.0, left: 15.0),
                                child: Text(productQuantity[index].toString()),
                              ),
                              SizedBox(
                                height: 35.0,
                                width: 35.0,
                                child: productMaterialButton(
                                  iconData: Icons.add,
                                  color: Colors.black,
                                  function: () {
                                    setState(() {
                                      productQuantity[index]++;
                                      totalQuantity = productQuantity[index];
                                      totalMoney += (totalQuantity * 250);
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  );
                }),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              SizedBox(
                width: 150.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 5.0,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal',
                      style: TextStyle(color: Colors.black54, fontSize: 20.0)),
                  Text('\$ ${totalMoney}',
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                ],
              ),
              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delievery & Handling',
                      style: TextStyle(color: Colors.black54, fontSize: 20.0)),
                  Text('\$ ${delievery * totalQuantity}',
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                ],
              ),
              SizedBox(height: 15.0,),
              SizedBox(
                width: 150.0,
                child: Divider(
                  color: Colors.black,
                  thickness: 5.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Subtotal',
                      style: TextStyle(color: Colors.black54, fontSize: 20.0)),
                  Text('\$ ${delievery + totalMoney}',
                      style: TextStyle(color: Colors.black, fontSize: 20.0)),
                ],
              ),
              MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(color: Colors.black)),
                child: Text('Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0)),
                color: Colors.black,
                minWidth: double.infinity,
              )
            ],
          ),
        )
      ],
    );
  }
}

class productMaterialButton extends StatelessWidget {
  const productMaterialButton(
      {Key? key,
      required this.function,
      required this.iconData,
      required this.color})
      : super(key: key);
  final VoidCallback function;
  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: function,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 25.0,
      ),
      padding: EdgeInsets.all(0.0),
      color: color,
    );
  }
}









//  Container(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: 150.0,
//                       child: Divider(
//                         color: Colors.black,
//                         thickness: 5.0,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Subtotal',
//                             style: TextStyle(
//                                 color: Colors.black54, fontSize: 20.0)),
//                         Text('\$${550.0 + (totalQuantity * 250.0)}',
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 20.0)),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Delievery & Handling',
//                             style: TextStyle(
//                                 color: Colors.black54, fontSize: 20.0)),
//                         Text('\$30',
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 20.0)),
//                       ],
//                     ),
//                     SizedBox(
//                       width: 150.0,
//                       child: Divider(
//                         color: Colors.black,
//                         thickness: 5.0,
//                       ),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text('Subtotal',
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 20.0)),
//                         Text('Kursi',
//                             style:
//                                 TextStyle(color: Colors.black, fontSize: 20.0)),
//                       ],
//                     ),
//                     MaterialButton(
//                       onPressed: () {},
//                       child: Text('Checkout',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20.0)),
//                       color: Colors.black,
//                       minWidth: double.infinity,
//                     )
//                   ],
//                 ),
//               )
