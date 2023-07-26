import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/genre.dart';
import '../../providers/genres_provider.dart';

class MemberGenresScreen extends StatelessWidget {
  const MemberGenresScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genreProvider = Provider.of<GenresProvider>(context);
    // final membersProvider =
    //     Provider.of<MembersProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    color: Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    // membersProvider.resetTempPreferences();
                    Navigator.of(context).pop();
                  },
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 50),
            const Text(
              "What genre you wish to read?",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 30),

            //Genre Chips
            genreProvider.genres.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GenreItemsList(genreProvider.genres),
                  ),

            const Spacer(),

            //Done button
            InkWell(
              onTap: () async {
                // await membersProvider.changeMemberPreferences();
                Navigator.of(context).pop();
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Done",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(width: 2),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}

class GenreItemsList extends StatelessWidget {
  final List<Genre> genres;

  const GenreItemsList(this.genres, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        ...genres
            .map(
              (genre) => GenreChipItem(
                genre: genre,
              ),
            )
            .toList(),
      ],
    );
  }
}

class GenreChipItem extends StatefulWidget {
  final Genre genre;

  const GenreChipItem({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  State<GenreChipItem> createState() => _GenreChipItemState();
}

class _GenreChipItemState extends State<GenreChipItem> {
  late bool isActive;

  @override
  Widget build(BuildContext context) {
    // final membersProvider =
    //     Provider.of<MembersProvider>(context, listen: false);
    // isActive = membersProvider.isPreference(widget.genre);
    isActive = false;
    return FilterChip(
      elevation: 0,
      showCheckmark: false,
      backgroundColor: Colors.blue[900],
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      labelPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      label: Text(widget.genre.name),
      labelStyle: TextStyle(
        color: isActive ? Colors.white : Colors.white30,
        fontSize: 16,
      ),
      selected: isActive,
      selectedColor: Colors.orange,
      onSelected: (value) {
        setState(() {
          isActive = !isActive;
          // isActive.toggleGenre(value, widget.genre);
        });
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
