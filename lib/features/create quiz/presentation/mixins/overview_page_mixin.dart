part of overview_page;

mixin OverViewPageMixin on State<OverViewPage> {
  ThemeData _themeData(BuildContext context) => context.theme.copyWith(
        appBarTheme: context.theme.appBarTheme.copyWith(
          backgroundColor: AppColors.homeScaffoldColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: AppColors.homeScaffoldColor,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: context.theme.appBarTheme.titleTextStyle?.copyWith(
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        cardColor: Colors.white,
        scaffoldBackgroundColor: AppColors.homeScaffoldColor,
      );
}
