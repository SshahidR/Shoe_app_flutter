import 'package:flutter/material.dart';
import 'package:flutter_assessment/SignInScreen.dart';

class OnboardingScreen1 extends StatefulWidget {
  const OnboardingScreen1({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen1> createState() => _OnboardingScreen1State();
}

class _OnboardingScreen1State extends State<OnboardingScreen1> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<OnboardingContent> _contents = [
    OnboardingContent(
      image: 'assets/shoe.png',
      title: 'Start Journey With Shoes',
      description: 'Smart, Gorgeous & Fashionable Collection',
    ),
    OnboardingContent(
      image: 'assets/shoe.png',
      title: 'Find Perfect Fit',
      description: 'Discover Your Perfect Style and Comfort',
    ),
    OnboardingContent(
      image: 'assets/shoe.png',
      title: 'Premium Quality',
      description: 'Experience Luxury and Performance Combined',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _contents.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1A1B1E),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
            vertical: size.height * 0.02,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.purple.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                          itemCount: _contents.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.all(size.width * 0.05),
                              child: Transform.rotate(
                                angle: -0.2,
                                child: Image.asset(
                                  _contents[index].image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(size.width * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _contents[_currentPage].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.08,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2,
                                ),
                              ),
                              Text(
                                _contents[_currentPage].description,
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: size.width * 0.04,
                                  height: 1.5,
                                ),
                              ),
                              Row(
                                children: List.generate(
                                  _contents.length,
                                  (index) => Container(
                                    margin: EdgeInsets.only(right: size.width * 0.02),
                                    width: index == _currentPage
                                        ? size.width * 0.1
                                        : size.width * 0.05,
                                    height: 2,
                                    color: index == _currentPage
                                        ? Colors.lightBlue
                                        : Colors.grey[700],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: _nextPage,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightBlue,
                                    padding: EdgeInsets.symmetric(
                                      vertical: size.height * 0.02,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    _currentPage == _contents.length - 1
                                        ? 'Get Started'
                                        : 'Next',
                                    style: TextStyle(
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}
