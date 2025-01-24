part of 'page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

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
                image: DecorationImage(
                  image: const AssetImage("asset/welcome.png"),
                  colorFilter: ColorFilter.mode(mainColor, BlendMode.darken),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "WCM",
                    style: wcm.copyWith(fontSize: defaultMargin * 6),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(defaultMargin * 2),
                  topRight: Radius.circular(defaultMargin * 2),
                ),
                border: Border(
                  top: BorderSide(
                      color: mainColor.withOpacity(0.75), width: 1),
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
                  Text(
                    'Welcome to\nWCM',
                    style: description.copyWith(fontSize: defaultMargin * 3),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "With this application, you could obtain\nthe newest movie, popular etc. And you\ncould rate, wishlist and favourite your movie.",
                    style: description.copyWith(
                      color: greyColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.login,
                          color: whiteColor,
                          size: defaultMargin * 2,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Login",
                          style: heading1,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      backgroundColor: secondaryColor,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.account,
                          color: whiteColor,
                          size: defaultMargin * 2,
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Text(
                          "Guest",
                          style: heading1,
                        ),
                      ],
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
