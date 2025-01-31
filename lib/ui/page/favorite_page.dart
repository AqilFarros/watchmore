part of 'page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key, required this.favoriteMovie});
  
  final List<FavoriteMovie> favoriteMovie;

  @override
  Widget build(BuildContext context) {
    return GeneralPage(widgetChild: 
    []);
  }
}