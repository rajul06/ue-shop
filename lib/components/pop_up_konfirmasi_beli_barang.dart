import 'package:flutter/material.dart';

void popUpKonfirmasiBeliBarang(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Center(
        child : AlertDialog(
        title: Text("Konfirmasi Pembelian", textAlign: TextAlign.center),
        content: Text("Apakah Anda yakin ingin membeli barang ini?", textAlign: TextAlign.center),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Batal"),
              ),

              SizedBox(width: 16,),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  showCheckmarkDialog(context);
                },
                child: Text("Bayar"),
              ),
            ],
          )
        ],
      ),
      );
    },
  );
}

void showCheckmarkDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle_outline, size: 96.0, color: Colors.green),
              SizedBox(height: 10.0),
              Text("Pembayaran berhasil."),
              SizedBox(height: 10.0),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          ),
        ),
      );
    },
  );
}
