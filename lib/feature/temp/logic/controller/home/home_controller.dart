import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {

  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final imageUrlController = TextEditingController();

  var imageUrl = ''.obs; // RxString لتحديث الصورة Live

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    loadUserData();

    // تحديث RxString بمجرد الكتابة في خانة الصورة
    imageUrlController.addListener(() {
      imageUrl.value = imageUrlController.text;
    });
  }

  Future<void> loadUserData() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final doc = await _firestore.collection('users').doc(uid).get();
    if (doc.exists) {
      nameController.text = doc['name'] ?? '';
      bioController.text = doc['bio'] ?? '';
      imageUrl.value = doc['imageUrl'] ?? '';
      imageUrlController.text = imageUrl.value;
    }
  }

  Future<void> updateProfile() async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    await _firestore.collection('users').doc(uid).update({
      'name': nameController.text.trim(),
      'bio': bioController.text.trim(),
      'imageUrl': imageUrlController.text.trim(),
    });

    Get.snackbar(
      "Success",
      "Profile updated successfully",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.8),
      colorText: Colors.white,
    );
  }
}