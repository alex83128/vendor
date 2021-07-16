
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'package:mealup_restaurant_side/config/Palette.dart';
import 'package:mealup_restaurant_side/constant/app_strings.dart';
import 'package:mealup_restaurant_side/localization/localization_constant.dart';
import 'package:mealup_restaurant_side/screens/product/CustomizationOptionScreen.dart';


class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int pageNum) {
    setState(() {
      _selectedPage = pageNum;
      _pageController.animateToPage(
        pageNum,
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
      );
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final bool alreadySaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/images/loginn.png'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.0,
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TabButton(
                        text: "Pizzas",
                        pageNumber: 0,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(0);
                        },
                      ),
                      TabButton(
                        text: "Burgers",
                        pageNumber: 1,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(1);
                        },
                      ),
                      TabButton(
                        text: "Taco",
                        pageNumber: 2,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(2);
                        },
                      ),
                      TabButton(
                        text: "Beverages",
                        pageNumber: 3,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(3);
                        },
                      ),
                      TabButton(
                        text: "Desserts",
                        pageNumber: 4,
                        selectedPage: _selectedPage,
                        onPressed: () {
                          _changePage(4);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                controller: _pageController,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            card(
                                "https://lh3.googleusercontent.com/proxy/Y8h1zV9B0LvZjzX43TO69VNOES1a8byqbwEF6wRNPx2-RSzGAgr_Pmk6MikpGMTk6XxlHLRGd7TxZ7JXpp5vkGzr-CuVLi4lT8hgtTabMScRBCbXJS6Tpgz7nFeMNij0pPQnsv3ykSThLA",
                                "assets/images/veg.svg",
                                "Cheese Macaroni Pizza",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u0024109"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://c4.wallpaperflare.com/wallpaper/1017/647/742/cheese-pizza-tomatoes-olives-bacon-hd-wallpaper-preview.jpg",
                                "assets/images/nonveg.svg",
                                "Chili Maxicano Pizza",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u0024110"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://image.winudf.com/v2/image1/Y29tLndhbGxwYXBlcnN3b3JsZC5waXp6YV9zY3JlZW5fMV8xNTY3MjM0MDEzXzAxMQ/screen-1.jpg?fakeurl=1&type=.jpg",
                                "assets/images/veg.svg",
                                "Burn Cheesy Pizza ",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u0024109"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://c0.wallpaperflare.com/preview/21/367/815/united-states-downers-grove-toppings-grill.jpg",
                                "assets/images/veg.svg",
                                "Thin Crust Italian Taste",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u0024125"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://images.dominos.co.in/new_chicken_dominator.jpg",
                                "assets/images/nonveg.svg",
                                "Non Veggi Retreate",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002499"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://content.jdmagicbox.com/comp/delhi/57/011pk043957/catalogue/star-pizza-lado-sarai-mehrauli-delhi-pizza-outlets-smcg47.jpg?clr=",
                                "assets/images/nonveg.svg",
                                "Pepper Barbecue C...",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002499"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://www.ruchiskitchen.com/wp-content/uploads/2020/09/Paneer-tikka-pizza-recipe-1.jpg",
                                "assets/images/veg.svg",
                                "Peppy Paneer",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002499"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            card(
                                "https://www.culturesforhealth.com/learn/wp-content/uploads/2016/04/Whole-Wheat-Sourdough-Burger-Buns-Header.jpg",
                                "assets/images/nonveg.svg",
                                "Brown Bread Burger",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002479"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://i.insider.com/56057b299dd7cc11008bd1b2?width=1000&format=jpeg&auto=webp",
                                "assets/images/nonveg.svg",
                                "Black Burger",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002499"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://www.vegrecipesofindia.com/wp-content/uploads/2018/12/veg-burger-recipe-1.jpg",
                                "assets/images/veg.svg",
                                "Veg. Burger",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002449"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8si9AkEvZy3n8UljHXV7NVi_WeUanbIn60g&usqp=CAU",
                                "assets/images/nonveg.svg",
                                "Cheesy Treat",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002459"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            card(
                                "https://images-gmi-pmc.edge-generalmills.com/d984e059-801b-4f3e-ba65-0c501e95413f.jpg",
                                "assets/images/veg.svg",
                                "Crust Spicy Taco",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002479"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/9/27/0/KC1811_Cauliflower-Tacos-with-Spicy-Sriracha-Black-Beans_s4x3.jpg.rend.hgtvcom.616.462.suffix/1538075459695.jpeg",
                                "assets/images/veg.svg",
                                "Green Chili With Cheese",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002499"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            card(
                                "https://i.ytimg.com/vi/3R25UKb9L_Q/maxresdefault.jpg",
                                "assets/images/veg.svg",
                                "Coca Cola",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://i.pinimg.com/originals/73/bf/43/73bf43f25aa59af9a5b9d55dafc95815.png",
                                "assets/images/veg.svg",
                                "Sprite",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://assets.turbologo.com/blog/en/2020/02/19084623/Fanta-logo.png",
                                "assets/images/veg.svg",
                                "Fanta",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://www.designyourway.net/blog/wp-content/uploads/2018/07/maxresdefault-1.jpg",
                                "assets/images/veg.svg",
                                "Pepsi",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://lh3.googleusercontent.com/proxy/8__DSVRJjGTmodKj5TWfMF2tZl1TfL3ArG4YloGdijAlh-a2Qs8QhmVDjO75V81EbM1GuwUUAr0VOCf-tEyw9hwqCZXzgE23QVKz3EGb-_rRRHBsFIOjg0IpJF8K6plb6Db6uIEmZcxMqrc",
                                "assets/images/veg.svg",
                                "Mountain Dew",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            card(
                                "https://buttermilkbysam.com/wp-content/uploads/2020/07/black-cocoa-ice-cream-16.jpg",
                                "assets/images/veg.svg",
                                "Dark Chocolate",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://vaya.in/recipes/wp-content/uploads/2019/03/Butterscotch-Ice-Cream.jpg",
                                "assets/images/veg.svg",
                                "Butterscotch",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://bizimages.withfloats.com/actual/5b337c5720f6bf075013c54a.jpg",
                                "assets/images/veg.svg",
                                "Choco Nuts",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://ca-times.brightspotcdn.com/dims4/default/4274f5f/2147483647/strip/true/crop/2048x1279+0+45/resize/1044x652!/quality/90/?url=https%3A%2F%2Fcalifornia-times-brightspot.s3.amazonaws.com%2F2d%2F47%2F296efe5c66ad61d1c547eb436231%2Fhg8laakf-recipe-db",
                                "assets/images/veg.svg",
                                "Hot Chocolate",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            card(
                                "https://ak.picdn.net/shutterstock/videos/9209222/thumb/1.jpg",
                                "assets/images/veg.svg",
                                "Choco Strawberry",
                                "Signature wraps packed with\ndouble protein and loaded flavors",
                                "\u002410"),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget card(
    String image,
    String veg,
    String itemname,
    String itemdescription,
    String price,
  ) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Palette.sheet,
          context: context,
          elevation: 10,
          builder: (BuildContext context){
            return Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: Colors.white),
                  height: MediaQuery.of(context).size.height * 0.12,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 13, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover, image: NetworkImage(image)),
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20)),
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.18,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/images/veg.svg"),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                          "Cheese Macaroni Pizza",
                                          style: TextStyle(
                                              color: Palette.loginhead,
                                              fontSize: 15,
                                              fontFamily: "ProximaBold"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "Signature wraps packed with\ndouble protein and loaded flavors",
                                      style: TextStyle(
                                          color: Palette.switchs,
                                          fontSize: 11,
                                          fontFamily: "ProximaNova"),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Text(
                                      "\u0024109",
                                      style: TextStyle(
                                          color: Palette.loginhead,
                                          fontSize: 15,
                                          fontFamily: "ProximaNova"),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Transform.rotate(
                                angle: -3.12 / 2,
                                child: AdvancedSwitch(
                                  controller: AdvancedSwitchController(false),
                                  activeColor: Palette.removeacct,
                                  inactiveColor: Palette.divider,
                                  borderRadius:
                                  BorderRadius.all(const Radius.circular(5)),
                                  width: 70,
                                  enabled: true,
                                  disabledOpacity: 0.5,
                                ),
                              ),
                            ),
                            // Transform.rotate(
                            //   angle: -3.14 / 2,
                            //   child: Text(
                            //     "OUT OF STOCK",
                            //     style: TextStyle(
                            //         fontSize: 8,
                            //         color: Palette.loginhead,
                            //         fontFamily: "ProximaNova"),
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text(
                      getTranslated(context, customization_list),
                      style: TextStyle(
                          fontSize: 15,
                          color: Palette.loginhead,
                          fontFamily: "ProximaBold"),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CustomizationOptionScreen()));
                        },
                        child: Text(
                          getTranslated(context, edit_customization_list),
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.blue,
                              fontFamily: "ProximaNova"),
                        ),
                      ),
                  ],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20,0,20,0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Extra Cheese",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaBold"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "Extra Sauce",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaBold"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "Extra Pepperoni",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaBold"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "Extra Capsicum",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaBold"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "Extra Oregano",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaBold"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "Extra Chili Flakes",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaBold"),
                        ),
                      ],
                    ),
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "\u00245",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "\u00242",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "\u00249",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "\u00245",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "\u00243",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaNova"),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                        Text(
                          "\u00243",
                          style: TextStyle(
                              fontSize: 13,
                              color: Palette.loginhead,
                              fontFamily: "ProximaNova"),
                        ),
                      ],
                    ),
                  ],),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                GestureDetector(
                  onTap: () {
                   /* Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddNewItem()));*/
                  },
                  child: Container(color: Palette.green,
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(
                        "Edit This Product",
                        style: TextStyle(
                            fontSize: 15,
                            color: Palette.white,
                            fontFamily: "ProximaNova"),
                      ),
                    ),
                  ),
                )
              ],),

            );
          },);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          height: MediaQuery.of(context).size.height * 0.13,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 13, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover, image: NetworkImage(image)),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(20)),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.18,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Image.asset(veg),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  itemname,
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontSize: 15,
                                      fontFamily: "ProximaBold"),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Text(
                              itemdescription,
                              style: TextStyle(
                                  color: Palette.switchs,
                                  fontSize: 11,
                                  fontFamily: "ProximaNova"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                            child: Row(
                              children: [
                                Text(
                                  price,
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontSize: 15,
                                      fontFamily: "ProximaNova"),
                                ),
                                Text(
                                  "  |  ",
                                  style: TextStyle(
                                      color: Palette.loginhead,
                                      fontSize: 15,
                                      fontFamily: "ProximaNova"),
                                ),
                                Text(
                                  "Edit this product",
                                  style: TextStyle(
                                      color: Palette.blue,
                                      fontSize: 12,
                                      fontFamily: "ProximaBold"),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Transform.rotate(
                        angle: -3.12 / 2,
                        child: AdvancedSwitch(
                          controller: AdvancedSwitchController(false),
                          activeColor: Palette.removeacct,
                          inactiveColor: Palette.divider,
                          borderRadius:
                              BorderRadius.all(const Radius.circular(5)),
                          width: 70,
                          enabled: true,
                          disabledOpacity: 0.5,
                        ),
                      ),
                    ),
                    // Transform.rotate(
                    //   angle: -3.14 / 2,
                    //   child: Text(
                    //     "OUT OF STOCK",
                    //     style: TextStyle(
                    //         fontSize: 8,
                    //         color: Palette.loginhead,
                    //         fontFamily: "ProximaNova"),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final int selectedPage;
  final int pageNumber;
  final Function onPressed;

  TabButton({ this.text,  this.selectedPage,  this.pageNumber,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     // onTap: onPressed,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 1000),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
              border: selectedPage == pageNumber
                  ? Border(bottom: BorderSide(width: 3, color: Palette.green))
                  : Border(
                      bottom: BorderSide(width: 3, color: Colors.transparent),
                    ),
            ),
            padding: EdgeInsets.symmetric(
              vertical: selectedPage == pageNumber ? 5.0 : 0,
              horizontal: selectedPage == pageNumber ? 5.0 : 0,
            ),
            margin: EdgeInsets.symmetric(
              vertical: selectedPage == pageNumber ? 0 : 12.0,
              horizontal: selectedPage == pageNumber ? 0 : 20.0,
            ),
            /*child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: selectedPage == pageNumber
                  ? Text(
                      text ?? "Tab Button",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "ProximaBold"),
                    )
              //text ?? "Tab Button",
                  : Text(
                      text ?? '',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: "ProximaNova"),
                    ),
            ),*/
          ),
        ],
      ),
    );
  }
}
