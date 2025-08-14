import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UsersListController extends GetxController {
  var usersList = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;

  final _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    try {
      isLoading.value = true;
      final snapshot = await _firestore.collection('users').get();
      usersList.value = snapshot.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      print("Error fetching users: $e");
    } finally {
      isLoading.value = false;
    }
  }
}