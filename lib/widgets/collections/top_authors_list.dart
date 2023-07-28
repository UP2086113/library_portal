import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_portal/config/constants.dart';

import '../../../models/author.dart';
import '../../../utils/helper.dart';
import '../../views/primary/author_screen/author_details_screen.dart';

class TopAuthorsList extends StatelessWidget {
  final List<Author> authors;

  const TopAuthorsList({
    Key? key,
    required this.authors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135,
      child: authors.isEmpty
          ? const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: LinearProgressIndicator(),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: authors.length,
              itemBuilder: (ctx, i) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: Helper.hPadding),
                child: InkWell(
                  onTap: () {
                    log.d(authors[i]);

                    Get.to(() => AuthorDetailsScreen(
                          author: authors[i],
                        ));
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(authors[i].imageUrl),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${authors[i].firstName}\n${authors[i].lastName}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
