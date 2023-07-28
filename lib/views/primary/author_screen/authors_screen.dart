import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/config/constants.dart';
import 'package:library_portal/models/author.dart';
import 'package:library_portal/views/primary/author_screen/author_details_screen.dart';

import '../../../widgets/common/ratings.dart';
import '../../../widgets/common/search_textfield.dart';

class AuthorsScreen extends StatefulWidget {
  const AuthorsScreen({super.key});

  @override
  State<AuthorsScreen> createState() => _AuthorsScreenState();
}

class _AuthorsScreenState extends State<AuthorsScreen> {
  List<Author> filteredAuthors = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredAuthors = authorsList;
    // Initialize the filtered book list with books of the selected genre
  }

  void filterAuthors(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        filteredAuthors = authorsList;
      } else {
        filteredAuthors = authorsList
            .where((author) =>
                author.firstName
                    .toLowerCase()
                    .contains(searchText.toLowerCase()) ||
                author.lastName
                    .toLowerCase()
                    .contains(searchText.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: null,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Authors',
              style: Get.textTheme.headlineLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15),
            //Search Field
            SearchTextField(
              fillColor: Colors.green.shade50,
              inputTextColor: Theme.of(context).primaryColor,
              hintTextColor: Colors.black38,
              controller: searchController,
              onChanged: filterAuthors,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                    thickness: 0.8,
                  ),
                  itemCount: filteredAuthors.length,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(7),
                        child: AuthorRow(author: filteredAuthors[index]));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AuthorRow extends StatelessWidget {
  final Author author;

  const AuthorRow({super.key, required this.author});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AuthorDetailsScreen(
          author: author,
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(author.imageUrl),
          ),
          // Container(
          //   height: 160,
          //   width: 115,
          //   margin: const EdgeInsets.all(8.0),
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: NetworkImage(author.imageUrl),
          //       fit: BoxFit.fill,
          //     ),
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          // ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${author.age} yrs old",
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    "${author.firstName} ${author.lastName}",
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 22.0),
                  ),
                  const SizedBox(height: 4.0),
                  Ratings(rating: author.rating)
                ],
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}
