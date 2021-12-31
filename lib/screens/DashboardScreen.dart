import 'package:englis_quiz/components/DrawerComponent.dart';
import 'package:englis_quiz/components/QuizCategoryComponent.dart';
import 'package:englis_quiz/models/CategoryModel.dart';
import 'package:englis_quiz/utils/colors.dart';
import 'package:englis_quiz/utils/constants.dart';
import 'package:englis_quiz/utils/images.dart';
import 'package:englis_quiz/utils/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';
import 'QuizCategoryScreen.dart';
import 'QuizScreen.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent, statusBarIconBrightness: Brightness.dark);

    appSettingService.setAppSettings();

    await 5.seconds.delay;
    LiveStream().on(HideDrawerStream, (s) {
      scaffoldKey.currentState!.openEndDrawer();
    });
  }

  @override
  void dispose() {
    LiveStream().dispose(HideDrawerStream);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerComponent(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: colorPrimary,
              title: Text(mAppName),
              centerTitle: true,
              pinned: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(defaultRadius), bottomRight: Radius.circular(defaultRadius)),
              ),
              expandedHeight: context.height() * 0.5,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Image.asset(DashboardImage, fit: BoxFit.cover),
              ),
            ),
          ];
        },
        body: FutureBuilder(
          future: categoryService.categories(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CategoryModel> data = snapshot.data as List<CategoryModel>;
              return ListView(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 30),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Choose Categories', style: boldTextStyle(size: 22)),
                      Text('See all', style: boldTextStyle(color: colorPrimary, size: 22)).onTap(() {
                        QuizCategoryScreen().launch(context);
                      }),
                    ],
                  ).paddingOnly(left: 16, right: 16),
                  16.height,
                  Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.all(16),
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 20,
                      children: List.generate(data.length, (index) {
                        CategoryModel? mData = data[index];
                        return QuizCategoryComponent(category: mData).onTap(() {
                          QuizScreen(catId: mData.id, catName: mData.name).launch(context);
                        });
                      }),
                    ),
                  ),
                ],
              );
            }
            return snapWidgetHelper(snapshot, errorWidget: emptyWidget());
          },
        ),
      ),
    );
  }
}
