class ConstellationDef {
  const ConstellationDef({
    required this.id,
    required this.name,
    required this.description,
    required this.nodes,
  });

  final String id;
  final String name;
  final String description;
  final List<ConstellationNode> nodes; // 7 nodes each
}

class ConstellationNode {
  const ConstellationNode({
    required this.name,
    required this.criteria,
  });

  final String name;
  final String criteria; // Simplified criteria description
}

class ConstellationCatalog {
  ConstellationCatalog._();

  static const all = [
    ConstellationDef(
      id: 'wanderer', name: 'The Wanderer', description: 'Beginnings',
      nodes: [
        ConstellationNode(name: 'First Step', criteria: 'Complete first habit'),
        ConstellationNode(name: 'Second Day', criteria: 'Return on day 2'),
        ConstellationNode(name: 'Third Light', criteria: 'Reach 3-day streak'),
        ConstellationNode(name: 'Week One', criteria: 'Reach 7-day streak'),
        ConstellationNode(name: 'Two Habits', criteria: 'Have 2 active habits'),
        ConstellationNode(name: 'First Note', criteria: 'Write a completion note'),
        ConstellationNode(name: 'Perfect Day', criteria: 'Complete all habits in a day'),
      ],
    ),
    ConstellationDef(
      id: 'builder', name: 'The Builder', description: 'Construction',
      nodes: [
        ConstellationNode(name: 'Five Active', criteria: '5 active habits'),
        ConstellationNode(name: 'Category Used', criteria: 'Use 3 categories'),
        ConstellationNode(name: 'Stone Habit', criteria: 'Create a Stone+ habit'),
        ConstellationNode(name: 'Linked Pair', criteria: 'Link 2 habits'),
        ConstellationNode(name: 'Stack Chain', criteria: 'Complete a 2-chain'),
        ConstellationNode(name: '500 Mass', criteria: 'Accumulate 500 mass'),
        ConstellationNode(name: '1000 Mass', criteria: 'Accumulate 1000 mass'),
      ],
    ),
    ConstellationDef(
      id: 'phoenix', name: 'The Phoenix', description: 'Recovery',
      nodes: [
        ConstellationNode(name: 'First Recovery', criteria: 'Return after missing a day'),
        ConstellationNode(name: 'Skip With Grace', criteria: 'Skip with a reason'),
        ConstellationNode(name: 'Freeze Used', criteria: 'Have a freeze save a streak'),
        ConstellationNode(name: 'Comeback', criteria: 'Return after 3+ days'),
        ConstellationNode(name: 'Recovery Quest', criteria: 'Complete a recovery quest'),
        ConstellationNode(name: 'Surpass', criteria: 'Surpass a broken streak'),
        ConstellationNode(name: '10 Reflections', criteria: 'Write 10 reflection notes'),
      ],
    ),
    ConstellationDef(
      id: 'composer', name: 'The Composer', description: 'Variety',
      nodes: [
        ConstellationNode(name: '3 Categories', criteria: 'Use 3 categories'),
        ConstellationNode(name: 'All Types', criteria: 'Use binary, count, and duration'),
        ConstellationNode(name: 'Sound On', criteria: 'Enable sound'),
        ConstellationNode(name: 'Palette Changed', criteria: 'Change palette'),
        ConstellationNode(name: '5 Colors', criteria: 'Use 5 habit colors'),
        ConstellationNode(name: '10 Emojis', criteria: 'Use 10 different emojis'),
        ConstellationNode(name: 'Custom Palette', criteria: 'Unlock custom palette editor'),
      ],
    ),
    ConstellationDef(
      id: 'navigator', name: 'The Navigator', description: 'Endurance',
      nodes: [
        ConstellationNode(name: '30-Day Streak', criteria: '30-day streak on any habit'),
        ConstellationNode(name: '100 Completions', criteria: '100 total completions'),
        ConstellationNode(name: '500 Completions', criteria: '500 total completions'),
        ConstellationNode(name: '100-Day Streak', criteria: '100-day streak'),
        ConstellationNode(name: '1000 Completions', criteria: '1000 total completions'),
        ConstellationNode(name: 'Year Installed', criteria: 'App installed for 1 year'),
        ConstellationNode(name: '2 Years Installed', criteria: 'App installed for 2 years'),
      ],
    ),
    ConstellationDef(
      id: 'alchemist', name: 'The Alchemist', description: 'Mastery',
      nodes: [
        ConstellationNode(name: 'First Chain', criteria: 'Complete a 2-chain'),
        ConstellationNode(name: 'Triple Chain', criteria: 'Complete a 3-chain'),
        ConstellationNode(name: 'Quad Chain', criteria: 'Complete a 4+ chain'),
        ConstellationNode(name: '4-Habit Stack', criteria: 'Have 4 linked habits'),
        ConstellationNode(name: '25 Quests', criteria: 'Complete 25 daily quests'),
        ConstellationNode(name: '50 Quests', criteria: 'Complete 50 daily quests'),
        ConstellationNode(name: '100 Quests', criteria: 'Complete 100 daily quests'),
      ],
    ),
    ConstellationDef(
      id: 'oracle', name: 'The Oracle', description: 'Reflection',
      nodes: [
        ConstellationNode(name: 'First Mood', criteria: 'Log first mood'),
        ConstellationNode(name: '30 Moods', criteria: 'Log 30 moods'),
        ConstellationNode(name: '100 Moods', criteria: 'Log 100 moods'),
        ConstellationNode(name: '50 Notes', criteria: 'Write 50 notes'),
        ConstellationNode(name: '200 Notes', criteria: 'Write 200 notes'),
        ConstellationNode(name: '365 Mood Logs', criteria: 'Log 365 moods'),
        ConstellationNode(name: 'Year in Review', criteria: 'Complete a year-in-review'),
      ],
    ),
    ConstellationDef(
      id: 'gravity_itself', name: 'Gravity Itself', description: 'Legend',
      nodes: [
        ConstellationNode(name: 'Tier 25', criteria: 'Reach Tier 25'),
        ConstellationNode(name: 'Tier 50', criteria: 'Reach Tier 50'),
        ConstellationNode(name: 'Tier 75', criteria: 'Reach Tier 75'),
        ConstellationNode(name: '100K Mass', criteria: 'Accumulate 100,000 mass'),
        ConstellationNode(name: '500K Mass', criteria: 'Accumulate 500,000 mass'),
        ConstellationNode(name: 'Tier 100', criteria: 'Reach Tier 100'),
        ConstellationNode(name: '1M Mass', criteria: 'Accumulate 1,000,000 mass'),
      ],
    ),
  ];
}
