import 'package:flutter/material.dart';
import '../../components/pop_up_konfirmasi_beli_barang.dart';
import '../../components/pop_up_konfirmasi_log_out.dart';


class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String _alamat = '';
  String _pengiriman = 'JNE';
  String _pembayaran = 'Transfer Bank';
  double _totalHarga = 250000.0;
  double _ongkir = 15000.0;
  double _totalPembayaran = 0.0;

  void _hitungTotalPembayaran() {
    setState(() {
      _totalPembayaran = _totalHarga + _ongkir;
    });
  }

  @override
  void initState() {
    super.initState();
    _hitungTotalPembayaran();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beli Barang', style: TextStyle (color :Colors.black)),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Barang yang dibeli',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80.0,
                  height: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/test_images.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sepatu Olahraga',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        'Rp 250.000',
                        style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.0),

            Text(
              'Alamat Pengiriman',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(
                hintText: 'Alamat pengiriman',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              onChanged: (value) {
                setState(() {
                  _alamat = value;
                });
              },
            ),

            SizedBox(height: 24.0),
            Text(
              'Jasa Pengiriman',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _pengiriman,
              onChanged: (value) {
                setState(() {
                  _pengiriman = value!;
                  _ongkir = _pengiriman == 'JNE' ? 15000.0 : 20000.0;
                  _hitungTotalPembayaran();
                });
              },
              items: <String>['JNE', 'J&T', 'Pos Indonesia'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            Text(
              'Metode Pembayaran',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            DropdownButton<String>(
              value: _pembayaran,
              onChanged: (value) {
                setState(() {
                  _pembayaran = value!;
                });
              },
              items: <String>['Transfer Bank', 'COD', 'OVO'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Harga',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $_totalHarga',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Ongkos Kirim',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $_ongkir',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            Divider(thickness: 1.0, height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rp $_totalPembayaran',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 150),

            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  popUpKonfirmasiBeliBarang(context);
                },
                child: Text('Lakukan Pembayaran'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(400, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}