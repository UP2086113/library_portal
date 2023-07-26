import 'package:flutter/material.dart';

import '../common/search_textfield.dart';
import 'authors_list.dart';

class AuthorListingsSheet extends StatefulWidget {
  const AuthorListingsSheet({super.key});

  @override
  State<AuthorListingsSheet> createState() => _AuthorListingsSheetState();
}

class _AuthorListingsSheetState extends State<AuthorListingsSheet> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            //Search Field
            SearchTextField(
              fillColor: Colors.blueGrey.shade50,
              inputTextColor: Theme.of(context).primaryColor,
              hintTextColor: Colors.black38,
              controller: _textEditingController,
              onChanged: (val) => setState(() {}),
            ),

            const SizedBox(height: 20),

            //Authors list
            Expanded(
              child: AuthorsList(
                searchTerm: _textEditingController.text.trim(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
