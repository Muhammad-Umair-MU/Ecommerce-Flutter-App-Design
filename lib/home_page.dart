// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/products.dart';
import 'package:ecommerce/selected_product.dart';
import 'package:flutter/material.dart';
import 'products_list.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      margin: EdgeInsets.only(top: 10.0),
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      color: Colors.white54,
      child: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: 'Our',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                  TextSpan(
                      text: ' Products',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 25.0)),
                ])),
                IconButton(
                  onPressed: () {
                   
                  },
                  iconSize: 25.0,
                  icon: Icon(Icons.search_rounded),
                )
              ]),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            textButton(
              label: 'Chairs',
              fontWeight: FontWeight.bold,
            ),
            textButton(label: 'Sofas', fontWeight: FontWeight.w300),
            textButton(label: 'Beds', fontWeight: FontWeight.w300),
            textButton(label: 'Tables', fontWeight: FontWeight.w300),
          ]),
          GestureDetector(
            onTap: (){
               Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectedProduct()),
                    );
            },
            child: CarouselSlider.builder(
              itemCount: 4,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                String imagesList1 = productList1Images[itemIndex];
                String productLabelList1 = productList1labels[itemIndex];
                return topProducts(
                    imageLabel: imagesList1, productlabel: productLabelList1);
              },
              options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 5),
                  enlargeCenterPage: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  enableInfiniteScroll: false),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: 'Best',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              TextSpan(
                  text: ' Offers',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20.0)),
            ])),
          ),
          Expanded(
            child: Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  bestOffers(
                    imageLabel: 'assets/productsList/list1/matteo.png',
                    label: 'Matteo Armchair',
                    subLevel: 'Chair',
                  ),
                  bestOffers(
                    imageLabel: 'assets/productsList/list1/archeli.png',
                    label: 'Archeli',
                    subLevel: 'Chair',
                  ),
                  bestOffers(
                    imageLabel: 'assets/productsList/list1/osmond1.png',
                    label: 'Osmond Armchair',
                    subLevel: 'Chair',
                  ),
                  bestOffers(
                    imageLabel: 'assets/productsList/list1/woodenchair.png',
                    label: 'Wooden Chair',
                    subLevel: 'Chair',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Align(
            alignment: Alignment.bottomRight,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Products()),
                );
              },
              child: Container(
                  height: 55.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20.0)),
                    color: Color(0xFF35354F),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      children: [
                        Text(
                          'More',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.forward,
                          size: 20.0,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ))),
            ),
          ),
        ],
      ),
    );
  }
}

class textButton extends StatelessWidget {
  const textButton({
    Key? key,
    required this.label,
    required this.fontWeight,
  }) : super(key: key);

  final String label;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(
              fontSize: 19, fontWeight: fontWeight, color: Colors.black),
        ));
  }
}

class topProducts extends StatelessWidget {
  const topProducts(
      {Key? key, required this.imageLabel, required this.productlabel})
      : super(key: key);

  final String imageLabel;
  final String productlabel;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
              Expanded(
                  child: Image.asset(
                imageLabel,
                height: 150,
              )),
              Padding(
                padding:
                    const EdgeInsets.only(left: 5.0, top: 5.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productlabel,
                    ),
                    Text(
                      '\$250',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Container(
            width: 45.0,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Color(0xFF35354F),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  offset: Offset(2.0, 7), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      )
    ]);
  }
}

class bestOffers extends StatelessWidget {
  const bestOffers(
      {Key? key,
      required this.imageLabel,
      required this.label,
      required this.subLevel})
      : super(key: key);

  final String imageLabel;
  final String label;
  final String subLevel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.only(right: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            imageLabel,
            width: 50.0,
            height: 50.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(label,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15.0)),
            Text(subLevel,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: 13.0)),
          ]),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text('\$250',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontSize: 15.0)))),
        ],
      ),
    );
  }
}




          // CarouselSlider(
          //   items: [
          //     bestOffers(
          //       imageLabel: 'assets/productsList/list1/matteo.png',
          //       label: 'Matteo Armchair',
          //       subLevel: 'Chair',
          //     ),
          //     bestOffers(
          //       imageLabel: 'assets/productsList/list1/matteo.png',
          //       label: 'Matteo Armchair',
          //       subLevel: 'Chair',
          //     ),
          //     bestOffers(
          //       imageLabel: 'assets/productsList/list1/matteo.png',
          //       label: 'Matteo Armchair',
          //       subLevel: 'Chair',
          //     ),
          //   ],
          //   options: CarouselOptions(
          //       height: 200.0,
          //       scrollDirection: Axis.vertical,
          //       autoPlay: true,
          //       autoPlayInterval: Duration(seconds: 5),
          //       enlargeCenterPage: true,
          //       autoPlayCurve: Curves.fastOutSlowIn,
          //       autoPlayAnimationDuration: Duration(milliseconds: 800),
          //       enableInfiniteScroll: false),
          // ),