import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../books/genres_books_list.dart';
import '../common/search_textfield.dart';

class BookListingsSheet extends StatefulWidget {
  final PageController genreController;

  const BookListingsSheet({
    Key? key,
    required this.genreController,
  }) : super(key: key);

  @override
  State<BookListingsSheet> createState() => _BookListingsSheetState();
}

class _BookListingsSheetState extends State<BookListingsSheet> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final genreProvider = Provider.of<GenresProvider>(context, listen: false);

    return Selector<GenresProvider, int>(
      selector: (ctx, genreProv) => genreProv.genres.length,
      builder: (ctx, noOfGenres, _) => Expanded(
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
                fillColor: Colors.blueGrey[50],
                inputTextColor: Theme.of(context).primaryColor,
                hintTextColor: Colors.black38,
                controller: _textEditingController,
                onChanged: (val) => setState(() {}),
              ),

              const SizedBox(height: 20),

              //Books list
              Expanded(
                child: PageView.builder(
                  controller: widget.genreController,
                  itemCount: noOfGenres,
                  onPageChanged: genreProvider.setActiveIndex,
                  itemBuilder: (ctx, i) => GenreBooksList(
                    gId: genreProvider.activeGenreId,
                    searchTerm: _textEditingController.text.trim(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
