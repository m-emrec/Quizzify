import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:trivia/core/extensions/navigation_extension.dart';

import '../../../../core/constants/app_border_radius.dart';
import '../../../../core/constants/app_color.dart';
import '../../../../core/constants/app_paddings.dart';
import '../../../../core/extensions/context_extension.dart';

enum _CoverImages {
  /// TODO : Remove backgrounds
  image1(
      "https://i.pinimg.com/564x/ca/58/7e/ca587e8b8339d39d34deac6ad27e0b52.jpg"),
  image2(
      "https://img.freepik.com/free-vector/hand-drawn-flat-design-shrug-illustration_23-2149333528.jpg?t=st=1708612524~exp=1708616124~hmac=d4fbb8e3ff8a8b1291c9d2866d734c45d1861c53bab3aeb2ed37454fbe6095f0&w=1380"),
  image3(
      "https://img.freepik.com/free-vector/flat-design-shrug-illustration_23-2149335659.jpg?t=st=1708612742~exp=1708616342~hmac=53751f6a3fd3af6c102d0e9b70fffeb97a9062d05f13b110d561df5f7f1121f3&w=1380"),
  image4(
      "https://img.freepik.com/free-vector/website-faq-section-user-helpdesk-customer-support-frequently-asked-questions-problem-solution-quiz-game-confused-man-cartoon-character_335657-12.jpg?t=st=1708612763~exp=1708616363~hmac=fd69c167a1a8676658acc9a72c6dd6b210333fe80f6482cb024c3b44e5959200&w=1380"),
  image5(
      "https://img.freepik.com/free-vector/bad-idea-concept-illustration_114360-8021.jpg?t=st=1708612782~exp=1708616382~hmac=b6691e1e6424807bf44eab2c39759244f4e1bebb2384fb3d7ee7bbe9b568516f&w=1380"),
  image6(
      "https://img.freepik.com/free-vector/guy-desing-creativity-icon-isolated_24911-109637.jpg?t=st=1708612807~exp=1708616407~hmac=a8fde82d98640b65f05cce1b932c3ca4ad94829b942abff1956e204b0a76c752&w=1380"),
  image7(
      "https://img.freepik.com/free-vector/flat-design-shrug-illustration_23-2149335660.jpg?t=st=1708612829~exp=1708616429~hmac=c8869df66c231ae9aca297953f7c49416721a76b9dd79d9f81a7561f3246146f&w=1380"),
  ;

  final String link;
  const _CoverImages(this.link);
}

class AddCoverImageContainer extends StatefulWidget {
  const AddCoverImageContainer({
    super.key,
    this.aspectRatio = 19 / 13,
  });

  final double aspectRatio;

  @override
  State<AddCoverImageContainer> createState() => _AddCoverImageContainerState();
}

class _AddCoverImageContainerState extends State<AddCoverImageContainer> {
  final String addCoverImageText = "Add Cover Image";

  final double iconSize = 64;
  _CoverImages? bgImage;
  showImageSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CustomBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.aspectRatio,
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(AppBorderRadius.bigBorderRadius),
        color: AppColors.scaffoldColor,
        child: InkWell(
          onTap: () => showImageSheet(context),
          child: Container(
            child: AnimatedCrossFade(
              duration: Duration(milliseconds: 300),
              crossFadeState: CrossFadeState.showFirst,
              firstChild: Center(
                child: Padding(
                  padding: EdgeInsets.all(AppPaddings.bigPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.photo_outlined,
                        size: iconSize,
                        color: AppColors.elevatedButtonColor,
                      ),
                      Gap(AppPaddings.mediumPadding),
                      Text(
                        addCoverImageText,
                        style: context.textTheme.labelLarge
                            ?.copyWith(color: AppColors.elevatedButtonColor),
                      ),
                    ],
                  ),
                ),
              ),
              secondChild: Image(
                image: NetworkImage(_CoverImages.image1.link),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late double containerHeight;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animationController.animateTo(0.6);
    _animationController.addListener(listener);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    containerHeight = context.dynamicHeight(0.8);
  }

  @override
  void dispose() {
    _animationController.removeListener(listener);
    _animationController.dispose();
    super.dispose();
  }

  listener() {
    setState(() {});
  }

  imageContainer(String url) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(AppBorderRadius.mediumBorderRadius),
        child: Image.network(url));
  }

  List<Widget> get images => List.generate(_CoverImages.values.length,
      (index) => imageContainer(_CoverImages.values[index].link));

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      // backgroundColor: Colors.transparent,
      dragHandleSize: Size.fromRadius(4),
      dragHandleColor: AppColors.elevatedButtonColor,
      enableDrag: true,
      showDragHandle: true,
      animationController: _animationController,
      onClosing: () => context.navigator.pop<_CoverImages>(_CoverImages.image2),
      builder: (context) {
        return Stack(
          children: [
            Container(
              height: containerHeight * _animationController.value,
              constraints:
                  BoxConstraints(maxHeight: context.dynamicHeight(0.8)),
              width: double.maxFinite,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                children: images,
              ),
            ),
          ],
        );
      },
    );
  }
}
