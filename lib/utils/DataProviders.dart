import 'package:englis_quiz/models/Model.dart';
import 'package:englis_quiz/screens/AboutUsScreen.dart';
import 'package:englis_quiz/screens/DailyQuizDescriptionScreen.dart';
import 'package:englis_quiz/screens/EarnPointScreen.dart';
import 'package:englis_quiz/screens/MyQuizHistoryScreen.dart';
import 'package:englis_quiz/screens/ProfileScreen.dart';
import 'package:englis_quiz/screens/QuizCategoryScreen.dart';
import 'package:englis_quiz/screens/SelfChallengeFormScreen.dart';
import 'package:englis_quiz/utils/strings.dart';
import 'package:nb_utils/nb_utils.dart';

import 'constants.dart';
import 'images.dart';

String description =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

List<DrawerItemModel> getDrawerItems() {
  List<DrawerItemModel> drawerItems = [];
  drawerItems.add(DrawerItemModel(name: lbl_home, image: HomeImage));
  drawerItems.add(DrawerItemModel(name: lbl_profile, image: ProfileImage, widget: ProfileScreen()));
  drawerItems.add(DrawerItemModel(name: lbl_daily_quiz, image: DailyQuizImage, widget: DailyQuizDescriptionScreen()));
  drawerItems.add(DrawerItemModel(name: lbl_quiz_category, image: QuizCategoryImage, widget: QuizCategoryScreen()));
  drawerItems.add(DrawerItemModel(name: lbl_self_challenge, image: SelfChallengeImage, widget: SelfChallengeFormScreen()));
  drawerItems.add(DrawerItemModel(name: lbl_my_quiz_history, image: QuizHistoryImage, widget: MyQuizHistoryScreen()));
  if (!getBoolAsync(DISABLE_AD)) drawerItems.add(DrawerItemModel(name: lbl_earn_points, image: EarnPointsImage, widget: EarnPointScreen()));
  drawerItems.add(DrawerItemModel(name: lbl_about_us, image: AboutUsImage, widget: AboutUsScreen()));
  drawerItems.add(DrawerItemModel(name: lbl_rate_us, image: RateUsImage));
  drawerItems.add(DrawerItemModel(name: lbl_privacy_policy, image: PrivacyPolicyImage));
  drawerItems.add(DrawerItemModel(name: lbl_terms_and_conditions, image: TermsAndConditionsImage));
  drawerItems.add(DrawerItemModel(name: lbl_logout, image: LogoutImage));
  return drawerItems;
}

List<WalkThroughItemModel> getWalkThroughItems() {
  List<WalkThroughItemModel> walkThroughItems = [];
  walkThroughItems.add(WalkThroughItemModel(
    image: WalkThroughImage1,
    title: 'Create your own game',
    subTitle: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  ));
  walkThroughItems.add(WalkThroughItemModel(
    image: WalkThroughImage2,
    title: 'Challenge Your Friends',
    subTitle: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  ));
  walkThroughItems.add(WalkThroughItemModel(
    image: WalkThroughImage3,
    title: 'Watch Leaderboard',
    subTitle: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
  ));
  return walkThroughItems;
}
