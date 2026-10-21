class NewsCard extends StatelessWidget {
  final Articles article;
  const NewsCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final articleImage = article.urlToImage ?? '';
    final articleTitle = article.title ?? 'No title available';
    final articleCategory = article.source?.name ?? 'News';

    return InkWell(
      onTap: () => Navigator.pushNamed(
        context,
        AppRoutes.details,
        arguments: {'image': articleImage, 'title': articleTitle, 'category': articleCategory},
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: articleImage.isNotEmpty
                  ? Image.network(
                      articleImage,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const ImagePlaceholder(),
                    )
                  : const ImagePlaceholder(),
            ),
            const SizedBox(height: 8),
            Text(articleCategory, style: const TextStyle(fontSize: 14, color: Color(0xffB0B3B8))),
            const SizedBox(height: 4),
            Text(articleTitle, style: const TextStyle(fontSize: 18, color: Color(0xffE4E6EB))),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}