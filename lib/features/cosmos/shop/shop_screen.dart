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

  static ShopItem _p(String id, String name, String emoji, Color tint) =>
      ShopItem(id: id, name: name, cost: 300, emoji: emoji, imagePath: 'assets/images/shop/planet_premium.png', tint: tint);
  
  static ShopItem _t(String id, String name, String emoji, Color tint) =>
      ShopItem(id: id, name: name, cost: 500, emoji: emoji, imagePath: 'assets/images/shop/theme_premium.png', tint: tint);

  static ShopItem _a(String id, String name, String emoji) =>
      ShopItem(id: id, name: name, cost: 400, emoji: emoji, imagePath: 'assets/images/shop/avatar_premium.png');

  static ShopItem _s(String id, String name, String emoji) =>
      ShopItem(id: id, name: name, cost: 800, emoji: emoji, imagePath: 'assets/images/shop/sound_premium.png');

  static ShopItem _i(String id, String name, String emoji) =>
      ShopItem(id: id, name: name, cost: 600, emoji: emoji, imagePath: 'assets/images/shop/icon_premium.png');

  static ShopItem _pt(String id, String name, String emoji) =>
      ShopItem(id: id, name: name, cost: 700, emoji: emoji, imagePath: 'assets/images/shop/particle_premium.png');

  static ShopItem _am(String id, String name, String emoji) =>
      ShopItem(id: id, name: name, cost: 500, emoji: emoji, imagePath: 'assets/images/shop/ambient_premium.png');

  static ShopItem _ct(String id, String name, String emoji) =>
      ShopItem(id: id, name: name, cost: 1000, emoji: emoji, imagePath: 'assets/images/shop/orbit_premium.png');

  // Planet skins
  static final _planetItems = [
    _p('ps_terra', 'Terra', '🌍', Colors.blue),
    _p('ps_mars', 'Mars', '🔴', Colors.red),
    _p('ps_jupiter', 'Jupiter', '🟠', Colors.orange),
    _p('ps_saturn', 'Saturn', '🪐', Colors.amber),
    _p('ps_neptune', 'Neptune', '🔵', Colors.blueAccent),
    _p('ps_venus', 'Venus', '🟡', Colors.yellow),
    _p('ps_mercury', 'Mercury', '🟤', Colors.brown),
    _p('ps_uranus', 'Uranus', '🌐', Colors.lightBlue),
    _p('ps_pluto', 'Pluto', '🌑', Colors.grey),
    _p('ps_kepler', 'Kepler', '🟢', Colors.green),
    _p('ps_titan', 'Titan', '🪨', Colors.orangeAccent),
    _p('ps_luna', 'Luna', '🌕', Colors.white),
    _p('ps_europa', 'Europa', '🧊', Colors.cyan),
    _p('ps_io', 'Io', '🌋', Colors.deepOrange),
    _p('ps_callisto', 'Callisto', '☄️', Colors.blueGrey),
    _p('ps_ganymede', 'Ganymede', '🌘', Colors.indigo),
    _p('ps_phobos', 'Phobos', '🌒', Colors.brown.shade800),
    _p('ps_deimos', 'Deimos', '🌗', Colors.grey.shade700),
    _p('ps_eris', 'Eris', '🌖', Colors.purple),
    _p('ps_ceres', 'Ceres', '🌓', Colors.teal),
    _p('ps_makemake', 'Makemake', '🌔', Colors.pink),
    _p('ps_haumea', 'Haumea', '🥚', Colors.lime),
    _p('ps_sedna', 'Sedna', '🩸', Colors.redAccent),
    _p('ps_vulcan', 'Vulcan', '🔥', Colors.deepOrangeAccent),
  ];

  static final _themeItems = [
    _t('verdant', 'Verdant', '🌿', Colors.green),
    _t('sakura', 'Sakura', '🌸', Colors.pink),
    _t('glacier', 'Glacier', '🧊', Colors.cyan),
    _t('ember', 'Ember', '🔥', Colors.orange),
    _t('twilight', 'Twilight', '🌆', Colors.deepPurple),
    _t('lavender', 'Lavender', '💜', Colors.purpleAccent),
    _t('onyx', 'Onyx', '⬛', Colors.black),
    _t('pearl', 'Pearl', '🤍', Colors.white),
  ];

  static final _avatarItems = [
    _a('av_1', 'The Explorer', '👨‍🚀'),
    _a('av_2', 'The Martian', '👽'),
    _a('av_3', 'Void Walker', '👾'),
    _a('av_4', 'Android', '🤖'),
    _a('av_5', 'Star Child', '👼'),
    _a('av_6', 'Scientist', '🧑‍🔬'),
    _a('av_7', 'Captain', '🧑‍✈️'),
    _a('av_8', 'Hacker', '🧑‍💻'),
    _a('av_9', 'Oracle', '👁️'),
    _a('av_10', 'Ninja', '🥷'),
    _a('av_11', 'Monk', '🧘'),
    _a('av_12', 'Hero', '🦸'),
    _a('av_13', 'Villain', '🦹'),
    _a('av_14', 'Ghost', '👻'),
  ];

  static final _soundItems = [
    _s('sp_bamboo', 'Bamboo', '🎋'),
    _s('sp_hearth', 'Hearth', '🏠'),
  ];

  static final _iconItems = [
    _i('ic_1', 'Midnight', '🌌'),
    _i('ic_2', 'Neon', '🕹️'),
    _i('ic_3', 'Retro', '👾'),
    _i('ic_4', 'Minimal', '🔲'),
    _i('ic_5', 'Glass', '💠'),
    _i('ic_6', 'Void', '⬛'),
    _i('ic_7', 'Gold', '🪙'),
    _i('ic_8', 'Holo', '💿'),
    _i('ic_9', 'Classic', '📱'),
  ];

  static final _particleItems = [
    _pt('pe_1', 'Nova', '✨'),
    _pt('pe_2', 'Sparks', '🎇'),
    _pt('pe_3', 'Comet', '☄️'),
    _pt('pe_4', 'Stars', '🌟'),
    _pt('pe_5', 'Glitter', '💖'),
    _pt('pe_6', 'Snow', '❄️'),
  ];

  static final _ambientItems = [
    _am('am_rain', 'Rain', '🌧️'),
    _am('am_ocean', 'Ocean', '🌊'),
    _am('am_forest', 'Forest', '🌲'),
    _am('am_wind', 'Wind', '💨'),
    _am('am_fireplace', 'Fireplace', '🔥'),
    _am('am_cafe', 'Cafe', '☕'),
    _am('am_brown_noise', 'Brown Noise', '📻'),
    _am('am_singing_bowls', 'Singing Bowls', '🥣'),
    _am('am_night_sounds', 'Night Sounds', '🦉'),
    _am('am_distant_storm', 'Distant Storm', '⛈️'),
  ];

  static final _constellationItems = [
    _ct('ct_ink', 'Ink Orbit', '⭕'),
    _ct('ct_neon', 'Neon Orbit', '💫'),
    _ct('ct_hand', 'Dashed Orbit', '🔄'),
  ];
}

class ShopItem {
  const ShopItem({
    required this.id,
    required this.name,
    required this.cost,
    required this.emoji,
    required this.imagePath,
    this.tint,
  });

  final String id;
  final String name;
  final int cost;
  final String emoji;
  final String imagePath;
  final Color? tint;
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
            clipBehavior: Clip.hardEdge,
            child: Stack(
              children: [
                Positioned.fill(
                  child: item.tint != null
                      ? ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            item.tint!.withOpacity(0.4),
                            BlendMode.color,
                          ),
                          child: Image.asset(item.imagePath, fit: BoxFit.cover),
                        )
                      : Image.asset(item.imagePath, fit: BoxFit.cover),
                ),
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          context.colors.surface.withOpacity(0.9),
                        ],
                        stops: const [0.4, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: Spacing.sm,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(item.emoji, style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 2),
                      Text(
                        item.name,
                        style: context.textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 2),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: context.colors.primaryContainer.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${item.cost} ✨',
                          style: TextStyle(
                            fontSize: 10,
                            fontFamily: 'JetBrainsMono',
                            color: context.colors.onPrimaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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

