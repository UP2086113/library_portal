import 'package:flutter/material.dart';

import '../../../utils/enums/page_type_enum.dart';
import '../../../utils/helper.dart';
import '../common/custom_text_field.dart';

class MemberActions extends StatefulWidget {
  const MemberActions({super.key});

  @override
  State<MemberActions> createState() => _MemberActionsState();
}

class _MemberActionsState extends State<MemberActions> {
  late String _action;
  late String _email;
  late String _bio;
  late String _password;
  late int _age;

  @override
  initState() {
    _action = '';
    super.initState();
  }

  Widget confirmCancelRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: Colors.red,
          ),
          onPressed: () {
            setState(() {
              _action = '';
            });
          },
          child: const Text(
            "Cancel",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          style: TextButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            foregroundColor: Colors.green,
          ),
          onPressed: () async {
            // final memberProvider =
            //     Provider.of<MembersProvider>(context, listen: false);
            // bool updated = await memberProvider.changeProfileData(
            //     email: _email, password: _password, bio: _bio, age: _age);
            setState(() {
              // showDialog(
              //   builder: (context) => AlertDialogBox(
              //     message: updated
              //         ? "Data updated successfully"
              //         : "Failed to update data",
              //   ),
              //   context: context,
              // );
              _action = '';
            });
          },
          child: const Text(
            "Confirm",
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget changePassword() {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustomTextField(
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock_outline,
          hintText: "Password",
          onSubmitted: (val) {
            setState(() {
              _password = val;
            });
          },
        ),
        const SizedBox(height: 10),
        CustomTextField(
          keyboardType: TextInputType.visiblePassword,
          prefixIcon: Icons.lock,
          hintText: "Confirm Password",
          onSubmitted: (val) {
            setState(() {
              if (_password != val) {
                // showDialog(
                //   builder: (context) => const AlertDialogBox(
                //     message: "Passwords don't match",
                //   ),
                //   context: context,
                // );
              }
              _password = val;
            });
          },
        ),
        const SizedBox(height: 10),
        confirmCancelRow(),
      ],
    );
  }

  Widget changeEmail() {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustomTextField(
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          hintText: "New Email",
          onSubmitted: (val) {
            setState(() {
              _email = val;
            });
          },
        ),
        const SizedBox(height: 10),
        confirmCancelRow(),
      ],
    );
  }

  Widget changeBio() {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustomTextField(
          keyboardType: TextInputType.text,
          prefixIcon: Icons.edit,
          maxLines: 5,
          hintText: "New Bio",
          onSubmitted: (val) {
            setState(() {
              _bio = val;
            });
          },
        ),
        const SizedBox(height: 10),
        confirmCancelRow(),
      ],
    );
  }

  Widget changeAge() {
    return Column(
      children: [
        const SizedBox(height: 10),
        CustomTextField(
          keyboardType: TextInputType.number,
          prefixIcon: Icons.leaderboard_outlined,
          maxLines: 1,
          hintText: "New Age",
          onSubmitted: (val) {
            setState(() {
              _age = int.tryParse(val) ?? 0;
            });
          },
        ),
        const SizedBox(height: 10),
        confirmCancelRow(),
      ],
    );
  }

  InkWell buildOptionButton(
      {required Color iconColor,
      required VoidCallback onTap,
      required String action,
      required Color actionColor}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 45,
        padding: const EdgeInsets.symmetric(
            horizontal: Helper.hPadding, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Action name
            Text(
              action,
              style: TextStyle(
                fontSize: 18,
                color: actionColor,
              ),
            ),

            const SizedBox(width: 10),

            //Forward icon
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: iconColor,
              size: 18,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_action == "bio") {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: Helper.hPadding, vertical: 8),
        child: changeBio(),
      );
    } else if (_action == "pass") {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(
            horizontal: Helper.hPadding, vertical: 8),
        child: changePassword(),
      );
    } else if (_action == "email") {
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Helper.hPadding, vertical: 8),
        color: Colors.white,
        child: changeEmail(),
      );
    } else if (_action == "age") {
      return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Helper.hPadding, vertical: 8),
        color: Colors.white,
        child: changeAge(),
      );
    }
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 5),
          buildOptionButton(
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              setState(() {
                _action = "pass";
              });
            },
            action: "Change password",
            actionColor: Colors.black,
          ),
          Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
          buildOptionButton(
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              setState(() {
                _action = "email";
              });
            },
            action: "Change email",
            actionColor: Colors.black,
          ),
          Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
          buildOptionButton(
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              setState(() {
                _action = "bio";
              });
            },
            action: "Change bio",
            actionColor: Colors.black,
          ),
          Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
          buildOptionButton(
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              setState(() {
                _action = "age";
              });
            },
            action: "Change age",
            actionColor: Colors.black,
          ),
          Divider(height: 10, thickness: 1.3, color: Colors.grey[300]),
          buildOptionButton(
            iconColor: Theme.of(context).primaryColor,
            onTap: () {
              Helper.navigateToPage(
                  context: context, page: PageType.MEMBERPREFS);
            },
            action: "Change preferences",
            actionColor: Colors.black,
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
