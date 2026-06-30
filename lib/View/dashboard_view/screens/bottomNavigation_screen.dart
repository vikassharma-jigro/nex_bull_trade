
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nax_bull_trade/View/dashboard_view/screens/trade_screen.dart';
import '../../../app_helpers/theme/app_colors.dart';
import '../../../app_helpers/utils/app_images.dart';

import '../../profile_view/screens/profile_screen.dart';
import 'assets_screen.dart';
import 'home_screen.dart';
import 'market_list_screen.dart';




class DashboardScreen extends StatefulWidget {
  String? id;
  bool? isFromHome;
  int?index;
  DashboardScreen({Key? key, this.id, this.isFromHome = false,this.index})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late int _selectedIndex;
  final PageController _pageController = PageController();
  bool back_dialog = false;

  @override
  void initState() {
    _selectedIndex = widget.index??0;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppColors.onPrimary,
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: const <Widget>[
                HomeScreen(),
                MarketScreen(),
                BuyBtcScreen(),
                AssetsScreen(),
                ProfileScreen(),

              ],
            ),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigation(context),
      ),
    );
  }

  Widget cancelButton(context) {
    return TextButton(
      child: const Text("NO"),
      onPressed: () {
        setState(() {
          back_dialog = false;
        });
      },
    );
  }

  Widget continueButton(context) {
    return TextButton(
      child: const Text("YES"),
      onPressed: () {
        SystemNavigator.pop();
      },
    );
  }

  Future<bool> _onWillPop() async {
    final shouldPop = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(10),
          title: const Align(
              alignment: Alignment.center,
              child: Text('Do you want to quit app?',style: TextStyle(color: AppColors.darkBlue,fontSize: 18,),)),
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width/3,
                      padding: const EdgeInsets.only(left: 22,right: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: AppColors.darkBlue)
                      ),
                      child: const Align(
                          alignment: Alignment.center,
                          child: Text('Yes',style: TextStyle(color: AppColors.darkBlue,fontSize: 18,),))),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Container(
                      height: 40,
                      width: MediaQuery.sizeOf(context).width/3,
                      padding: const EdgeInsets.only(left: 22,right: 22),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),color: AppColors.darkBlue,
                          border: Border.all(color: AppColors.darkBlue)
                      ),
                      child:  Align(
                          alignment: Alignment.center,
                          child: Text('No',style: TextStyle(color: AppColors.onPrimary,fontSize: 18,),))),
                ),
              ],
            ),
          ],
        );
      },
    );
    return shouldPop!;
  }

  _buildBottomNavigation(isMember) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Navigation Bar
        BottomNavigationBar(
          backgroundColor: AppColors.onPrimary,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.darkBlue,
          unselectedItemColor: AppColors.textDark,
          selectedFontSize: 20,
          unselectedFontSize: 20,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: AppColors.blackColor),
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: AppColors.darkBlue,
            overflow: TextOverflow.visible,
          ),
          onTap: (index) {
            _onTappedBar(index);
          },
          items:  [
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.homeIcon,height: 20,color: _selectedIndex==0?AppColors.darkBlue:AppColors.textDark,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.marketIcon,height: 20,color: _selectedIndex==1?AppColors.darkBlue:AppColors.textDark,),
              label: 'Market',
            ),

            BottomNavigationBarItem(
              icon: Image.asset(AppImages.tradeIcon,height: 20,color: _selectedIndex==2?AppColors.darkBlue:AppColors.textDark,),
              label: 'Trade',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.assetsIcon,height: 20,color: _selectedIndex==3?AppColors.darkBlue:AppColors.textDark,),
              label: 'Assets',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppImages.profileIcon,height: 20,color: _selectedIndex==4?AppColors.darkBlue:AppColors.textDark,),
              label: 'Profile',
            ),
          ],
        ),

      ],
    );
  }

  void _onTappedBar(int value) {
    FocusScope.of(context).unfocus();
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }



}
