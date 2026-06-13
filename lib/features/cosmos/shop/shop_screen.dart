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
            Tab(text: 'Stars'),
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
    'Terra', 'Mars', 'Jupiter', 'Saturn', 'Neptune', 'Ice',
    'Lava', 'Crystal', 'Forest', 'Ocean', 'Desert', 'Moss',
    'Cloud', 'Storm', 'Aurora', 'Ringed', 'Cratered', 'Smooth',
    'Geode', 'Marble', 'Obsidian', 'Pearl', 'Gold', 'Silver',
  ].map((n) => ShopItem(id: 'ps_${n.toLowerCase()}', name: n, cost: 300, emoji: '🪐')).toList();

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

  static final _avatarItems = List.generate(
    14, (i) => ShopItem(id: 'av_${i + 1}', name: 'Avatar ${i + 1}', cost: 400, emoji: '👤'),
  );

  static final _soundItems = [
    ShopItem(id: 'sp_bamboo', name: 'Bamboo', cost: 800, emoji: '🎋'),
    ShopItem(id: 'sp_hearth', name: 'Hearth', cost: 800, emoji: '🏠'),
  ];

  static final _iconItems = List.generate(
    9, (i) => ShopItem(id: 'ic_${i + 1}', name: 'Icon ${i + 1}', cost: 600, emoji: '📱'),
  );

  static final _particleItems = List.generate(
    6, (i) => ShopItem(id: 'pe_${i + 1}', name: 'Effect ${i + 1}', cost: 700, emoji: '✨'),
  );

  static final _ambientItems = [
    'Rain', 'Ocean', 'Forest', 'Wind', 'Fireplace',
    'Cafe', 'Brown Noise', 'Singing Bowls', 'Night Sounds', 'Distant Storm',
  ].map((n) => ShopItem(id: 'am_${n.toLowerCase().replaceAll(' ', '_')}', name: n, cost: 500, emoji: '🎵')).toList();

  static final _constellationItems = [
    ShopItem(id: 'ct_ink', name: 'Ink Wash', cost: 1000, emoji: '🖋️'),
    ShopItem(id: 'ct_neon', name: 'Neon Glow', cost: 1000, emoji: '💡'),
    ShopItem(id: 'ct_hand', name: 'Hand-Drawn', cost: 1000, emoji: '✏️'),
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isTablet ? 4 : 3,
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
