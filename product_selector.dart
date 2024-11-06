import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductSelectionPage(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.grey[600],
        ),
      ),
    );
  }
}

class ProductSelectionPage extends StatefulWidget {
  @override
  _ProductSelectionPageState createState() => _ProductSelectionPageState();
}

class _ProductSelectionPageState extends State<ProductSelectionPage> {
  final List<Map<String, dynamic>> products = [
    {
      "name": "Spor Ayakkabı",
      "price": 120.0, // Fiyat TL üzerinden
    },
    {
      "name": "Koşu Ayakkabısı",
      "price": 150.0, // Fiyat TL üzerinden
    },
    {
      "name": "Günlük Ayakkabı",
      "price": 100.0, // Fiyat TL üzerinden
    },
    {
      "name": "Sneaker",
      "price": 130.0, // Fiyat TL üzerinden
    },
    {
      "name": "Klasik Ayakkabı",
      "price": 200.0, // Fiyat TL üzerinden
    },
  ];

  int selectedProductIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text("Ürün Seçimi", style: TextStyle(color: Colors.orange)), // Başlık değiştirildi
      ),
      body: Column(
        children: [
          // Yatay ListView (Horizontal ListView)
          Container(
            height: 70,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedProductIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selectedProductIndex == index
                          ? Colors.orange
                          : Colors.grey[400],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        products[index]["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedProductIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          // GridView Ürün Adı ve Fiyatı ile
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedProductIndex == index;
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedProductIndex = index;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.orange : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            products[index]["name"],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isSelected ? Colors.white : Colors.grey[800],
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "${products[index]["price"]} TL", // Fiyat TL olarak gösteriliyor
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? Colors.white : Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
