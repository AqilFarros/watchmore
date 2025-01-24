part of 'page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.only(bottom: defaultMargin * 3),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage("asset/welcome.png"),
                  fit: BoxFit.cover,
                  opacity: 0.2,
                ),
                color: blackColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "WCM",
                    style: wcm.copyWith(fontSize: defaultMargin * 2),
                  ),
                  const SizedBox(
                    height: defaultMargin * 4,
                  ),
                  Text(
                    'Log in To\nYour Account',
                    style: description.copyWith(fontSize: defaultMargin * 3),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultMargin * 2),
                  topRight: Radius.circular(defaultMargin * 2),
                ),
                border: Border(
                  top: BorderSide(color: mainColor.withOpacity(0.75), width: 1),
                ),
                boxShadow: [
                  BoxShadow(
                    color: mainColor.withOpacity(0.75),
                    offset: const Offset(0, -20),
                    blurRadius: 25,
                    spreadRadius: 10,
                  )
                ],
                gradient: LinearGradient(
                  colors: [
                    blackColor,
                    secondaryColor,
                    secondaryColor,
                    secondaryColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  input(
                    usernameController,
                    "Username",
                    Icon(
                      MdiIcons.account,
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  input(
                    passwordController,
                    "Password",
                    Icon(
                      MdiIcons.lock,
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  BlocConsumer<UserCubit, UserState>(
                    listener: (context, state) {
                      if (state is UserLoaded) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoadingHomePage(),
                          ),
                        );
                      } else if (state is UserLoadingFailed) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            behavior: SnackBarBehavior.floating,
                            showCloseIcon: true,
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Use Guest Account",
                              style: description.copyWith(
                                color: greyColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          isLoading
                              ? CircularProgressIndicator(
                                  color: mainColor,
                                )
                              : TextButton(
                                  onPressed: () {
                                    if (usernameController.text == '' ||
                                        passwordController.text == '') {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Username and password are required.'),
                                          behavior: SnackBarBehavior.floating,
                                          showCloseIcon: true,
                                        ),
                                      );
                                    } else {
                                      setState(() {
                                        isLoading = true;
                                      });

                                      context.read<UserCubit>().login(
                                          usernameController.text,
                                          passwordController.text);

                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                  child: Text(
                                    "Login",
                                    style: description,
                                  ),
                                ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Note: you need to register tmdb account before login.",
                    style: description.copyWith(
                      color: greyColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget input(TextEditingController controller, String hintText, Icon icon) {
  return TextFormField(
    controller: controller,
    style: description,
    cursorColor: greyColor,
    obscureText: hintText == "Password" ? true : false,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: description.copyWith(color: greyColor),
      prefixIcon: icon,
      contentPadding: const EdgeInsets.all(24),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: greyColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: greyColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: BorderSide(color: greyColor),
      ),
    ),
  );
}
