import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:first_may/app/presentation/widgets/buttons/base_button.dart';
import 'package:first_may/app/resources/app_color_scheme_extension.dart';
import 'package:first_may/app/resources/app_text_styles.dart';
import 'package:first_may/core/bloc/bloc_action.dart';
import 'package:first_may/core/utils/context_extensions.dart';
import 'package:first_may/gen/assets.gen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ShowInfoModal extends BlocAction {
  ShowInfoModal({
    this.title,
    this.description,
  });

  final String? title;
  final String? description;
}

Future<void> showInfoModal({
  required BuildContext context,
  required String iconSvgPath,
  required String title,
  required String description,
  String? buttonText,
  VoidCallback? onPressedButton,
  VoidCallback? onPressedClose,
  bool? isDismissible,
}) async {
  await showCustomModalBottomSheet(
    context: context,
    isDismissible: isDismissible ?? true,
    builder: (BuildContext _) => _InfoModal(
      context: context,
      iconSvgPath: iconSvgPath,
      title: title,
      description: description,
      buttonText: buttonText,
      onPressedButton: onPressedButton,
      onPressedClose: onPressedClose,
    ),
    containerWidget: (_, animation, child) => child,
    expand: false,
  );
}

class _InfoModal extends StatelessWidget {
  const _InfoModal({
    Key? key,
    required this.context,
    required this.iconSvgPath,
    required this.title,
    required this.description,
    this.buttonText,
    this.onPressedButton,
    this.onPressedClose,
  }) : super(key: key);

  final BuildContext context;
  final String iconSvgPath;
  final String title;
  final String description;
  final VoidCallback? onPressedButton;
  final VoidCallback? onPressedClose;
  final String? buttonText;

  @override
  Widget build(BuildContext _) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 16),
              _buildCloseButton(onPressed: onPressedClose),
              const SizedBox(height: 16),
              _buildImage(iconSvgPath: iconSvgPath),
              const SizedBox(height: 24),
              _buildTitle(text: title),
              const SizedBox(height: 8),
              _buildDescription(text: description),
              const SizedBox(height: 32),
              _buildButton(buttonText: buttonText, onPressed: onPressedButton),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton({VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: () {
        if (onPressed == null) {
          Navigator.pop(context);
        } else {
          onPressed.call();
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SvgPicture.asset(
            Assets.images.xCancel,
            width: 24,
            height: 24,
            color: context.colorScheme.onSurfaceDisabled,
          ),
          const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildImage({String? iconSvgPath}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SvgPicture.asset(
        iconSvgPath ?? Assets.images.cloudDownload1,
        width: 32,
        height: 32,
        color: context.colorScheme.onBackground,
      ),
    );
  }

  Widget _buildTitle({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.headlineSmall(
          context.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildDescription({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: AppTextStyles.bodyMedium(
          context.colorScheme.onSurface,
        ),
      ),
    );
  }

  Widget _buildButton({String? buttonText, VoidCallback? onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BaseButton(
        color: context.colorScheme.primary,
        textStyle: AppTextStyles.titleMedium(context.colorScheme.onPrimary),
        text: buttonText ?? context.localizations.clearlyUnderstood,
        onPressed: () {
          if (onPressed == null) {
            Navigator.pop(context);
          } else {
            onPressed.call();
          }
        },
      ),
    );
  }
}
