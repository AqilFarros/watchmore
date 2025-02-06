part of '../page.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key, required this.widgetChild});
  final List<Widget> widgetChild;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                gradient: gradientColor,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                homepageAppbar(context),
                const SizedBox(
                  height: 12,
                ),
                ...widgetChild
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget drawer(BuildContext context) {
  Widget drawerItem(
    IconData icon,
    String title,
    Widget page,
    BuildContext context,
  ) {
    bool isActive =
        ModalRoute.of(context)?.settings.name == page.runtimeType.toString();

    print(ModalRoute.of(context)?.settings.name);

    return ListTile(
      leading: Icon(icon, color: isActive ? mainColor : whiteColor),
      title: Text(
        title,
        style: description.copyWith(
          color: isActive ? mainColor : whiteColor,
        ),
      ),
      onTap: () {
        if (!isActive) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }

  return Drawer(
    backgroundColor: secondaryColor,
    child: Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                        onPressed: () {
                          Scaffold.of(context).closeDrawer();
                        },
                        icon: Icon(
                          MdiIcons.close,
                          size: 35,
                          color: whiteColor,
                        ),
                      );
                    },
                  ),
                  Text(
                    'WCM',
                    style: wcm,
                  ),
                ],
              ),
              const Divider(),
              drawerItem(
                MdiIcons.home,
                "Home",
                const LoadingHomePage(),
                context,
              ),
              drawerItem(
                MdiIcons.heart,
                "Favorite",
                const LoadingFavoritePage(),
                context,
              ),
              drawerItem(
                MdiIcons.listBox,
                "Watchlist",
                const LoadingWatchlistPage(),
                context,
              ),
            ],
          ),
        ),

        // Logout Button at Bottom
        Column(
          children: [
            const Divider(),
            ListTile(
              leading: Icon(MdiIcons.logout, color: whiteColor),
              title: Text("Logout", style: description),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget homepageAppbar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 70, left: 18, right: 18),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              MdiIcons.sortVariant,
              size: 35,
              color: whiteColor,
            ),
          );
        }),
        const SizedBox(
          width: 10,
        ),
        Text(
          'WCM',
          style: wcm,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: mainColor.withOpacity(0.3),
          ),
          child: Icon(
            MdiIcons.bellOutline,
            color: whiteColor,
            size: 25,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        PopupMenuButton(
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: InkWell(
                onTap: () {
                  context.read<UserCubit>().logout();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WelcomePage(),
                    ),
                  );
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      MdiIcons.logout,
                      color: whiteColor,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      "Logout",
                      style: description,
                    ),
                  ],
                ),
              ),
            ),
          ],
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(secondaryColor),
          ),
          color: secondaryColor,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: mainColor.withOpacity(0.3),
            ),
            child: Icon(
              MdiIcons.dotsVertical,
              color: whiteColor,
              size: 25,
            ),
          ),
        ),
      ],
    ),
  );
}
