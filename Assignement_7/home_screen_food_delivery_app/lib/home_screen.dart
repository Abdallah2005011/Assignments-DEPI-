import 'package:flutter/material.dart';
import 'package:home_screen_food_delivery_app/product_item_model.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:  Text(
          'Food Delivery',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon:  Icon(Icons.shopping_cart, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSearchBar(),
            _buildSpecialOffersList(),
            _buildSectionHeader('Featured Items'),
            _buildFilterTabs(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics:  NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.72,
                ),
                itemCount: ProductItemModel.productsList.length,
                itemBuilder: (context, i) {
                  return _buildProductItem(
                    product: ProductItemModel.productsList[i],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin:  EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          fillColor:  Color(0xFFFDE8E8),
          filled: true,
          hintText: 'Search for food',
          prefixIcon:  Icon(Icons.search, color: Colors.redAccent),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialOffersList() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding:  EdgeInsets.symmetric(horizontal: 16),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 280,
            margin:  EdgeInsets.only(right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image:  DecorationImage(
                            image: AssetImage('assets/burger_offer.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        left: 12,
                        child: Container(
                          padding:  EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child:  Text(
                            'NOED',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 SizedBox(height: 8),
                 Text(
                  'Special Offer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding:  EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(
        title,
        style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding:  EdgeInsets.all(4),
      decoration: BoxDecoration(
        color:  Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: _buildToggleBtn('List View', isSelected: false)),
          Expanded(child: _buildToggleBtn('Grid View', isSelected: true)),
        ],
      ),
    );
  }

  Widget _buildToggleBtn(String text, {required bool isSelected}) {
    return Container(
      padding:  EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.redAccent : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildProductItem({required ProductItemModel product}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              margin:  EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(product.image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Text(product.name, style:  TextStyle(fontWeight: FontWeight.bold)),
          Text('${product.price} USD', style:  TextStyle(color: Colors.grey, fontSize: 10)),
          Container(
            width: double.infinity,
            margin:  EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            padding:  EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color:  Color(0xFFFDE8E8),
              borderRadius: BorderRadius.circular(10),
            ),
            child:  Text(
              'Add to Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Colors.grey,
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}