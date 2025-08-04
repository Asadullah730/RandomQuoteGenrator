import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_qoute/Controller/quote_controller.dart';

class QuoteHomePage extends StatelessWidget {
  final QuoteController controller = Get.put(QuoteController());

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final height = media.size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(' Helpful Quotes '),
        centerTitle: true,
        elevation: 6,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  vertical: height * 0.04,
                  horizontal: width * 0.06,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.deepPurple.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.2),
                      blurRadius: 15,
                      offset: Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.format_quote,
                      size: width * 0.14,
                      color: Colors.deepPurple.shade300,
                    ),
                    SizedBox(height: height * 0.025),
                    Text(
                      '"${controller.currentQuote.value.text}"',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontStyle: FontStyle.italic,
                        color: Colors.black87,
                        height: 1.6,
                        letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: height * 0.03),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '- ${controller.currentQuote.value.author}',
                        style: TextStyle(
                          fontSize: width * 0.045,
                          fontWeight: FontWeight.w600,
                          color: Colors.deepPurple.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.08),
            ElevatedButton.icon(
              onPressed: controller.generateQuote,
              icon: Icon(Icons.auto_awesome, color: Colors.white),
              label: Text(
                'Inspire Me ✨',
                style: TextStyle(
                  fontSize: width * 0.045,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.12,
                  vertical: height * 0.02,
                ),
                backgroundColor: Colors.deepPurpleAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
