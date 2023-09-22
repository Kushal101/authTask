
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/articles.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity ? article;
  final bool ? isRemovable;
  final void Function(ArticleEntity article) ? onRemove;
  final void Function(ArticleEntity article) ? onArticlePressed;

  const ArticleWidget({
    Key ? key,
    this.article,
    this.onArticlePressed,
    this.isRemovable = false,
    this.onRemove,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [

            _buildTitleAndDescription(),

          ],
        ),
      ),
    );
  }



  Widget _buildTitleAndDescription() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              article!.title?? '',
              maxLines : 3,
              overflow : TextOverflow.ellipsis,
              style: const TextStyle(
                fontFamily: 'Butler',
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black87,
              ),
            ),

            // Description
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article!.body ?? '',
                  maxLines : 2,
                ),
              ),
            ),

            // Datetime
            Row(
              children: [
                const Icon(Icons.timeline_outlined, size: 16),
                const SizedBox(width: 4),
                Text(
                  article!.userId!.toString(),
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }



  void _onTap() {
    if (onArticlePressed != null) {
      onArticlePressed!(article!);
    }
  }


}