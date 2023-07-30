import 'package:architecture_avikshit/constants/colors.dart';
import 'package:architecture_avikshit/constants/textstyles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constants/assets.dart';
import 'login_controller.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool providerValue = ref.watch(myProvider);
    return Scaffold(
      backgroundColor: BrandColor.blackColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                CircleAvatar(
                  radius: 22.0,
                  backgroundColor: Colors.blue.withOpacity(0.65),
                  backgroundImage: const AssetImage(
                    PngAssets.appLogo,
                  ),
                ),
                const SizedBox(
                  width: 11,
                ),
                Text(
                  'ShopLy',
                  style: w700.size28.colorWhite,
                )
              ]),
              Expanded(child: Container()),
              Text("The only\nshopping app\nyou'll ever need. ",
                  style: v500.size30.colorWhite),
              Expanded(child: Container()),
              SizedBox(
                child: GestureDetector(
                  onTap: () {
                    context.goNamed("home");
                    //ref.watch(myProvider.notifier).updateValue(false);
                    //handleSignIn(context, ref);
                  },
                  child: providerValue
                      ? Container(
                          height: 50.0,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            color: Colors.blue.withOpacity(
                                0.2), // Customize the button color here
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                PngAssets.googleButton,
                                height: 24.0,
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                'Sign in with Google',
                                style: w500.size15.copyWith(
                                    color: Colors.white.withOpacity(0.9)),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(
                          height: 50,
                          width: 50,
                          child: Center(child: CircularProgressIndicator())),
                ),
              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
