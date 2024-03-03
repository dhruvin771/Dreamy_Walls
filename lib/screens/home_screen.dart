import 'package:dreamy_walls/const/color.dart';
import 'package:dreamy_walls/screens/tabs/categories_tab.dart';
import 'package:dreamy_walls/screens/tabs/home_tab.dart';
import 'package:dreamy_walls/screens/tabs/setting_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: this,
    );
    tabController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: bgColor, systemNavigationBarColor: bgColor));
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, backgroundColor: bgColor),
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.transparent,
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(
                        tabController.index == 0
                            ? "Dreamy Walls"
                            : tabController.index == 2
                                ? "Setting"
                                : "Categories",
                        style: TextStyle(
                            color: radiumColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: tabController.index == 1
                          ? Colors.white
                          : Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.white.withOpacity(0.2),
                height: 0.5),
            Expanded(
              child: Stack(
                children: [
                  TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [HomeTab(), CategoriesTab(), SettingTab()],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: bgColor,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.white.withOpacity(0.5),
                                  width: 0.2)),
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              tabIcon(0),
                              tabIcon(1),
                              tabIcon(2),
                            ],
                          ),
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

  Widget tabIcon(int i) {
    return GestureDetector(
      onTap: () => setState(() => tabController.index = i),
      child: Container(
        decoration: BoxDecoration(
          color: tabController.index == i ? radiumColor : bgColor,
          borderRadius: BorderRadius.circular(50),
        ),
        height: 45,
        width: 45,
        child: Center(
          child: Icon(
            listOfIcons[i],
            color: tabController.index != i ? Colors.white : bgColor,
          ),
        ),
      ),
    );
  }

  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.category_rounded,
    Icons.settings_rounded,
  ];
}
