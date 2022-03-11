import 'action_model.dart';

class FunnelStep {
  final String? id;
  final String? type;
  final String? text;
  final List<FunnelAction> actions;
  final bool pagination;

  FunnelStep({
    this.id,
    this.type,
    this.text,
    this.actions = const <FunnelAction>[],
    this.pagination = true,
  });

  bool get isNext => type == "next";
  bool get isAction => type == "action";

  @override
  String toString() => "$id / $type";
}
