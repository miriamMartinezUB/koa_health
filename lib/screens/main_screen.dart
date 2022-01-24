import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:koa_health/model/user_preferences.dart';
import 'package:koa_health/resources/dimens.dart';
import 'package:koa_health/screens/toughts_screen.dart';
import 'package:koa_health/utils/locator.dart';
import 'package:koa_health/utils/user_preferences_manager.dart';
import 'package:koa_health/views/text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [];
  int selectedIndex = 2;
  String a = translate('');
  UserPreferences prefs = locator<UserPreferencesManager>().get();
  late TextStyle labelStyle;

  @override
  void initState() {
    screens = [getNotImplementedWidget(), getNotImplementedWidget(), const ThoughtsScreen(), getNotImplementedWidget()];
    labelStyle = TextStyle(
        fontSize: getFontSize(prefs.themeFont, type: TextTypes.tiny),
        fontWeight: getFontWeight(prefs.themeFont, type: TextTypes.tiny),
        color: Color(prefs.paletteColors.text));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(prefs.paletteColors.secondary),
      body: SafeArea(child: screens[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedLabelStyle: labelStyle.copyWith(color: Color(prefs.paletteColors.primary)),
          unselectedLabelStyle: labelStyle,
          backgroundColor: Color(prefs.paletteColors.cardBackground),
          unselectedItemColor: Color(prefs.paletteColors.icons),
          selectedItemColor: Color(prefs.paletteColors.primary),
          currentIndex: selectedIndex,
          onTap: (int indexTapped) {
            setState(() {
              selectedIndex = indexTapped;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.assignment_outlined), label: 'PROGRAM'),
            BottomNavigationBarItem(icon: Icon(Icons.message_outlined), label: 'MESSAGES'),
            BottomNavigationBarItem(icon: Icon(Icons.cloud_outlined), label: 'THOUGHTS'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: 'ME')
          ]),
    );
  }

  Widget getNotImplementedWidget() {
    return Padding(
      padding: const EdgeInsets.all(Dimens.PADDING_LARGE),
      child: Center(
          child: AppText(
        translate('errors.not_implemented'),
        align: TextAlign.center,
      )),
    );
  }
}
