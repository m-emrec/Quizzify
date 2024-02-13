class ImgPath {
  static String _pngImagePath(name) => "lib/core/assets/images/$name.png";
  static String scaffoldBackgroundImg = _pngImagePath("onboarding_background");

  static String friendsCardBgImg = _pngImagePath("friends_card_bg");
  static String friendsCardWithFriendsBgImg =
      _pngImagePath("friends_card_with_friends_bg");
}
