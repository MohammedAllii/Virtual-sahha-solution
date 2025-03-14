import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vsahha/generated/l10n.dart';

class AboutVSS extends StatefulWidget {
  const AboutVSS({super.key});

  @override
  State<AboutVSS> createState() => _AboutVSSState();
}

class _AboutVSSState extends State<AboutVSS> {
  late PageController controlPage;

  @override
  void initState() {
    super.initState();
    controlPage = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    controlPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Text(
                      S.of(context).aboutvss,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: isLandscape ? 10.h : 20.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF44a4a4),
                      blurRadius: 20.r,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: isLandscape ? 300.h : 500.h,
                  child: PageView(
                    controller: controlPage,
                    children:  [
                      SingleChildScrollView(
                        child: OnboardingPage(
                          index: "1",
                          title: S.of(context).title11,
                          description: S.of(context).description11,
                          icon: Icons.medical_services_outlined,
                        ),
                        
                      ),
                      SingleChildScrollView(
                        child: OnboardingPage(
                          index: "2",
                          title: S.of(context).title12,
                          description: S.of(context).description12,
                          icon: Icons.touch_app_outlined,
                        ),
                        
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: isLandscape ? 10.h : 20.h),
              SmoothPageIndicator(
                controller: controlPage,
                count: 2,
                effect: ExpandingDotsEffect(
                  activeDotColor: Colors.black,
                  dotColor: Colors.black.withOpacity(0.5),
                  dotHeight: 8.h,
                  dotWidth: 8.w,
                  spacing: 8.w,
                  expansionFactor: 3,
                ),
              ),
              SizedBox(height: isLandscape ? 20.h : 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String index;
  final String title;
  final String description;
  final IconData icon;

  const OnboardingPage({
    Key? key,
    required this.index,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: const Color(0xFF1FADB6).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 30.sp, color: const Color(0xFF1FADB6)),
          ),
          SizedBox(height: 30.h),
          Text(
            "$index sur 3",
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1FADB6),
            ),
          ),
          SizedBox(height: 25.h),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
