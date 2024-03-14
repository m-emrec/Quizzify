part of overview_page;

class _QuestionsSheet extends StatelessWidget {
  const _QuestionsSheet();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Stack(
        /// I used Clip.none because [_topNotch] has negative position.
        clipBehavior: Clip.none,
        children: [
          /// Top notch
          Positioned(
            top: -16,
            left: constraints.maxWidth / 2 - 48,
            child: _topNotch(),
          ),

          ///Body
          _body(),
        ],
      ),
    );
  }
}

class _topNotch extends StatelessWidget {
  const _topNotch();

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 48,
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 4,
            backgroundColor: AppColors.homeScaffoldColor,
          ),
        ),
      ),
    );
  }
}

class _body extends StatelessWidget {
  const _body();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          AppBorderRadius.mediumBorderRadius +
              AppBorderRadius.smallBorderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppPaddings.smallPadding + AppPaddings.mediumPadding,
          horizontal: AppPaddings.mediumPadding,
        ),
        child: Column(
          children: [
            Column(
              children: [
                /// Title
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // title
                    Row(
                      children: [
                        Text(
                          "Questions",
                          style: context.textTheme.labelLarge,
                        ),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Card(
                            color: AppColors.elevatedButtonColor,
                            child: Center(
                              child: Text(
                                "5",
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    // Edit button
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit_outlined),
                    )
                  ],
                ),
                Gap(AppPaddings.mediumPadding),

                /// Questions
                _QuestionContainer(),
                Gap(AppPaddings.mediumPadding),
              ],
            ),

            /// Save Button
            Row(
              children: [
                ResponsiveElevatedButton(
                  label: "Save",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
