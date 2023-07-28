import 'package:flutter/material.dart';
import 'package:library_portal/config/controllers.dart';

import '../../../../models/author.dart';
import '../../../../utils/helper.dart';
import '../../../widgets/authors/author_details_sheet.dart';

class AuthorDetailsScreen extends StatelessWidget {
  const AuthorDetailsScreen({super.key, required this.author});
  final Author author;

  @override
  Widget build(BuildContext context) {
    // final future = authorDetailsProvider.getAuthorDetails(aId);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: publisherController.getAuthorBooks(author.id),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              var books = snapshot.data!;
              var genre = publisherController.getAuthorGenres(author.id);
              return SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    //Back arrow & title
                    buildAppBar(context),

                    const SizedBox(height: 30),

                    // Book Details Sheet
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: AuthorDetailsSheet(
                        authorImageUrl: author.imageUrl,
                        authorName: "${author.firstName} ${author.lastName}",
                        authorAge: author.age,
                        authorCountry: author.country,
                        authorRating: author.rating,
                        genres: genre,
                        books: books,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Text('No data available.');
            }
          },
        ),
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
              "Author Details",
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
