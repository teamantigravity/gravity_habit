import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';

class HabitTemplate {
  const HabitTemplate({
    required this.id,
    required this.name,
    required this.emoji,
    required this.color,
    required this.category,
    this.description,
    this.whyText,
    this.suggestedFrequency = HabitFrequency.daily,
    this.gravityClass = GravityClass.pebble,
  });

  final String id;
  final String name;
  final String emoji;
  final int color;
  final String category;
  final String? description;
  final String? whyText;
  final HabitFrequency suggestedFrequency;
  final GravityClass gravityClass;
}

class HabitTemplates {
  HabitTemplates._();

  /// 12 starter templates shown during onboarding (curated subset).
  static List<HabitTemplate> get starters => [
        all[0], // Drink Water
        all[8], // Meditate
        all[10], // Read
        all[16], // Workout
        all[24], // Text a Friend
        all[28], // Plan Tomorrow
        all[13], // Gratitude
        all[20], // Write
        all[4], // Take Vitamins
        all[33], // Reflect
        all[6], // Walk After Meal
        all[14], // Breathwork
      ];

  static const all = <HabitTemplate>[
    // ---- HEALTH (0-7) ----
    HabitTemplate(
      id: 'h_water',
      name: 'Drink Water',
      emoji: '💧',
      color: 0xFF40C4FF,
      category: 'Health',
      description: 'Stay hydrated throughout the day',
      whyText:
          'Proper hydration improves energy, focus, and physical performance.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'h_steps',
      name: '10,000 Steps',
      emoji: '🚶',
      color: 0xFF66BB6A,
      category: 'Health',
      description: 'Walk at least 10,000 steps',
      whyText:
          'Regular walking reduces cardiovascular risk and improves mood.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'h_stretch',
      name: 'Stretch',
      emoji: '🧘',
      color: 0xFFAB47BC,
      category: 'Health',
      description: '5 minutes of stretching',
      whyText: 'Stretching improves flexibility, reduces injury risk, and eases tension.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'h_sleep',
      name: 'Sleep 8 Hours',
      emoji: '😴',
      color: 0xFF5C6BC0,
      category: 'Health',
      description: 'Get a full night of rest',
      whyText: 'Quality sleep is the foundation of physical and mental health.',
      gravityClass: GravityClass.boulder,
    ),
    HabitTemplate(
      id: 'h_vitamins',
      name: 'Take Vitamins',
      emoji: '💊',
      color: 0xFFFF7043,
      category: 'Health',
      description: 'Take daily supplements',
      whyText: 'Consistent supplementation fills nutritional gaps.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'h_floss',
      name: 'Floss',
      emoji: '🦷',
      color: 0xFFE0E0E0,
      category: 'Health',
      description: 'Floss your teeth',
      whyText: 'Flossing prevents gum disease and tooth decay.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'h_cold_shower',
      name: 'Cold Shower',
      emoji: '🥶',
      color: 0xFF29B6F6,
      category: 'Health',
      description: '30 seconds of cold water',
      whyText: 'Cold exposure improves alertness and resilience.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'h_walk_meal',
      name: 'Walk After Meal',
      emoji: '🌿',
      color: 0xFF81C784,
      category: 'Health',
      description: '10-minute walk after eating',
      whyText: 'Post-meal walking helps regulate blood sugar.',
      gravityClass: GravityClass.pebble,
    ),

    // ---- MIND (8-14) ----
    HabitTemplate(
      id: 'm_meditate',
      name: 'Meditate',
      emoji: '🧘‍♂️',
      color: 0xFF7E57C2,
      category: 'Mind',
      description: '5 minutes of mindful breathing',
      whyText: 'Meditation reduces stress and improves emotional regulation.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'm_journal',
      name: 'Journal',
      emoji: '📓',
      color: 0xFFFFB74D,
      category: 'Mind',
      description: 'Write about your day',
      whyText: 'Journaling clarifies thoughts and processes emotions.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'm_read',
      name: 'Read',
      emoji: '📚',
      color: 0xFF4FC3F7,
      category: 'Mind',
      description: '20 minutes of reading',
      whyText: 'Reading builds knowledge and strengthens focus.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'm_learn',
      name: 'Learn Something',
      emoji: '🎓',
      color: 0xFF4DD0E1,
      category: 'Mind',
      description: 'Spend time learning a new skill',
      whyText: 'Continuous learning keeps the mind sharp and adaptable.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'm_no_phone',
      name: 'No Phone First Hour',
      emoji: '📵',
      color: 0xFFEF5350,
      category: 'Mind',
      description: 'Start the day without screens',
      whyText: 'Avoiding screens early protects your attention and calm.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'm_gratitude',
      name: 'Gratitude',
      emoji: '🙏',
      color: 0xFFFFD54F,
      category: 'Mind',
      description: 'Write 3 things you are grateful for',
      whyText: 'Gratitude practice is linked to greater happiness and resilience.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'm_breathwork',
      name: 'Breathwork',
      emoji: '🌬️',
      color: 0xFF80DEEA,
      category: 'Mind',
      description: '3 minutes of intentional breathing',
      whyText: 'Breathwork activates the parasympathetic nervous system.',
      gravityClass: GravityClass.feather,
    ),

    // ---- BODY (15-21) ----
    HabitTemplate(
      id: 'b_workout',
      name: 'Workout',
      emoji: '💪',
      color: 0xFFEF5350,
      category: 'Body',
      description: '30 minutes of exercise',
      whyText: 'Regular exercise improves mood, energy, and longevity.',
      gravityClass: GravityClass.boulder,
    ),
    HabitTemplate(
      id: 'b_workout2',
      name: 'Workout',
      emoji: '🏋️',
      color: 0xFFEF5350,
      category: 'Body',
      description: '30 minutes of exercise',
      whyText: 'Regular exercise improves mood, energy, and longevity.',
      gravityClass: GravityClass.boulder,
    ),
    HabitTemplate(
      id: 'b_yoga',
      name: 'Yoga',
      emoji: '🧘‍♀️',
      color: 0xFFCE93D8,
      category: 'Body',
      description: '20 minutes of yoga practice',
      whyText: 'Yoga improves flexibility, balance, and mental clarity.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'b_pushups',
      name: 'Push-ups',
      emoji: '🫸',
      color: 0xFFFF8A65,
      category: 'Body',
      description: 'Daily push-up set',
      whyText: 'Push-ups build functional strength with no equipment.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'b_plank',
      name: 'Plank',
      emoji: '🏗️',
      color: 0xFFA1887F,
      category: 'Body',
      description: 'Hold a plank for 60 seconds',
      whyText: 'Planks strengthen the core and improve posture.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'b_run',
      name: 'Run',
      emoji: '🏃',
      color: 0xFF66BB6A,
      category: 'Body',
      description: 'Go for a run',
      whyText: 'Running boosts cardiovascular health and mental resilience.',
      gravityClass: GravityClass.boulder,
    ),
    HabitTemplate(
      id: 'b_swim',
      name: 'Swim',
      emoji: '🏊',
      color: 0xFF29B6F6,
      category: 'Body',
      description: 'Swimming session',
      whyText: 'Swimming is a full-body workout gentle on joints.',
      gravityClass: GravityClass.boulder,
    ),

    // ---- CREATIVE (22-25) ----
    HabitTemplate(
      id: 'c_write',
      name: 'Write',
      emoji: '✍️',
      color: 0xFF78909C,
      category: 'Creative',
      description: 'Write for 15 minutes',
      whyText: 'Writing is thinking. A daily practice sharpens your voice.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'c_sketch',
      name: 'Sketch',
      emoji: '🎨',
      color: 0xFFFF8A80,
      category: 'Creative',
      description: 'Draw or sketch something',
      whyText: 'Sketching trains observation and creative expression.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'c_instrument',
      name: 'Practice Instrument',
      emoji: '🎵',
      color: 0xFFBA68C8,
      category: 'Creative',
      description: '15 minutes of practice',
      whyText: 'Musical practice builds discipline and joy in equal measure.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'c_photo',
      name: 'Take a Photo',
      emoji: '📷',
      color: 0xFF90A4AE,
      category: 'Creative',
      description: 'Capture one meaningful photo',
      whyText: 'Photography cultivates mindful observation.',
      gravityClass: GravityClass.feather,
    ),

    // ---- CONNECTION (26-30) ----
    HabitTemplate(
      id: 'cn_text',
      name: 'Text a Friend',
      emoji: '💬',
      color: 0xFF4FC3F7,
      category: 'Connection',
      description: 'Reach out to someone you care about',
      whyText: 'Small acts of connection strengthen relationships.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'cn_call',
      name: 'Call Family',
      emoji: '📞',
      color: 0xFF66BB6A,
      category: 'Connection',
      description: 'Call a family member',
      whyText: 'Regular contact nurtures bonds that matter most.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'cn_compliment',
      name: 'Give a Compliment',
      emoji: '🌟',
      color: 0xFFFFD54F,
      category: 'Connection',
      description: 'Offer genuine praise to someone',
      whyText: 'Compliments uplift others and strengthen your own positivity.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'cn_eye_contact',
      name: 'Eye Contact at Meals',
      emoji: '👀',
      color: 0xFFFFAB91,
      category: 'Connection',
      description: 'Be present during shared meals',
      whyText: 'Presence deepens connection more than words.',
      gravityClass: GravityClass.feather,
    ),

    // ---- PRODUCTIVITY (30-34) ----
    HabitTemplate(
      id: 'p_inbox',
      name: 'Inbox Zero',
      emoji: '📧',
      color: 0xFF42A5F5,
      category: 'Productivity',
      description: 'Process all emails',
      whyText: 'A clear inbox reduces cognitive load.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'p_plan',
      name: 'Plan Tomorrow',
      emoji: '📋',
      color: 0xFFFFCA28,
      category: 'Productivity',
      description: 'Write out tomorrow\'s priorities',
      whyText: 'Planning the night before reduces morning decision fatigue.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'p_deep_work',
      name: 'Deep Work',
      emoji: '🎯',
      color: 0xFFEF5350,
      category: 'Productivity',
      description: '90 minutes of focused work',
      whyText: 'Deep work produces results that shallow work never can.',
      gravityClass: GravityClass.planet,
    ),

    // ---- SPIRIT (33-36) ----
    HabitTemplate(
      id: 's_reflect',
      name: 'Reflect',
      emoji: '🌅',
      color: 0xFFFFB74D,
      category: 'Spirit',
      description: '5 minutes of quiet reflection',
      whyText: 'Reflection turns experience into wisdom.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 's_pray',
      name: 'Pray',
      emoji: '🙏',
      color: 0xFFCE93D8,
      category: 'Spirit',
      description: 'Daily prayer or contemplation',
      whyText: 'Prayer centers the mind and connects to purpose.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 's_nature',
      name: 'Time in Nature',
      emoji: '🌳',
      color: 0xFF66BB6A,
      category: 'Spirit',
      description: 'Spend time outdoors',
      whyText: 'Nature exposure reduces stress and restores attention.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 's_sunset',
      name: 'Watch Sunset',
      emoji: '🌇',
      color: 0xFFFF7043,
      category: 'Spirit',
      description: 'Pause to watch the sun set',
      whyText: 'Witnessing the end of day cultivates presence.',
      gravityClass: GravityClass.feather,
    ),

    // ---- RECOVERY (37-41) ----
    HabitTemplate(
      id: 'r_no_alcohol',
      name: 'No Alcohol',
      emoji: '🚫',
      color: 0xFFEF5350,
      category: 'Recovery',
      description: 'Alcohol-free day',
      whyText: 'Each sober day builds clarity and health.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'r_no_social',
      name: 'No Social Media',
      emoji: '📵',
      color: 0xFF78909C,
      category: 'Recovery',
      description: 'Stay off social media today',
      whyText: 'Breaks from social media reduce anxiety and comparison.',
      gravityClass: GravityClass.stone,
    ),
    HabitTemplate(
      id: 'r_tech_free',
      name: 'Tech-Free Hour',
      emoji: '🔌',
      color: 0xFF90A4AE,
      category: 'Recovery',
      description: 'One hour without screens',
      whyText: 'Tech-free time restores attention and reduces eye strain.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'r_early_bed',
      name: 'Early Bedtime',
      emoji: '🌙',
      color: 0xFF5C6BC0,
      category: 'Recovery',
      description: 'In bed by 10 PM',
      whyText: 'Consistent early sleep improves every aspect of health.',
      gravityClass: GravityClass.stone,
    ),

    // ---- EXTRA HEALTH ----
    HabitTemplate(
      id: 'h_cycle',
      name: 'Cycle',
      emoji: '🚴',
      color: 0xFF26A69A,
      category: 'Body',
      description: 'Go for a bike ride',
      whyText: 'Cycling builds endurance and is gentle on joints.',
      gravityClass: GravityClass.stone,
    ),

    // ---- EXTRA PRODUCTIVITY ----
    HabitTemplate(
      id: 'p_no_phone_am',
      name: 'No Phone First Hour',
      emoji: '🌅',
      color: 0xFFFF7043,
      category: 'Productivity',
      description: 'Start the day without your phone',
      whyText: 'Protecting the first hour protects your entire day.',
      gravityClass: GravityClass.pebble,
    ),

    // ---- EXTRA MIND ----
    HabitTemplate(
      id: 'm_deep_breath',
      name: 'Deep Breathing',
      emoji: '🌬️',
      color: 0xFF80CBC4,
      category: 'Mind',
      description: 'Box breathing for 3 minutes',
      whyText: 'Deep breathing calms the nervous system in minutes.',
      gravityClass: GravityClass.feather,
    ),

    // ---- EXTRAS to reach 50 ----
    HabitTemplate(
      id: 'h_sunlight',
      name: 'Morning Sunlight',
      emoji: '☀️',
      color: 0xFFFFD54F,
      category: 'Health',
      description: '10 min of morning sunlight',
      whyText: 'Morning light regulates circadian rhythm and boosts alertness.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'h_posture',
      name: 'Posture Check',
      emoji: '🧍',
      color: 0xFF90A4AE,
      category: 'Health',
      description: 'Check and correct posture',
      whyText: 'Good posture reduces pain and improves confidence.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 'c_podcast',
      name: 'Listen to Podcast',
      emoji: '🎧',
      color: 0xFF7E57C2,
      category: 'Mind',
      description: 'Listen to an educational podcast',
      whyText: 'Podcasts turn passive time into learning opportunities.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'p_review',
      name: 'Daily Review',
      emoji: '📊',
      color: 0xFF42A5F5,
      category: 'Productivity',
      description: 'Review what you accomplished today',
      whyText: 'Daily review turns effort into self-awareness.',
      gravityClass: GravityClass.pebble,
    ),
    HabitTemplate(
      id: 'cn_listen',
      name: 'Active Listening',
      emoji: '👂',
      color: 0xFF4DB6AC,
      category: 'Connection',
      description: 'Listen fully in one conversation',
      whyText: 'Listening is the rarest and most valuable form of attention.',
      gravityClass: GravityClass.feather,
    ),
    HabitTemplate(
      id: 's_silence',
      name: 'Sit in Silence',
      emoji: '🤫',
      color: 0xFF78909C,
      category: 'Spirit',
      description: '5 minutes of complete silence',
      whyText: 'Silence reveals what noise covers up.',
      gravityClass: GravityClass.feather,
    ),
  ];
}
