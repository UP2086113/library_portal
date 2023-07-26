import 'package:flutter/material.dart';

import '../../../utils/helper.dart';
import '../../widgets/authors/author_listings_sheet.dart';

class AuthorsGalleryScreen extends StatelessWidget {
  const AuthorsGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            //Menu Title
            Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: Text(
                  "Authors",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
            ),

            const SizedBox(height: 10),

            //Author listings sheet
            const AuthorListingsSheet(),
          ],
        ),
      ),
    );
  }
}
