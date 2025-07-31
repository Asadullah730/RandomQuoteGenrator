import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_qoute/DataLayer/quote_static_data.dart';
import 'package:random_qoute/model/QuoteModel.dart';

class QuoteHomePage extends StatefulWidget {
  @override
  _QuoteHomePageState createState() => _QuoteHomePageState();
}

class _QuoteHomePageState extends State<QuoteHomePage>
    with SingleTickerProviderStateMixin {
  late Quote _currentQuote;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _currentQuote = quotes[Random().nextInt(quotes.length)];

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  void _generateQuote() {
    _controller.reverse().then((_) {
      setState(() {
        _currentQuote = quotes[Random().nextInt(quotes.length)];
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF3E5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Random Quotes '),
        centerTitle: true,
        elevation: 6,
        actions: [
          IconButton(
            icon: Icon(Icons.wb_sunny_outlined, color: Colors.white),
            onPressed: () {
              // You can add theme toggle logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _fadeAnimation,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 400),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.purple.shade100],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.withOpacity(0.3),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 28.0,
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        Icons.format_quote,
                        size: size.width * 0.12,
                        color: Colors.deepPurple.shade300,
                      ),
                      SizedBox(height: 16),
                      FittedBox(
                        child: Text(
                          '"${_currentQuote.text}"',
                          style: TextStyle(
                            fontSize: size.width * 0.05,
                            fontStyle: FontStyle.italic,
                            color: Colors.black87,
                            height: 1.5,
                            letterSpacing: 0.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 24),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '- ${_currentQuote.author}',
                          style: TextStyle(
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple.shade600,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton.icon(
              onPressed: _generateQuote,
              icon: Icon(Icons.auto_awesome, color: Colors.white),
              label: Text(
                'Next',
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                  vertical: size.height * 0.02,
                ),
                backgroundColor: Colors.deepPurple.shade400,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
