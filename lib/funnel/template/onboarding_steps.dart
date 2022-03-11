import '../model/action_model.dart';
import '../model/step_model.dart';

final onboardingstep = [
  FunnelStep(type: 'next', text: "Tout les jours, nous parlons."),
  FunnelStep(
      type: 'next',
      text: "Et certaine personne sont parfois plus aimante ou perssuasif."),
  FunnelStep(
      type: 'next',
      text:
          "C'est ce que j'ai remarqué, si tu le veux, je peux te partager ces astuces ?"),
  FunnelStep(
    type: 'action',
    text: "Tout les jours nous parlons",
    actions: [
      FunnelAction(
        text: "oui",
        type: "next",
        steps: [
          FunnelStep(
            type: 'finish',
          ),
        ],
      ),
      FunnelAction(
        text: "non",
        type: "next",
        steps: [
          FunnelStep(id: '13', type: 'sales-evolum'),
        ],
      ),
    ],
  ),
];
