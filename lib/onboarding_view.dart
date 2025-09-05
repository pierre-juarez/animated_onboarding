import 'package:animated_onboarding/animated_wrapper.dart';
import 'package:animated_onboarding/home_view.dart';
import 'package:cupertino_onboarding/cupertino_onboarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final List<Color> featuresColors = [
    CupertinoColors.systemBlue,
    CupertinoColors.systemGreen,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPurple,
    CupertinoColors.systemTeal,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: widget.onPressed,
          icon: Icon(Theme.of(context).brightness == Brightness.dark ? CupertinoIcons.sun_max : CupertinoIcons.moon),
        ),
      ),
      body: CupertinoOnboarding(
        bottomButtonColor: CupertinoColors.activeBlue,
        bottomButtonChild: Text("Get Started"),
        onPressedOnLastPage: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (_) => HomeView()));
        },
        pages: [_buildWelcomePage(), _buildCarSelectionPage(), _buildPricingPage()],
      ),
    );
  }

  WhatsNewPage _buildWelcomePage() {
    return WhatsNewPage(
      titleFlex: 2,
      title: AnimatedWrapper(index: 1, child: Text("Welcome to our app!")),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text("Hotel Booking"),
            description: Column(children: [Text("Book your hotel room with our online booking system.")]),
            icon: _coloredIcon(CupertinoIcons.house, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text("International Travel"),
            description: Column(children: [Text("Reserve your flight tickets online.")]),
            icon: _coloredIcon(CupertinoIcons.airplane, 1),
          ),
        ),
        AnimatedWrapper(
          index: 4,
          child: WhatsNewFeature(
            title: Text("Adventure & Sports"),
            description: Column(children: [Text("Enjoy your favorite adventure and sports activities.")]),
            icon: _coloredIcon(CupertinoIcons.sportscourt, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text("Car Rental"),
            description: Column(children: [Text("Rent a car online and explore our fleet of vehicles.")]),
            icon: Icon(CupertinoIcons.car_detailed),
          ),
        ),
      ],
    );
  }

  WhatsNewPage _buildCarSelectionPage() {
    return WhatsNewPage(
      titleFlex: 2,
      title: AnimatedWrapper(index: 1, child: Text("Discover our news")),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text("Wall art"),
            description: Column(children: [Text("Explore our beautiful wall art collection.")]),
            icon: _coloredIcon(CupertinoIcons.paintbrush, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text("Sales & Promotions"),
            description: Column(children: [Text("Stay updated with our sales and promotions. Receive exclusive discounts.")]),
            icon: _coloredIcon(CupertinoIcons.calendar, 1),
          ),
        ),
        AnimatedWrapper(
          index: 4,
          child: WhatsNewFeature(
            title: Text("Family Fun"),
            description: Column(
              children: [Text("Fun activities for the whole family and relax with our kid-friendly activities.")],
            ),
            icon: _coloredIcon(CupertinoIcons.sportscourt, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text("Movies & TV"),
            description: Column(children: [Text("Watch our latest movies and TV shows.")]),
            icon: Icon(CupertinoIcons.tv),
          ),
        ),
      ],
    );
  }

  WhatsNewPage _buildPricingPage() {
    return WhatsNewPage(
      titleFlex: 2,
      title: AnimatedWrapper(index: 1, child: Text("Review our pricing plans")),
      features: [
        AnimatedWrapper(
          index: 2,
          child: WhatsNewFeature(
            title: Text("Free"),
            description: Column(children: [Text("Start with our free plan. No credit card required.")]),
            icon: _coloredIcon(CupertinoIcons.heart, 0),
          ),
        ),
        AnimatedWrapper(
          index: 3,
          child: WhatsNewFeature(
            title: Text("Premium"),
            description: Column(children: [Text("Enjoy our premium plan. Get access to exclusive features.")]),
            icon: _coloredIcon(CupertinoIcons.money_dollar, 1),
          ),
        ),
        AnimatedWrapper(
          index: 4,
          child: WhatsNewFeature(
            title: Text("Business"),
            description: Column(children: [Text("Get access to our business plan. For small businesses.")]),
            icon: _coloredIcon(CupertinoIcons.money_dollar_circle, 2),
          ),
        ),
        AnimatedWrapper(
          index: 5,
          child: WhatsNewFeature(
            title: Text("Enterprise"),
            description: Column(children: [Text("Get access to our enterprise plan. For large businesses.")]),
            icon: _coloredIcon(CupertinoIcons.group, 3),
          ),
        ),
      ],
    );
  }

  Icon _coloredIcon(IconData icon, int index) {
    return Icon(icon, color: featuresColors[index % featuresColors.length], size: 28);
  }
}
