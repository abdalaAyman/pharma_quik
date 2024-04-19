import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmaquik/core/utils/assets_data.dart';
import 'package:pharmaquik/features/Home/presentation/view/main_view.dart';
import 'package:pharmaquik/features/Splash/presentation/models/onboarding.dart';
import 'package:pharmaquik/features/Splash/presentation/views/widgets/dot_inidictor.dart';
import 'package:pharmaquik/features/Splash/presentation/views/widgets/on_boarding_content.dart';

class OnBordingView extends StatefulWidget {
  const OnBordingView({super.key});

  @override
  State<OnBordingView> createState() => _OnBordingViewState();
}

class _OnBordingViewState extends State<OnBordingView> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.pressed)) {
                      return const Color.fromARGB(255, 1, 24, 50)
                          .withOpacity(0.12);
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MainHome()),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(color: Color(0xFF757070), fontSize: 16),
              ))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF7D7B7B),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _pageIndex = value;
                });
              },
              itemCount: onBoardingList.length,
              itemBuilder: (context, index) {
                return OnBordingContent(
                  title: onBoardingList[index].title,
                  headTitle: onBoardingList[index].headTitle,
                  image: onBoardingList[index].image,
                  height: onBoardingList[index].height,
                  width: onBoardingList[index].width,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardingList.length,
                (index) => Padding(
                  padding:
                      const EdgeInsets.only(top: 20, bottom: 30, left: 3.5),
                  child: DotIndicator(
                    isActive: index == _pageIndex,
                  ),
                ),
              ),
            ],
          ),
          // if (_pageIndex == onBoardingList.length - 1)
          //   Align(
          //     alignment: Alignment.bottomRight,
          //     child: Padding(
          //         padding: const EdgeInsets.only(bottom: 20, right: 8),
          //         child: IconButton(
          //           icon: ImageIcon(AssetImage("assets/logos/nextbutton.png")),
          //           onPressed: () {},
          //         )),
          //   ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    if (_pageIndex != onBoardingList.length - 1) {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MainHome()),
                      );
                    }
                  }, // Handle your callback.
                  splashColor:
                      const Color.fromARGB(147, 8, 8, 169).withOpacity(0.5),
                  child: Ink(
                    height: 56,
                    width: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        image: AssetImage("assets/nextbutton.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

final List<OnBoarding> onBoardingList = [
  OnBoarding(
    headTitle: 'Information about medicines',
    title: """Help the user to know some information about
the drug
Which helps the user in times when he cannot go
to the doctor and saves him time, and takes the
medicine while he is fully aware of everything 
related to this medicine safely""",
    image: AssetsData.onbording1,
    width: 297,
    height: 222,
  ),
  OnBoarding(
    headTitle: " The uses of the medicine",
    title:
        'Thus, raising the user\'s awareness of his health\n status and the disease associated with it.',
    image: AssetsData.onbording2,
    width: 283,
    height: 283,
  ),
  OnBoarding(
    headTitle: "contraindications to the use of the medicine",
    title:
        'Therefore, knowledge of special cases and special\n circumstances if you do not provide it, it is contraindicated to use the drug.',
    image: AssetsData.onbording3,
    width: 323,
    height: 258.05,
  ),
  OnBoarding(
    headTitle: "Side effects of the medicine and precautions in use",
    title:
        'Thus know the unintended and undesirable side effects that occur during the use of the drug, precautions that must be observed.',
    image: AssetsData.onbording4,
    width: 184.32,
    height: 286,
  ),
  OnBoarding(
    headTitle: "Making sure it is safe to use more than one medicine together",
    title:
        'When a user takes more than one medication together, the app helps them know if it\'s safe to take them at the same time.',
    image: AssetsData.onbording5,
    width: 267,
    height: 280.88,
  ),
];
