import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone_app/screens/add_post_screen.dart';
import 'package:instagram_clone_app/screens/feed_screen.dart';
import 'package:instagram_clone_app/screens/profile_screen.dart';
import 'package:instagram_clone_app/screens/search_screen.dart';
import 'package:instagram_clone_app/utils/colors.dart';

const webScreenSize = 600;

var homeScreenChildren = [
  const FeedScreen(),
  const SearchScreen(),
  const AddPostScreen(),
  Container(
    color: mobileBackgroundColor,
    child: const Center(child: Text("Favorite")),
  ),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];

var bottomNavigationBarItems = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.add), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
];
