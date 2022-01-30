import 'package:flutter/material.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({
    required this.titleController,
    required this.amountController,
    required this.addNewTransaction,
  });

  final TextEditingController titleController;
  final TextEditingController amountController;
  final Function addNewTransaction;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  void onSubmit() {
    String amountStr = widget.amountController.text;
    String title = widget.titleController.text;
    if (!title.isEmpty && double.tryParse(amountStr) != false) {
      double amount = double.parse(amountStr); 
      if (amount >= 0) {
        
        widget.addNewTransaction(amount: amount, title: widget.titleController.text);
        widget.titleController.clear();
        widget.amountController.clear();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: widget.titleController,
              decoration: InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => onSubmit(),
            ),
            TextField(
              controller: widget.amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => onSubmit(),
            ),
            TextButton(
              onPressed: onSubmit,
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.purple),
              ),
              child: Text('Add Transaction'),
            ),
          ],
        ),
      ),
    );
  }
}
