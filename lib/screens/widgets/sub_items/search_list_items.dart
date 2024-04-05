import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_c10_monday/models/NewsSearchModel.dart';
import 'package:new_c10_monday/screens/news_details_page.dart';

class SearchListItems extends StatelessWidget {
  final Articles articles;

  const SearchListItems({required this.articles});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, top: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NewsDetailsPage(articles: articles),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.24,
                      child: CachedNetworkImage(
                        imageUrl: articles.urlToImage ?? "",
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Text(
              articles.source!.name.toString(),
              style: Theme.of(context).textTheme.displaySmall,
            ),
            Text(
              articles.title.toString(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Divider(
              endIndent: 10,
              indent: 10,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}
