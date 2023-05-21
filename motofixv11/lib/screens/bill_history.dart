import 'package:flutter/material.dart';
import 'package:motofixv11/homepage.dart';
import 'package:motofixv11/screens/home_page.dart';
import 'package:motofixv11/widget/services.dart';
class Invoice {
  final String serviceName;
  final DateTime date;
  final double price;
  final String mechanicName;

  Invoice({
    required this.serviceName,
    required this.date,
    required this.price,
    required this.mechanicName,
  });
}

class RecentInvoicesScreen extends StatelessWidget {
  List<Invoice> invoices = [
    Invoice(serviceName: 'Oil change', date: DateTime(2023,5,21), price: 60.000, mechanicName: 'Tran Anh Tu'),
  ];

  void addInvoices(invoice){
    invoices.add(invoice);
  }
  void replaceInvoiceList(List<Invoice> invoiceList){
    invoices = invoiceList;
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Recent Invoices'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white), // Set arrow back color to white
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'MotoFix'), // Navigate to the home page
              ),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: invoices.length,
        itemBuilder: (context, index) {
          final invoice = invoices[index];
          return ListTile(
            title: Text(invoice.serviceName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: ${invoice.date.toString()}'),
                Text('Price: ${invoice.price.toString()}'),
                Text('Mechanic: ${invoice.mechanicName}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
