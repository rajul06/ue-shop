import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String productName;
  final ImageProvider<Object> productImage;
  final String productPrice;
  final String productDeskription;

  const ProductDetailPage({
    Key? key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.productDeskription
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nama Barang', style: TextStyle (color :Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: productImage,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Divider(
              color: Colors.blue[500],
              thickness: 25,
              height: 10,
              indent: 0,
              endIndent: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp. $productPrice',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    productName,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 50),
                  Text(
                    'Deskripsi',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                    Text(
                      productDeskription,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Hubungi Penjual'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Beli'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(180, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
