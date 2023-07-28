import 'package:flutter/material.dart';
import 'package:library_portal/config/controllers.dart';

import '../../../../../utils/enums/book_issue_status_enum.dart';
import '../../../../../utils/helper.dart';
import '../../../models/book.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            //Menu Title
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: Text(
                  "Your Books",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: MyBorrowsList(
                borrowedBooks: publisherController.getBorrowedBooks(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyBorrowsList extends StatelessWidget {
  final List<Book> borrowedBooks;

  const MyBorrowsList({Key? key, required this.borrowedBooks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      itemCount: borrowedBooks.length,
      itemBuilder: (ctx, i) => BorrowListItem(
        status: publisherController.getBookIssueStatus(borrowedBooks[i]),
        bookName: borrowedBooks[i].name,
        bookImageUrl: borrowedBooks[i].imageUrl,
        authorName:
            publisherController.getBookAuthor(borrowedBooks[i].authorId),
        issueDate: Helper.datePresenter(borrowedBooks[i].issueDate),
        date: Helper.datePresenter(
          borrowedBooks[i].returnedOn ??
              borrowedBooks[i].issueDate!.add(const Duration(days: 7)),
        ),
      ),
    );
  }
}

class BorrowListItem extends StatelessWidget {
  final String bookName;
  final String bookImageUrl;
  final String authorName;
  final String issueDate;
  final String date;
  final BookIssueStatus status;

  const BorrowListItem({
    Key? key,
    required this.bookName,
    required this.authorName,
    required this.issueDate,
    required this.date,
    required this.bookImageUrl,
    required this.status,
  }) : super(key: key);

  Color getIssueStatusColor() {
    switch (status) {
      case BookIssueStatus.DUE:
        return Colors.yellow.shade700;
      case BookIssueStatus.OVERDUE:
        return Colors.red;
      default:
        return Colors.green;
    }
  }

  String getIssueStatusText() {
    switch (status) {
      case BookIssueStatus.DUE:
        return "PENDING";
      case BookIssueStatus.OVERDUE:
        return "OVERDUE";
      default:
        return "RETURNED";
    }
  }

  IconData getIssueStatusIcon() {
    switch (status) {
      case BookIssueStatus.DUE:
        return Icons.timer;
      case BookIssueStatus.OVERDUE:
        return Icons.error_outline;
      default:
        return Icons.check;
    }
  }

  String getDate() {
    switch (status) {
      case BookIssueStatus.DUE:
        return "Due on: $date";
      case BookIssueStatus.OVERDUE:
        return "Was due on: $date";
      default:
        return "Returned on: $date";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 180,
      child: Stack(
        children: [
          //Borrow details card
          Positioned.fill(
            top: 35,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 3, 12),
                    child: Row(
                      children: [
                        const SizedBox(width: 109),

                        //Borrow details
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //Book Title
                              Flexible(
                                fit: FlexFit.loose,
                                child: Text(
                                  bookName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),

                              const SizedBox(height: 3),

                              //Author name
                              Text(
                                "By $authorName",
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),

                              const SizedBox(height: 10),

                              //Issue date
                              Text(
                                "Issued on: $issueDate",
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),

                              const SizedBox(height: 3),

                              //If returned, then change to return date
                              Text(
                                getDate(),
                                style: const TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Status
                  Container(
                    height: double.infinity,
                    width: 32,
                    decoration: BoxDecoration(
                      color: getIssueStatusColor(),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: RotatedBox(
                        quarterTurns: 3,
                        child: Text(
                          getIssueStatusText(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 1.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Book Image
          Positioned(
            left: 13,
            child: Align(
              alignment: Alignment.topLeft,
              child: SizedBox(
                height: 155,
                width: 100,
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: Colors.black,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.network(
                    bookImageUrl,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),

          //Borrow status
          Positioned(
            right: 20,
            top: 16,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(7),
                child: Icon(
                  getIssueStatusIcon(),
                  size: 22,
                  color: getIssueStatusColor(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
