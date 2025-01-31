part of 'page.dart';

class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key, required this.watchlist});

  final List<Watchlist> watchlist;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(widgetChild: []);
  }
}
