class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, color: Colors.redAccent, size: 45),
            const SizedBox(height: 12),
            Text(message, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white)),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => context.read<NewsCubit>().getNews(),
              child: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator(color: Color(0xff1877F2)));
  }
}

class EmptyNewsWidget extends StatelessWidget {
  const EmptyNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No news available.', style: TextStyle(color: Colors.white)));
  }
}

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: const Color(0xff303030),
      alignment: Alignment.center,
      child: const Icon(Icons.image_not_supported_outlined, color: Colors.white54, size: 45),
    );
  }
}