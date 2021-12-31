
import 'package:englis_quiz/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:nb_utils/nb_utils.dart';

import 'package:englis_quiz/main.dart';

import 'package:englis_quiz/utils/colors.dart';

import 'package:englis_quiz/utils/widgets.dart';

class EarnPointScreen extends StatefulWidget {
  static String tag = '/EarnPointScreen';

  @override
  EarnPointScreenState createState() => EarnPointScreenState();
}

class EarnPointScreenState extends State<EarnPointScreen> {
  GlobalKey<FormState> formKey = GlobalKey();


  bool _isWatchVideo = true;
  bool _isRewardedAdReady = false;

  String? oldLevel, newLevel;

  @override
  void initState() {
    super.initState();

  }







  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earn Points'),
        backgroundColor: colorPrimary,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.height,
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 16,
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                    child: cachedImage(appStore.userProfileImage.validate(), height: 130, width: 130, fit: BoxFit.cover, alignment: Alignment.center),
                  ).center(),
                  16.height,
                  Observer(builder: (context) => Text(appStore.userName!, style: boldTextStyle(size: 20)).center()),
                  4.height,
                  Text('Points: ${getIntAsync(USER_POINTS)}', style: boldTextStyle(size: 18, color: colorPrimary)).center(),
                  16.height,
                  Divider(),
                  16.height,
                  Container(
                    width: context.width(),
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [colorPrimary, colorSecondary],
                        begin: FractionalOffset.centerLeft,
                        end: FractionalOffset.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: TextButton(
                      child: Text(
                        'Watch Video',
                        style: primaryTextStyle(color: white),
                      ),
                      onPressed: () async {
                        appStore.setLoading(true);
                        await 2.seconds.delay;
                        appStore.setLoading(false);
                        if (_isRewardedAdReady) {

                        } else {
                          toast('Failed to load a rewarded ad');
                        }
                      },
                    ),
                  ).visible(_isWatchVideo),
                ],
              ).paddingOnly(left: 16, right: 16),
            ),
          ),
          Observer(
            builder: (context) => Loader().visible(appStore.isLoading),
          ),
        ],
      ),
    );
  }
}
