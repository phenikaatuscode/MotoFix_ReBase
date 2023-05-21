import 'package:flutter/material.dart';
import 'package:motofixv11/screens/bill_history.dart';
import 'package:motofixv11/homepage.dart';
import 'package:xml/xml.dart' as xml;

import 'dart:io';

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

class ServiceDetailScreen extends StatelessWidget {
  final String serviceName;
  final String serviceDetail;
  final double kilometer;
  final double price;
  final String mechanicName;
  final String mechanicDetail;
  final RecentInvoicesScreen invoicesScreen;

  ServiceDetailScreen({
    required this.serviceName,
    required this.serviceDetail,
    required this.kilometer,
    required this.price,
    required this.mechanicName,
    required this.mechanicDetail,
    required this.invoicesScreen,
  });

  void _showBookingConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Booking'),
          content: Text('Do you want to book this service?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _addServiceToBillHistory(); // Add service detail to bill history
                _showBookingSuccess(context); // Show success message
              },
              child: Text('Yes'),

            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  void _addServiceToBillHistory() {
    // Add service detail to bill history
    Invoice invoice = Invoice(
      serviceName: serviceName,
      date: DateTime.now(),
      price: price,
      mechanicName: mechanicName,
    );

    invoicesScreen.addInvoices(invoice);
  }

  void _showBookingSuccess(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Successful'),
          content: Text('Your service has been booked successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyHomePage(title: 'MotoFix'),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service: $serviceName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Service Detail: $serviceDetail',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 20),
              Text(
                'Kilometer: $kilometer km',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 10),
              Text(
                'Price: $price VND',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 20),
              Text(
                'Mechanic: $mechanicName',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Mechanic Detail: $mechanicDetail',
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
              SizedBox(height: 20),
              Center(
                child: Image.asset(
                  'images/picture/oil_change.webp',
                  width: 400,
                  height: 400,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _showBookingConfirmation(context);
                },
                child: Text('Book'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
