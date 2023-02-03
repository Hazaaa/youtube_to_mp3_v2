import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:youtube_to_mp3_v2/store/main_store.dart';
import 'package:youtube_to_mp3_v2/widgets/input.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<MainStore>(context);
    final size = MediaQuery.of(context).size;

    return Observer(
      builder: (_) => SizedBox(
        width: size.width,
        child: Stack(
          children: [
            AnimatedPositioned(
              top: !store.actionInProgress && store.videoMetadata == null
                  ? size.height * 0.4
                  : size.height * 0.05,
              left: 0,
              right: 0,
              bottom: 0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: const Input(),
              ),
            ),
            Positioned(
              top: size.height * 0.4,
              left: size.width * 0.45,
              child: AnimatedOpacity(
                opacity: store.actionInProgress ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 400),
                child: const SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 6.0,
                    color: Colors.red,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
