import './step_model.dart';

class FunnelAction {
  final String? text;
  final String? type;
  final List<FunnelStep> steps;

  FunnelAction({
    this.text,
    this.type,
    this.steps = const [],
  });
}
