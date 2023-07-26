import 'package:flutter/material.dart';

import '../../../utils/helper.dart';
import '../../widgets/common/genre_chips.dart';
import '../../widgets/members/member_actions.dart';

class MemberProfileScreen extends StatelessWidget {
  const MemberProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final membersProvider = Provider.of<MembersProvider>(context);
    // final genreProvider = Provider.of<GenresProvider>(context, listen: false);
    const currMember = null;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: currMember == null
              ? const CircularProgressIndicator()
              : FutureBuilder(
                  future: genreProvider.getMemberGenres(currMember.id),
                  builder: (ctx, snapshot) {
                    if (!snapshot.hasData) {
                      return const CircularProgressIndicator();
                    }
                    membersProvider.setMemberPreferences(snapshot.data);
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          //DP
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: currMember.hasImage
                                ? CircleAvatar(
                                    radius: 55,
                                    backgroundImage:
                                        NetworkImage(currMember.imageUrl),
                                  )
                                : CircleAvatar(
                                    radius: 55,
                                    backgroundColor: Colors.white,
                                    child: Icon(
                                      Icons.person,
                                      size: 65,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                          ),

                          const SizedBox(height: 10),

                          //Name
                          Text(
                            "${currMember.firstName} ${currMember.lastName}",
                            style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 20),

                          //Member details
                          Container(
                            color: Colors.white,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                horizontal: Helper.hPadding),
                            child: Column(
                              children: [
                                const SizedBox(height: 20),

                                //Email
                                Text(
                                  "${currMember.email}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                //Age
                                Text(
                                  "${currMember.age} yrs old",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                //Membership date
                                Text(
                                  "Membership date: ${Helper.datePresenter(currMember.startDate)}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),

                                const SizedBox(height: 12),

                                //Member bio
                                Text(
                                  currMember.bio,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const SizedBox(height: 15),

                                GenreChips(
                                  color: Theme.of(context).primaryColor,
                                  genres: snapshot.data,
                                ),

                                const SizedBox(height: 20),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          //Member Actions
                          const MemberActions(),

                          const SizedBox(height: 20),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
