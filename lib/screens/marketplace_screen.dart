import 'package:farming_app/screens/produce_market.dart';
import 'package:farming_app/screens/restaurant_market.dart';
import 'package:farming_app/screens/seed_market.dart';
import 'package:farming_app/screens/post_page.dart';
import 'package:flutter/material.dart';

import 'checkout_screen.dart';

class MarketplaceScreen extends StatefulWidget {
  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {


  List<Widget> pages = [SeedMarket(), ProduceMarket(), RestaurantMarket()];
  int pageIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Marketplace', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostPage()),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, size: 30.0,),
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CheckoutScreen())),
                ),
              ],
            ),
          ),

          SizedBox(height: 25.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                    _pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOutSine);
                  });
                },
                child: Text(
                  'Seeds',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: pageIndex == 0 ? FontWeight.bold
                          : FontWeight.w400,
                     // decoration: pageIndex == 0 ? TextDecoration.underline
                     //     : TextDecoration.none
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 1;
                    _pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.easeInOutSine);
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                  });
                },
                child: Text(
                  'Produce',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: pageIndex == 1 ? FontWeight.bold
                          : FontWeight.w400,
                     // decoration: pageIndex == 1 ? TextDecoration.underline
                     //     : TextDecoration.none
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    pageIndex = 2;
                    _pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 300), curve: Curves.linear);
                    //Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
                  });
                },
                child: Text(
                  'Restaurants',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: pageIndex == 2 ? FontWeight.bold
                        : FontWeight.w400,
                    // decoration: pageIndex == 1 ? TextDecoration.underline
                    //     : TextDecoration.none
                  ),
                ),
              ),

            ],
          ),
          SizedBox(height: 20.0,),
          Expanded(
            child: PageView(
              children: pages,
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),

            ),
          )
        ],
      ),
    );
  }
}
