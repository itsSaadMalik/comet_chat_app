import 'package:comet_chat_app/core/enums/auth_types.dart';
import 'package:comet_chat_app/core/themes/edge_insets.dart';
import 'package:comet_chat_app/core/utils/extensions/log_extension.dart';
import 'package:comet_chat_app/features/auth/data/model/auth%20credentials/oauth_credentials.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/email_login_usecase.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/form_state_key.dart';
import 'package:comet_chat_app/features/auth/presentation/providers/oauth_login_usecase.dart';
import 'package:comet_chat_app/features/auth/presentation/widgets/custom_divider.dart';
import 'package:comet_chat_app/features/auth/presentation/widgets/oauth_button.dart';
import 'package:comet_chat_app/features/splash%20screen/presentation/provider/login_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
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
                top: MediaQuery.sizeOf(context).height * .30,
                child: SingleChildScrollView(
                  child: Container(
                    padding: standardEdgeInserts,
                    // height: 700,
                    height: MediaQuery.sizeOf(context).height * .70,
                    width: MediaQuery.sizeOf(context).width,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          spacing: 10,
                          children: [
                            TextFormField(
                              scrollPhysics: ClampingScrollPhysics(),
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      99,
                                      99,
                                      99,
                                    ),
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
                                  20,
                                  30,
                                  20,
                                  30,
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
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
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
                              cursorColor: const Color.fromARGB(
                                255,
                                88,
                                88,
                                88,
                              ),
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
                                labelStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
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
                            // SizedBox(height: 100),
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
                                        // Colors.amber,
                                        // Colors.amber,
                                        // const Color.fromARGB(255, 255, 219, 111),
                                        const Color.fromARGB(255, 95, 99, 102),
                                        const Color.fromARGB(255, 72, 77, 90),
                                        const Color.fromARGB(255, 90, 90, 90),
                                        const Color.fromARGB(
                                          255,
                                          116,
                                          115,
                                          115,
                                        ),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    'login',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                                onTap: () async {
                                  if (formKey.currentState?.validate() ??
                                      false) {}
                                },
                              ),
                            ),
                            SizedBox(height: 10),

                            const CustomDivider(),
                            SizedBox(height: 10),
                            OauthButton(
                              onTap: () async => await googleAuth.loginFlow(
                                authCredentials: OAuthCredentials(),
                              ),
                              authType: AuthType.google,
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * .01,
                            ),
                            OauthButton(
                              onTap: () async => await facebookAuth.login(
                                authCredentials: OAuthCredentials(),
                              ),

                              authType: AuthType.facebook,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () async {
                                await Supabase.instance.client.auth.signOut();
                              },
                              child: Text('sign out'),
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                ref.read(loginStateProvider).value?.log();
                              },
                              child: Text('login state'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // SizedBox(height: 100),
              //
            ],
          ),
        ),
      ),
    );
  }
}
