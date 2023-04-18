import 'package:flutter/widgets.dart';
import 'package:first_may/app/presentation/widgets/others/text_with_paragraphs/text_with_paragraphs_item.dart';
import 'package:first_may/app/resources/app_text_styles.dart';

class TextWithParagraphs extends StatelessWidget {
  const TextWithParagraphs(
      {Key? key, this.indexStartsWith = 1, required this.items, this.textStyle, this.shrinkWrap = true})
      : super(key: key);

  final List<TextWithParagraphsItem> items;
  final int indexStartsWith;
  final TextStyle? textStyle;
  final bool shrinkWrap;

  @override
  Widget build(BuildContext context) => ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${index + indexStartsWith}.'),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    items[index].text,
                    style: textStyle ?? AppTextStyles.bodyMedium(),
                  ),
                ),
              ],
            ),
            if (items[index].image != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  items[index].image!,
                  const SizedBox(height: 12),
                ],
              ),
          ],
        ),
      );
}
