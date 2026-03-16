class StepModel {
  final String title;
  final String description;

  const StepModel({
    required this.title,
    required this.description,
  });
}

const List<StepModel> onboardingSteps = [
  StepModel(
    title: 'Choose a deck',
    description: 'for the relationship you want to tend.',
  ),
  StepModel(
    title: 'Draw a card',
    description: 'flip to reveal a question worth sitting with.',
  ),
  StepModel(
    title: 'Talk, reflect',
    description: 'save the ones that stay with you.',
  ),
];