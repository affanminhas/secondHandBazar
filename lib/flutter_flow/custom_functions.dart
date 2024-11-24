import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double multiplyPrice(
  double price,
  double quantity,
) {
  // multiply price and quantity
  return (price * quantity);
}

double getNegativePrice(double price) {
  // get negative price
  return price * -1;
}

double addCartPrice(List<double> priceList) {
  // add all the price in the list
  double total = 0;
  for (double price in priceList) {
    total += price;
  }
  return total;
}

double? discountedPrice(
  double price,
  double? percentage,
) {
  // write a function to calculate discounted price based on the given price and percentage
  if (price == null || percentage == null) {
    return null;
  }
  if (percentage < 0 || percentage > 100) {
    return null;
  }
  double discount = price * (percentage / 100);
  double discountedPrice = price - discount;
  return discountedPrice;
}

double calculateCartTotal(List<CartRecord> cartItems) {
  double totalAmount = 0;
  for (var item in cartItems) {
    totalAmount = totalAmount + item.finalPrice;
  }
  return totalAmount;
}
