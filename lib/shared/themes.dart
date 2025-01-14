part of 'shared.dart';

Color mainColor = "2ba0c4".toColor();
Color secondaryColor = "11232f".toColor();
Color redColor = "a6625e".toColor();
Color greyColor = "8D92A3".toColor();
Color blackColor = "10111a".toColor();
Color whiteColor = "ffffff".toColor();
LinearGradient gradientColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    "061f29".toColor(),
    "084a65".toColor(),
  ],
);

const double defaultMargin = 12;

TextStyle wcm = GoogleFonts.yatraOne().copyWith(
  color: whiteColor,
  fontSize: 30,
);

TextStyle heading1 = GoogleFonts.poppins().copyWith(
  color: whiteColor,
  fontSize: 20,
  fontWeight: FontWeight.w600,
);
TextStyle description = GoogleFonts.poppins().copyWith(
  color: whiteColor,
);
