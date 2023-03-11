enum GoalType {
  improveShape(
      id: 1,
      assetPath: 'assets/images/goal1.png',
      title: 'Improve Shape',
      subtitle:
          "I have a low amount of body fat and need / want to build more muscle"),
  leanAndTone(
      id: 2,
      assetPath: 'assets/images/goal2.png',
      title: 'Lean & Tone',
      subtitle:
          "I’m “skinny fat”. Look thin but have no shape. I want to add learn muscle in the right way"),
  loseFat(
      id: 3,
      assetPath: 'assets/images/goal3.png',
      title: 'Lose a Fat',
      subtitle:
          "I have over 20 lbs to lose. I want to drop all this fat and gain muscle mass");

  final int id;
  final String assetPath;
  final String title;
  final String subtitle;

  const GoalType({
    required this.id,
    required this.assetPath,
    required this.title,
    required this.subtitle,
  });
}
