import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  final String membershipDate;
  final String bio;
  final String imageUrl;

  const ProfileScreen({
    super.key,
    this.name = "Hassan",
    this.membershipDate = '2023',
    this.bio = 'University Student',
    this.imageUrl =
        "https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Image.asset('assets/images/profile_back.png', fit: BoxFit.cover),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'Profile',
                    style: Get.textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(imageUrl),
                      radius: Get.size.height * 0.078,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xffF2F6F7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const SizedBox(height: 16),
                          Text(
                            name,
                            style: Get.textTheme.displayLarge
                                ?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Membership Date: $membershipDate',
                            style: Get.textTheme.displaySmall
                                ?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            bio,
                            style: Get.textTheme.headlineMedium
                                ?.copyWith(color: Colors.black),
                          ),
                          const SizedBox(height: 32),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement logout functionality
                            },
                            child: const Text('Logout'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // TODO: Implement password change functionality
                            },
                            child: const Text('Change Password'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
