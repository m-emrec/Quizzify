enum Img {
  scaffoldBackgroundImg("onboarding_background"),
  friendsCardBgImg("friends_card_bg"),
  friendsCardWithFriendsBgImg("friends_card_with_friends_bg"),
  addCoverImageIcon("AddCoverImageIcon"),
  multiChoiceIcon("Multi Choice Icon"),
  trueFalseIcon("TrueFalseICon"),
  ;

  static String pngImagePath(name) => "lib/core/assets/images/$name.png";
  static String pngIconPath(name) => "lib/core/assets/icons/$name.png";
  final String path;
  const Img(this.path);
}
