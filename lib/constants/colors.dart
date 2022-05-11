import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_movie/controller/auth.dart';

const backgroudcolor = Color(0xFFF7DAD9);
const primarycolor = Color(0xFF550c18);
const secondarycolor = Color(0xff443730);
const buttoncolor = Color(0xff786452);
const textcolor = Color(0xff443730);

var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

var authController = AuthController.instance;
