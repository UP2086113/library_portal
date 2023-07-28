import 'package:flutter/material.dart';
import 'package:library_portal/utils/enums/book_issue_status_enum.dart';
import 'package:library_portal/widgets/common/bottom_button_bar.dart';

import '../../../config/constants.dart';
import '../../../config/controllers.dart';
import '../../../models/book.dart';
import '../../../utils/helper.dart';
import 'book_details_sheet.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  const BookDetailsScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            //Back arrow & title
            buildAppBar(context),

            const SizedBox(height: 30),

            // Book Details Sheet
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: BookDetailsSheet(book: book),
            ),
          ],
        ),
      )),
      bottomNavigationBar: BottomButtonBar(
        color: Colors.green,
        label: "BORROW",
        onPressed: () async {
          log.d('Borrow btn pressed');
          var status = publisherController.getBookIssueStatus(book);
          log.d(status);
          final bool isAvailable =
              !(status.name != BookIssueStatus.RETURNED.name);
          // Confirmation popup
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            builder: (_) => Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                children: [
                  Container(
                    width: 70,
                    height: 5,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 25,
                  ),
                  const SizedBox(height: 30),
                  Icon(
                    isAvailable ? Icons.check_circle : Icons.cancel,
                    color: isAvailable ? Colors.green : Colors.red,
                    size: 85,
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      isAvailable
                          ? "This book has been issued for 1 month"
                          : "This book is currently not available for issue",
                      style: const TextStyle(
                        fontSize: 21,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Padding buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Row(
        children: [
          //Arrow
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Padding(
              padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white38,
              ),
            ),
          ),

          const SizedBox(width: 30),

          //Page Title
          Center(
            child: Text(
              "Book Details",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
