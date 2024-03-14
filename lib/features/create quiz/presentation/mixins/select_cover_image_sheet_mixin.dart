part of add_cover_image_container;

mixin SelectCoverImageSheetMixin on State<SelectCoverImageBottomSheet> {
  late AnimationController animationController;
  late double containerHeight;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this as TickerProvider,
      duration: Duration(milliseconds: 300),
    );
    animationController.animateTo(0.7);
    animationController.addListener(listener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    containerHeight = context.dynamicHeight(0.8);
  }

  @override
  void dispose() {
    animationController.removeListener(listener);
    animationController.dispose();
    super.dispose();
  }

  listener() {
    setState(() {});
  }

  imageContainer(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
      child: Image(
        image: NetworkImage(url),
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          return child;
        },
        loadingBuilder: (context, child, loadingProgress) {
          /// if image is loaded return image
          if (loadingProgress?.cumulativeBytesLoaded ==
              loadingProgress?.expectedTotalBytes) {
            return child;
          }

          /// else show progress indicator.
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  List<Widget> get images => List.generate(_CoverImages.values.length,
      (index) => imageContainer(_CoverImages.values[index].link));
}
