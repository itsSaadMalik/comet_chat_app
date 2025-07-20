import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/core/themes/edge_insets.dart';
import 'package:comet_chat_app/features/auth/application/providers/email_authsrc_provider.dart';
import 'package:comet_chat_app/features/auth/application/providers/google_auth_src_provider.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/email_login_usecase.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/form_state_key.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/oauth_login_usecase.dart';
import 'package:comet_chat_app/features/auth/presentation/widgets/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final emailAuth = ref.watch(emailLoginUsecaseProvider);
    final googleAuth = ref.watch(oAuthLoginUsecaseProvider(AuthType.google));
    final facebookAuth = ref.watch(
      oAuthLoginUsecaseProvider(AuthType.facebook),
    );
    final formKey = ref.watch(formStateProvider);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.sizeOf(context).height * .01,
                child: LottieBuilder.asset(
                  'assets/lotties/chat.json',
                  height: 250,
                  width: 200,
                  fit: BoxFit.contain,
                ),
              ),

              Positioned(
                top: MediaQuery.sizeOf(context).height * .4,
                child: Container(
                  padding: standardEdgeInserts,
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        spacing: 10,
                        children: [
                          TextFormField(
                            scrollPhysics: ClampingScrollPhysics(),
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                            controller: email,
                            cursorColor: const Color.fromARGB(
                              255,
                              121,
                              121,
                              121,
                            ),
                            decoration: InputDecoration(
                              // icon: Icon(Icons.email),
                              prefixIcon: Icon(Icons.email_outlined),
                              prefixIconColor: const Color.fromARGB(
                                255,
                                63,
                                63,
                                63,
                              ),
                              contentPadding: EdgeInsets.fromLTRB(
                                18,
                                18,
                                18,
                                18,
                              ),

                              filled: true,
                              iconColor: const Color.fromARGB(255, 0, 0, 0),
                              fillColor: const Color.fromARGB(
                                255,
                                218,
                                218,
                                218,
                              ),
                              labelText: 'user email',
                              labelStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      99,
                                      99,
                                      99,
                                    ),
                                  ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: 'required'),
                            // ]).call,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 10),

                          TextFormField(
                            style: TextStyle(
                              color: const Color.fromARGB(255, 80, 80, 80),
                            ),

                            controller: pass,
                            cursorColor: const Color.fromARGB(255, 88, 88, 88),
                            decoration: InputDecoration(
                              // icon: Icon(Icons.email),
                              prefixIcon: Icon(Icons.lock_outline_rounded),
                              prefixIconColor: const Color.fromARGB(
                                255,
                                63,
                                63,
                                63,
                              ),
                              filled: true,
                              contentPadding: EdgeInsets.all(18),

                              fillColor: const Color.fromARGB(
                                255,
                                218,
                                218,
                                218,
                              ),
                              labelText: 'password',
                              labelStyle: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      99,
                                      99,
                                      99,
                                    ),
                                  ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            // validator: MultiValidator([
                            //   RequiredValidator(errorText: 'required'),
                            // ]).call,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'new user ?',
                                style: Theme.of(context).textTheme.bodySmall
                                    ?.copyWith(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              child: Container(
                                alignment: Alignment.center,
                                width: 200,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  shape: BoxShape.rectangle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.amber,
                                      Colors.amber,
                                      const Color.fromARGB(255, 255, 219, 111),
                                    ],
                                  ),
                                ),
                                child: Text('login'),
                              ),
                              onTap: () async {
                                if (formKey.currentState?.validate() ??
                                    false) {}
                              },
                            ),
                          ),
                          SizedBox(height: 10),

                          // const CustomDivider(),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {},
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Row(
                              spacing: 13,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('sigIn with Google'),
                                // Image.asset(
                                //   'assets/icon/google.png',
                                //   height: 23,
                                //   fit: BoxFit.contain,
                                // ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {},
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Row(
                              spacing: 13,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('sigIn with Facebook'),
                                // Image.asset(
                                //   'assets/icon/facebook.png',
                                //   height: 23,
                                //   fit: BoxFit.contain,
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 100),
              // ElevatedButton(
              //   onPressed: () async {
              //     logout.logout(ref: ref);
              //   },
              //   child: Text('data'),
              // ),
              //
            ],
          ),
        ),
      ),
    );
  }
}
