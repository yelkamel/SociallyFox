import 'package:flutter/material.dart';
import 'package:layoutools/layoutools.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'model/step_model.dart';
import 'widget/scalffold.dart';

class Funnel extends StatefulWidget {
  final List<FunnelStep> steps;
  final List<String> stops;
  final void Function(String) onFinish;
  const Funnel({
    Key? key,
    required this.steps,
    required this.stops,
    required this.onFinish,
  }) : super(key: key);

  @override
  State<Funnel> createState() => _FunnelState();
}

class _FunnelState extends State<Funnel> {
  final pageCtrl = PageController(initialPage: 0);
  int index = 0;
  bool showDot = true;

  Widget buildPage(BuildContext context, int index) {
    return StepScaffold(
      step: widget.steps[index],
      pageCtrl: pageCtrl,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.steps.length,
            controller: pageCtrl,
            onPageChanged: (_) {
              index = _;
              if (showDot != widget.steps[_].pagination) {
                setState(() {
                  showDot = widget.steps[_].pagination;
                });
              }
            },
            itemBuilder: buildPage,
          ),
        ),
        FadeInOutTransitionner(
          child: !showDot
              ? const SizedBox()
              : SafeArea(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothPageIndicator(
                        count: widget.steps.length,
                        controller: pageCtrl,
                        effect: const WormEffect(
                          dotWidth: 12,
                          dotHeight: 12,
                          dotColor: Color(0xffd8b28d),
                          activeDotColor: Color(0xffd67656),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
