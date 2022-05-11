import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tmdb_movie/auth.dart/Login.dart';
import 'package:tmdb_movie/auth.dart/signup.dart';
import 'package:tmdb_movie/controller/api_services.dart';
import 'package:tmdb_movie/models/model.dart' as model;
import 'package:tmdb_movie/pages.dart/homescreen.dart';
import '../constants/colors.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  var selectedImage = ''.obs;
  // File? get profilePhoto => File(selectedImage);
  User get user => _user.value!;

  @override
  void onReady() {
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
    super.onReady();
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const Loginscreen());
    } else {
      Get.offAll(() => const Home());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage == null) {
      Get.snackbar('Profile Picture', 'Your profile picture is not selected!');
    } else {
      selectedImage.value = pickedImage.path;
    }
  }

  // upload to firebase storage
  Future<String> uploadToStorage(File image) async {
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // registering the user
  void registerUser(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        // save out user to our ath and firebase firestore
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String downloadurl = await uploadToStorage(image);
        model.User user = model.User(
          name: username,
          email: email,
          uid: cred.user!.uid,
          profilePhoto: downloadurl,
        );
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        debugPrint('please fill category');
      }
    } catch (e) {
      // Get.snackbar(
      //   'Error Creating Account',
      //   e.toString(),
      // );
      // Get.defaultDialog(title: e.toString());
      debugPrint('Error creating account');
      debugPrint(e.toString());
    }
  }

  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() async {
    await firebaseAuth.signOut();
  }
}
