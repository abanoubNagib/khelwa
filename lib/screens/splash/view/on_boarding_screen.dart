

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khelwa/core/helpers/extensions.dart';
import 'package:khelwa/core/routes/routes.dart';
import 'package:khelwa/core/theme/khelwa_localization.dart';
import 'package:khelwa/core/theme/light_theme/light_colors.dart';
import 'package:khelwa/core/utils/dependency_injection.dart';
import 'package:khelwa/core/widgets/custom_text.dart';
import 'package:khelwa/screens/splash/data/onboarding_model.dart';
import 'package:khelwa/screens/splash/logic/on_boarding_bloc.dart';
import 'package:khelwa/screens/splash/logic/on_boarding_event.dart';
import 'package:khelwa/screens/splash/logic/on_boarding_state.dart';
import 'package:khelwa/services/base_cache_service.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';

class OnBoardingScreen extends StatefulWidget {
  static const String splashRoute = 'splash_screen';

  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  // SplashModel? splashModel;
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingBloc()..add(GetOnBoardingEvent()),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            return Scaffold(
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView.builder(
                    controller: _pageController,
                    itemCount: state.onBoardingList.length,
                    onPageChanged: _onPageChanged,
                    itemBuilder: (BuildContext context, int index) {
                      var item = state.onBoardingList[index];
                      return WelcomeScreen(
                        onboardingModel: OnBoardingModel(
                          name: item.name,
                          description: item.description,
                          image: item.image,
                        ),
                      );
                    },
                  ),
                  _currentPage == state.onBoardingList.length - 1
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(.9),
                              borderRadius: BorderRadius.circular(99),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5.0),
                              child: TextButton.icon(
                                onPressed: () async {
                                  sl<BaseCacheService>()
                                      .saveIsCompleteOnBoarding(true)
                                      .then(
                                    (value) {
                                      if (!context.mounted) return;
                                      context.pushNamed(AppRoutes.loginScreen);
                                    },
                                  );
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.green,
                                ),
                                label: CustomText(
                                  text: 'ابدأ الان',
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildPageIndicator(
                                state.onBoardingList.length),
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int count) {
    List<Widget> indicators = [];
    for (int i = 0; i < count; i++) {
      indicators.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return indicators;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 9.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.green[700] : Colors.grey[400],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  final OnBoardingModel onboardingModel;

  const WelcomeScreen({
    super.key,
    required this.onboardingModel,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Image.network(onboardingModel.image,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
            cacheHeight: 1000,
            loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Localizations(
              locale: const Locale('en'),
              delegates: KhelwaLocalizationDelegates.delegates,
              child: LoadingAnimationWidget.fourRotatingDots(
                color: LightColorsManager.grey,
                size: 50,
              ),
            ),
          );
        }),
        Positioned(
          bottom: 120.0,
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: LightColorsManager.primary,
            child: Text(
              onboardingModel.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 85.0,
          child: CustomText(
            text: onboardingModel.description,
            textAlign: TextAlign.center,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
