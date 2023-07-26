import 'package:flutter/material.dart';

import '../../../utils/helper.dart';
import '../../widgets/collections/book_collections_sheet.dart';

class BookCollectionsScreen extends StatefulWidget {
  const BookCollectionsScreen({super.key});

  @override
  State<BookCollectionsScreen> createState() => _BookCollectionsScreenState();
}

class _BookCollectionsScreenState extends State<BookCollectionsScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  late bool isSearchActive;

  @override
  void initState() {
    isSearchActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              //Title
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Helper.hPadding),
                  child: Text(
                    "Libreasy",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //Search bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: TextField(
                  onChanged: (val) => setState(() {
                    if (val.isNotEmpty) {
                      setState(() {
                        isSearchActive = true;
                      });
                    } else {
                      setState(() {
                        isSearchActive = false;
                      });
                    }
                  }),
                  keyboardType: TextInputType.name,
                  controller: _textEditingController,
                  cursorColor: Theme.of(context).primaryColor,
                  maxLines: 1,
                  textInputAction: TextInputAction.search,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(17),
                    filled: true,
                    fillColor: Colors.blue[900],
                    hintText: "What would you like to read?",
                    hintStyle: const TextStyle(color: Colors.white54),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(
                        color: Colors.white,
                        width: 1.4,
                        style: BorderStyle.solid,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              //Collections sheet
              isSearchActive
                  ? BookSearchSheet(
                      searchTerm: _textEditingController.text.trim(),
                    )
                  : const Column(
                      children: [
                        //Top Authors title
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: Helper.hPadding),
                          child: Text(
                            "Top Authors",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),

                        SizedBox(height: 10),

                        // TopAuthorsList(
                        //   authors: .authors,
                        // ),

                        SizedBox(height: 10),

                        //Collections Container
                        BookCollectionsSheet(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookSearchSheet extends StatelessWidget {
  final String searchTerm;

  const BookSearchSheet({Key? key, required this.searchTerm}) : super(key: key);

  Padding buildCollectionName(String text, context, {author = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Text(
        text,
        style: author
            ? const TextStyle(color: Colors.white, fontSize: 20)
            : Theme.of(context).textTheme.displaySmall,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
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
          const SizedBox(height: 15),

          //New collections title
          buildCollectionName("Search Books", context),

          const SizedBox(height: 10),

          //New collections list
          // Expanded(
          //   child: Consumer<PublishesProvider>(
          //     builder: (ctx, pubProv, child) => BooksList(
          //       books: pubProv.books
          //           .where((book) => book.name.contains(searchTerm))
          //           .toList(),
          //     ),
          //   ),
          // ),

          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
