import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:gravity_habit/ui/widgets/stardust_counter.dart';

class ShopScreen extends ConsumerStatefulWidget {
  const ShopScreen({super.key});

  @override
  ConsumerState<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends ConsumerState<ShopScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cosmos Shop', style: TextStyle(fontFamily: 'SpaceGrotesk')),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: const [
            Tab(text: 'Themes'),
            Tab(text: 'Planets'),
            Tab(text: 'Avatars'),
            Tab(text: 'Sound'),
            Tab(text: 'Icons'),
            Tab(text: 'Particles'),
            Tab(text: 'Ambient'),
            Tab(text: 'Orbit Paths'),
          ],
        ),
      ),
      body: Column(
        children: [
          // Stardust balance
          Padding(
            padding: const EdgeInsets.all(Spacing.md),
            child: FutureBuilder(
              future: ref.read(orbitRepositoryProvider).getProfile(),
              builder: (context, snapshot) {
                final stardust = snapshot.data?.collectedStardust ?? 0;
                return Row(
                  children: [
                    StardustCounter(count: stardust, size: StardustSize.large),
                    const Spacer(),
                    Text(
                      'All cosmetics. Zero gameplay impact.',
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colors.onSurface.withOpacity(0.4),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _ShopGrid(items: _themeItems, onPurchase: _purchase),
                _ShopGrid(items: _planetItems, onPurchase: _purchase),
                _ShopGrid(items: _avatarItems, onPurchase: _purchase),
                _ShopGrid(items: _soundItems, onPurchase: _purchase),
                _ShopGrid(items: _iconItems, onPurchase: _purchase),
                _ShopGrid(items: _particleItems, onPurchase: _purchase),
                _ShopGrid(items: _ambientItems, onPurchase: _purchase),
                _ShopGrid(items: _constellationItems, onPurchase: _purchase),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _purchase(ShopItem item) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Purchase ${item.name}'),
        content: Text('Spend ${item.cost} Stardust on ${item.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Purchase'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      final success =
          await ref.read(orbitRepositoryProvider).spendStardust(item.cost);
      if (success && mounted) {
        ref.read(hapticServiceProvider).play(HapticType.complete);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${item.name} unlocked')),
        );
        setState(() {});
      } else if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Not enough Stardust')),
        );
      }
    }
  }

  // Planet skins (24 items, 300 Stardust each)
  static final _planetItems = [
    ShopItem(id: 'ps_terra', name: 'Terra', cost: 300, emoji: '🌍'),
    ShopItem(id: 'ps_mars', name: 'Mars', cost: 300, emoji: '🔴'),
    ShopItem(id: 'ps_jupiter', name: 'Jupiter', cost: 300, emoji: '🟠'),
    ShopItem(id: 'ps_saturn', name: 'Saturn', cost: 300, emoji: '🪐'),
    ShopItem(id: 'ps_neptune', name: 'Neptune', cost: 300, emoji: '🔵'),
    ShopItem(id: 'ps_venus', name: 'Venus', cost: 300, emoji: '🟡'),
    ShopItem(id: 'ps_mercury', name: 'Mercury', cost: 300, emoji: '🟤'),
    ShopItem(id: 'ps_uranus', name: 'Uranus', cost: 300, emoji: '🌐'),
    ShopItem(id: 'ps_pluto', name: 'Pluto', cost: 300, emoji: '🌑'),
    ShopItem(id: 'ps_kepler', name: 'Kepler', cost: 300, emoji: '🟢'),
    ShopItem(id: 'ps_titan', name: 'Titan', cost: 300, emoji: '🪨'),
    ShopItem(id: 'ps_luna', name: 'Luna', cost: 300, emoji: '🌕'),
    ShopItem(id: 'ps_europa', name: 'Europa', cost: 300, emoji: '🧊'),
    ShopItem(id: 'ps_io', name: 'Io', cost: 300, emoji: '🌋'),
    ShopItem(id: 'ps_callisto', name: 'Callisto', cost: 300, emoji: '☄️'),
    ShopItem(id: 'ps_ganymede', name: 'Ganymede', cost: 300, emoji: '🌘'),
    ShopItem(id: 'ps_phobos', name: 'Phobos', cost: 300, emoji: '🌒'),
    ShopItem(id: 'ps_deimos', name: 'Deimos', cost: 300, emoji: '🌗'),
    ShopItem(id: 'ps_eris', name: 'Eris', cost: 300, emoji: '🌖'),
    ShopItem(id: 'ps_ceres', name: 'Ceres', cost: 300, emoji: '🌓'),
    ShopItem(id: 'ps_makemake', name: 'Makemake', cost: 300, emoji: '🌔'),
    ShopItem(id: 'ps_haumea', name: 'Haumea', cost: 300, emoji: '🥚'),
    ShopItem(id: 'ps_sedna', name: 'Sedna', cost: 300, emoji: '🩸'),
    ShopItem(id: 'ps_vulcan', name: 'Vulcan', cost: 300, emoji: '🔥'),
  ];

  static final _themeItems = [
    ShopItem(id: 'verdant', name: 'Verdant', cost: 500, emoji: '🌿'),
    ShopItem(id: 'sakura', name: 'Sakura', cost: 500, emoji: '🌸'),
    ShopItem(id: 'glacier', name: 'Glacier', cost: 500, emoji: '🧊'),
    ShopItem(id: 'ember', name: 'Ember', cost: 500, emoji: '🔥'),
    ShopItem(id: 'twilight', name: 'Twilight', cost: 500, emoji: '🌆'),
    ShopItem(id: 'lavender', name: 'Lavender', cost: 500, emoji: '💜'),
    ShopItem(id: 'onyx', name: 'Onyx', cost: 500, emoji: '⬛'),
    ShopItem(id: 'pearl', name: 'Pearl', cost: 500, emoji: '🤍'),
  ];

  static final _avatarItems = [
    ShopItem(id: 'av_1', name: 'The Explorer', cost: 400, emoji: '👨‍🚀'),
    ShopItem(id: 'av_2', name: 'The Martian', cost: 400, emoji: '👽'),
    ShopItem(id: 'av_3', name: 'Void Walker', cost: 400, emoji: '👾'),
    ShopItem(id: 'av_4', name: 'Android', cost: 400, emoji: '🤖'),
    ShopItem(id: 'av_5', name: 'Star Child', cost: 400, emoji: '👼'),
    ShopItem(id: 'av_6', name: 'Scientist', cost: 400, emoji: '🧑‍🔬'),
    ShopItem(id: 'av_7', name: 'Captain', cost: 400, emoji: '🧑‍✈️'),
    ShopItem(id: 'av_8', name: 'Hacker', cost: 400, emoji: '🧑‍💻'),
    ShopItem(id: 'av_9', name: 'Oracle', cost: 400, emoji: '👁️'),
    ShopItem(id: 'av_10', name: 'Ninja', cost: 400, emoji: '🥷'),
    ShopItem(id: 'av_11', name: 'Monk', cost: 400, emoji: '🧘'),
    ShopItem(id: 'av_12', name: 'Hero', cost: 400, emoji: '🦸'),
    ShopItem(id: 'av_13', name: 'Villain', cost: 400, emoji: '🦹'),
    ShopItem(id: 'av_14', name: 'Ghost', cost: 400, emoji: '👻'),
  ];

  static final _soundItems = [
    ShopItem(id: 'sp_bamboo', name: 'Bamboo', cost: 800, emoji: '🎋'),
    ShopItem(id: 'sp_hearth', name: 'Hearth', cost: 800, emoji: '🏠'),
  ];

  static final _iconItems = [
    ShopItem(id: 'ic_1', name: 'Midnight', cost: 600, emoji: '🌌'),
    ShopItem(id: 'ic_2', name: 'Neon', cost: 600, emoji: '🕹️'),
    ShopItem(id: 'ic_3', name: 'Retro', cost: 600, emoji: '👾'),
    ShopItem(id: 'ic_4', name: 'Minimal', cost: 600, emoji: '🔲'),
    ShopItem(id: 'ic_5', name: 'Glass', cost: 600, emoji: '💠'),
    ShopItem(id: 'ic_6', name: 'Void', cost: 600, emoji: '⬛'),
    ShopItem(id: 'ic_7', name: 'Gold', cost: 600, emoji: '🪙'),
    ShopItem(id: 'ic_8', name: 'Holo', cost: 600, emoji: '💿'),
    ShopItem(id: 'ic_9', name: 'Classic', cost: 600, emoji: '📱'),
  ];

  static final _particleItems = [
    ShopItem(id: 'pe_1', name: 'Nova', cost: 700, emoji: '✨'),
    ShopItem(id: 'pe_2', name: 'Sparks', cost: 700, emoji: '🎇'),
    ShopItem(id: 'pe_3', name: 'Comet', cost: 700, emoji: '☄️'),
    ShopItem(id: 'pe_4', name: 'Stars', cost: 700, emoji: '🌟'),
    ShopItem(id: 'pe_5', name: 'Glitter', cost: 700, emoji: '💖'),
    ShopItem(id: 'pe_6', name: 'Snow', cost: 700, emoji: '❄️'),
  ];

  static final _ambientItems = [
    ShopItem(id: 'am_rain', name: 'Rain', cost: 500, emoji: '🌧️'),
    ShopItem(id: 'am_ocean', name: 'Ocean', cost: 500, emoji: '🌊'),
    ShopItem(id: 'am_forest', name: 'Forest', cost: 500, emoji: '🌲'),
    ShopItem(id: 'am_wind', name: 'Wind', cost: 500, emoji: '💨'),
    ShopItem(id: 'am_fireplace', name: 'Fireplace', cost: 500, emoji: '🔥'),
    ShopItem(id: 'am_cafe', name: 'Cafe', cost: 500, emoji: '☕'),
    ShopItem(id: 'am_brown_noise', name: 'Brown Noise', cost: 500, emoji: '📻'),
    ShopItem(id: 'am_singing_bowls', name: 'Singing Bowls', cost: 500, emoji: '🥣'),
    ShopItem(id: 'am_night_sounds', name: 'Night Sounds', cost: 500, emoji: '🦉'),
    ShopItem(id: 'am_distant_storm', name: 'Distant Storm', cost: 500, emoji: '⛈️'),
  ];

  static final _constellationItems = [
    ShopItem(id: 'ct_ink', name: 'Ink Orbit', cost: 1000, emoji: '⭕'),
    ShopItem(id: 'ct_neon', name: 'Neon Orbit', cost: 1000, emoji: '💫'),
    ShopItem(id: 'ct_hand', name: 'Dashed Orbit', cost: 1000, emoji: '🔄'),
  ];
}

class ShopItem {
  const ShopItem({
    required this.id,
    required this.name,
    required this.cost,
    required this.emoji,
  });

  final String id;
  final String name;
  final int cost;
  final String emoji;
}

class _ShopGrid extends StatelessWidget {
  const _ShopGrid({required this.items, required this.onPurchase});

  final List<ShopItem> items;
  final void Function(ShopItem) onPurchase;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(Spacing.md),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 140,
        childAspectRatio: 0.85,
        crossAxisSpacing: Spacing.sm,
        mainAxisSpacing: Spacing.sm,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () => onPurchase(item),
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(CornerRadii.md),
              border: Border.all(
                color: context.colors.outlineVariant.withOpacity(0.15),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.emoji, style: const TextStyle(fontSize: 32)),
                const SizedBox(height: Spacing.xs),
                Text(
                  item.name,
                  style: context.textTheme.labelMedium,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '${item.cost} ✨',
                  style: TextStyle(
                    fontSize: 11,
                    fontFamily: 'JetBrainsMono',
                    color: context.colors.primary,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
