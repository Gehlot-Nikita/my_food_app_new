import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffcbcbcb),
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: const Color(0xffd6b738),
        elevation: 0,
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Color(0xffd4d181),
            radius: 18,
            child: Icon(Icons.search, color: Colors.black),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Color(0xffd4d181),
            radius: 18,
            child: Icon(Icons.shopping_bag_outlined, color: Colors.black),
          ),
          SizedBox(width: 10),
        ],
      ),

      // ----------------------------- FIXED -----------------------------
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔥 TOP BANNER
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.squarespace-cdn.com/content/v1/5b35b18af93fd4d75e591f4a/1543985895500-98LX8K027J1RWKQWFGAH/HS-Website---Vegetable-Products.jpg?format=2500w",
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Vegi",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 60,
                      left: 20,
                      child: Text(
                        "30% Off",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const Positioned(
                      top: 110,
                      left: 20,
                      child: Text(
                        "On all vegetables products",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 TITLE ROW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Herbs & Seasonings',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'view all',
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // ----------------------------- GRID (4 ITEMS) -----------------------------
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                childAspectRatio: 0.68,
                children: [
                  productCard(),
                  productCard(),
                  productCard(),
                  productCard(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------
  // 🔥 YOUR PRODUCT CARD (UNCHANGED)
  // ---------------------------------------------------
  Widget productCard() {
    return Container(
      height: 260,
      width: 165,
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xffd9dad9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              "https://wallpapers.com/images/hd/fresh-basil-leaves-isolated-png-2gnlb7jfddw0pjsc.jpg",
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fresh Basil",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  "50\$ / 50 Gram",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                SizedBox(height: 5),

                Row(
                  children: [
                    // Gram Button
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "50 Gram",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),
                            SizedBox(width: 6),
                            Icon(Icons.circle, size: 6, color: Colors.yellow),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(width: 5),

                    // Quantity Selector
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.remove, size: 16),
                          SizedBox(width: 4),
                          Text("1",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(width: 4),
                          Icon(Icons.add, size: 16),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
