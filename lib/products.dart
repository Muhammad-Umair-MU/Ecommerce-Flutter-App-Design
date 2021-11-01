// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, camel_case_types

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/checkout.dart';
import 'package:ecommerce/products_list.dart';
import 'package:ecommerce/selected_product.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 10.0),
          padding: EdgeInsets.all(15.0),
          color: Colors.white54,
          child: Column(
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
                    Text(
                      'Armchairs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CheckOut()),
                        );
                      },
                      icon: Icon(Icons.shopping_cart),
                      highlightColor: Colors.red,
                    )
                  ]),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                materialButton(label: 'Sort', iconData: Icons.sort),
                SizedBox(
                  width: 20.0,
                ),
                materialButton(label: 'Filter', iconData: Icons.filter)
              ]),
              Expanded(
                child: Container(
                  height: 200.0,
                  color: Colors.white38,
                  child: ListView.builder(
                      itemCount: productList1Images.length,
                      itemBuilder: (context, index) {
                        String imagesList1 = productList1Images[index];
                        String productLabelList1 = productList1labels[index];
                        String imagesList2 = productList1Images[index];
                        String productLabelList2 = productList1labels[index];
                        return Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SelectedProduct()),
                                  );
                                },
                                child: productContainer(
                                    imageLabel: imagesList1,
                                    productlabel: productLabelList1),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 14.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SelectedProduct()),
                                    );
                                  },
                                  child: productContainer(
                                      imageLabel: imagesList2,
                                      productlabel: productLabelList2),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class materialButton extends StatelessWidget {
  const materialButton({Key? key, required this.label, required this.iconData})
      : super(key: key);

  final String label;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {},
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: BorderSide(color: Colors.black)),
      child: RichText(
          text: TextSpan(children: [
        WidgetSpan(child: Icon(iconData)),
        TextSpan(text: label, style: TextStyle(color: Colors.black))
      ])),
    );
  }
}

class productContainer extends StatelessWidget {
  const productContainer(
      {Key? key, required this.imageLabel, required this.productlabel})
      : super(key: key);

  final String imageLabel;
  final String productlabel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(2.0, 7), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imageLabel,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productlabel,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '\$250',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.5,
                        fontFamily: 'oswald'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


// Comments
// Expanded(
//                 child: Container(
//                   padding: EdgeInsets.only(top: 30.0),
//                   child: ListView.builder(
//                       itemCount: productList1Images.length,
//                       itemBuilder: (context, index) {
//                         String images = productList1Images[index];
//                         String productlabel = productList1labels[index];
//                         return productContainer(
//                             imageLabel: images, productlabel: productlabel);
//                       }),
//                 ),
//               )


  // NeuCard(child: Icon(Icons.shopping_cart,size: 24.0,),curveType: CurveType.concave,padding: EdgeInsets.all(10.0),  bevel: 10,decoration: NeumorphicDecoration(
  //                     borderRadius: BorderRadius.circular(35),
  //                     color:Color(0xffecedf1) ,
  //                   ),),