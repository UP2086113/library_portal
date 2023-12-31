import 'package:flutter/material.dart';

import '../../../models/author.dart';
import '../../../utils/helper.dart';
import '../common/ratings.dart';

class AuthorsList extends StatelessWidget {
  final String searchTerm;

  const AuthorsList({Key? key, required this.searchTerm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Author> authors = [];
    authors = authors.where((author) {
      return author.firstName.contains(searchTerm) ||
          author.lastName.contains(searchTerm);
    }).toList();
    return ListView.separated(
      itemCount: authors.length,
      separatorBuilder: (ctx, i) => const Divider(
        thickness: 1,
        height: 36,
      ),
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {
          //TODO:handle tap here
        },
        child: AuthorsListItem(
          authorAge: authors[i].age,
          authorName: "${authors[i].firstName} ${authors[i].lastName}",
          authorRating: authors[i].rating,
          authorImageUrl: authors[i].imageUrl,
        ),
      ),
    );
  }
}

class AuthorsListItem extends StatelessWidget {
  const AuthorsListItem({
    Key? key,
    required this.authorAge,
    required this.authorRating,
    required this.authorName,
    required this.authorImageUrl,
  }) : super(key: key);

  final int authorAge;
  final int authorRating;
  final String authorName;
  final String authorImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Helper.hPadding),
      child: Row(
        children: [
          //Container box
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(authorImageUrl),
          ),

          const SizedBox(width: 20),

          //Titles
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Author age
              Text(
                "$authorAge yrs old",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 10),

              //Author name (F+L)
              Text(
                authorName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              //Author rating
              Ratings(rating: authorRating),
            ],
          ),

          const Spacer(),

          //Arrow
          const Padding(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black26,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
