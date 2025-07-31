import 'dart:math';

import 'package:get/get.dart';
import 'package:random_qoute/DataLayer/quote_static_data.dart';
import 'package:random_qoute/model/QuoteModel.dart';

class QuoteController extends GetxController {
  Rx<Quote> currentQuote = quotes[Random().nextInt(quotes.length)].obs;

  void generateQuote() {
    currentQuote.value = quotes[Random().nextInt(quotes.length)];
  }
}
