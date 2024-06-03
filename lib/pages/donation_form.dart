import 'package:flutter/material.dart';
import 'package:gibu/components/squared_radio_button.dart';
import 'package:gibu/components/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:firebase_auth/firebase_auth.dart";

class DonationForm extends StatefulWidget {
  const DonationForm({super.key});

  @override
  State<DonationForm> createState() => _DonationForm();
}

class _DonationForm extends State<DonationForm> {
  int _selectedAmount = 1;
  int _selectedMonth = 1;
  bool _isChecked = false;
  final TextEditingController _controller = TextEditingController();

  createContribution({campaignName, campaignId, raisedMoney}) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'contributions': FieldValue.arrayUnion([
        {
          'campaignName': campaignName,
          'campaignId': campaignName,
          'monthsLeft': _selectedMonth - 1,
        },
      ]),
    });

    FirebaseFirestore.instance.collection('campaigns').doc(campaignId).update({
      'raised': raisedMoney + _selectedAmount,
    });

    if (context.mounted) {
      await Navigator.pushNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 170,
                      height: 150,
                      child: Image.network(
                        arg['heroPath'],
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Text(
                          "Your supporting ${arg["campaignTitle"]} by ${arg["fundraiserName"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Text("Enter your donation: ",
                    style: TextStyle(fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                ...[1, 10, 25, 50, 100].map((amount) => SquaredRadioButton<int>(
                      title: Text('\$$amount'),
                      value: amount,
                      groupValue: _selectedAmount,
                      leading: (_selectedAmount == amount) ? '⚫' : '⚪',
                      onChanged: (value) {
                        setState(() {
                          _selectedAmount = value!;
                          _controller.clear(); // Clear the TextField
                        });
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400),
                        ),
                        fillColor: Colors.grey.shade200,
                        prefixText: "\$ ",
                        filled: true,
                        labelText: 'Other amount ${arg['fundraiserName']}',
                        hintStyle: TextStyle(color: Colors.grey[500])),
                    onChanged: (value) {
                      setState(() {
                        _selectedAmount =
                            int.tryParse(value) ?? _selectedAmount;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: [
                    ...[1, 6, 12].map((month) => SquaredRadioButton<int>(
                          title: (month == 1)
                              ? const Text('Month')
                              : const Text("Months"),
                          value: month,
                          groupValue: _selectedMonth,
                          leading: "  $month  ",
                          onChanged: (value) {
                            setState(() {
                              _selectedMonth = value!;
                            });
                          },
                        )),
                  ],
                ),
                const SizedBox(height: 40),
                Card(
                  color: const Color.fromARGB(224, 23, 77, 77),
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                        CheckboxListTile(
                          title: const Text("Use as billing name",
                              style: TextStyle(color: Colors.white)),
                          value: _isChecked,
                          activeColor: const Color.fromARGB(255, 58, 170, 129),
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue!;
                            });
                          },
                          controlAffinity: ListTileControlAffinity.leading,
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Card Number',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const Row(
                          children: [
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'MM/YY',
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  labelText: 'CVV',
                                  labelStyle: TextStyle(color: Colors.white),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            ),
                          ],
                        ),
                        const TextField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Name on Card',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Button(
                  text: "Donate",
                  onTap: () => createContribution(
                      campaignName: arg["campaignTitle"],
                      campaignId: arg["campaignId"],
                      raisedMoney: arg["raised"]),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ));
  }
}
