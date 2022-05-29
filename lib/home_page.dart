import 'package:flutter/material.dart';
import 'package:vat_calculator/function.dart';

class HomePage extends StatelessWidget {
  TextEditingController cAmountWithVat = TextEditingController();
  Future<void> showMyDialog(BuildContext context, double amt) async {
    double amountWithvat = amt;
    double actualAmount = vatCalc(amountWithvat);
    double vatAmount = amountWithvat - actualAmount;

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Result"),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text("Amount without vat :${actualAmount.toStringAsFixed(2)}"),
                Text("Total vat :${vatAmount.toStringAsFixed(2)}"),
                Text("Amount with vat : ${amountWithvat.toStringAsFixed(2)}"),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
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
        title: const Text('VAT CALCULATOR'),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            controller: cAmountWithVat,
            decoration: const InputDecoration(
                labelText: "Enter the Amount with VAT", hintText: 'Hint:10300'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () =>
                  {showMyDialog(context, double.parse(cAmountWithVat.text))},
              child: const Text('Calculate'),
            ),
          )
        ],
      ),
    );
  }
}
