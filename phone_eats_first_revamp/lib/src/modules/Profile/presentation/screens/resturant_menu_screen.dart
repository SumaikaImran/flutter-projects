import 'package:flutter/material.dart';
import 'package:phone_eats_first/src/core/services/routing_service/named_routes.dart';
import 'package:phone_eats_first/src/core/theme/app_colors.dart';
import 'package:phone_eats_first/src/core/theme/theme_styles.dart';
import 'package:phone_eats_first/src/core/utils/app_assets.dart';
import 'package:phone_eats_first/src/core/utils/app_strings.dart';
import 'package:phone_eats_first/src/modules/Profile/presentation/widgets/filter_chips_widget.dart';

class ResturantMenuScreen extends StatefulWidget {
  const ResturantMenuScreen({super.key});

  @override
  State<ResturantMenuScreen> createState() => _ResturantMenuScreenState();
}

class _ResturantMenuScreenState extends State<ResturantMenuScreen> {
  final List<String> titles = [
    'Skirt Stake Tacos',
    'Barrio Nachos',
    'Esquites Style Corn',
    'Chicken Al Pastor',
  ];
  final List<String> subtitles = [
    'Ancho marinated diced skirt steak, cha...',
    'jack cheese blend, black beans, pickled...',
    'Piquin, cotija, and lime',
    'achiote marinated chicken, pickled red...',
  ];

  final ScrollController _scrollController = ScrollController();

  // Keys for each section
  final featuredKey = GlobalKey();
  final appetizersKey = GlobalKey();
  final mainDishesKey = GlobalKey();
  final saladsKey = GlobalKey();
  bool option = false;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.secondaryTextWhite,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                AppRouterGo.back();
              },
              child: Image.asset(AppAssets.BackButton, scale: 2),
            ),
            Text('Barrio', style: AppTextTheme.textBlacki),
          ],
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Menu', style: AppTextTheme.textBlack34),
                      Image.asset(AppAssets.b5, scale: 2),
                    ],
                  ),
                  SearchSection(),
                  FilterChipsWidget(
                    options: [
                      AppStrings.featured,
                      AppStrings.appitizers,
                      AppStrings.salads,
                      AppStrings.mainDishes,
                    ],
                    navigateOnSelect: true,
                    // fixedSelectedOption: null,
                    fixedSelectedOption: option ? null : AppStrings.featured,
                    onSelected: (opt) {
                      setState(() {
                        option = true;
                      });
                      if (opt == AppStrings.featured) {
                        _scrollToSection(featuredKey);
                      } else if (opt == AppStrings.appitizers) {
                        _scrollToSection(appetizersKey);
                      } else if (opt == AppStrings.mainDishes) {
                        _scrollToSection(mainDishesKey);
                      } else if (opt == AppStrings.salads) {
                        _scrollToSection(saladsKey);
                      }
                    },
                  ),
                  Divider(color: AppColors.lighterGrey),
                ],
              ),
            ),

            // Featured Section
            Container(
              key: featuredKey, // 👈 attach key
              padding: EdgeInsets.only(top: 9, bottom: 9, left: 18),
              color: AppColors.lighterGrey,
              child: Row(
                children: [
                  Image.asset(AppAssets.ns3, scale: 2),
                  Text(' Featured'),
                ],
              ),
            ),
            _buildList(),

            // Appetizers Section
            Container(
              key: appetizersKey, // 👈 attach key
              padding: EdgeInsets.only(top: 9, bottom: 9, left: 18),
              color: AppColors.lighterGrey,
              child: Row(
                children: [
                  Image.asset(AppAssets.appitizers, scale: 2),
                  Text(' Appetizers'),
                ],
              ),
            ),
            _buildList(),

            // Main Dishes Section
            Container(
              key: mainDishesKey, // 👈 attach key
              padding: EdgeInsets.only(top: 9, bottom: 9, left: 18),
              color: AppColors.lighterGrey,
              child: Row(
                children: [
                  Image.asset(AppAssets.maindishes, scale: 2),
                  Text(' Main Dishes'),
                ],
              ),
            ),
            _buildList(),

            // Salads Section
            Container(
              key: saladsKey, // 👈 attach key
              padding: EdgeInsets.only(top: 9, bottom: 9, left: 18),
              color: AppColors.lighterGrey,
              child: Row(
                children: [
                  Image.asset(AppAssets.appitizers, scale: 2),
                  Text(' Salads'),
                ],
              ),
            ),
            _buildList(),
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, Index) {
          return ListTile(
            contentPadding: EdgeInsets.all(0),
            leading: Container(
              width: 58,
              height: 63,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(AppAssets.img22, fit: BoxFit.cover),
            ),
            title: Text(titles[Index], style: AppTextTheme.headingBlack16800),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subtitles[Index], style: AppTextTheme.subtitle),
                Row(
                  children: [
                    Text("\$17 ", style: AppTextTheme.headingRed12),
                    Text(' | ', style: AppTextTheme.headingGrey12),
                    Image.asset(AppAssets.ystar2, scale: 2),
                    Text(' 4.6 ', style: AppTextTheme.headingGrey12),
                    Text('(351)', style: AppTextTheme.bodylightGrey11500),
                  ],
                ),
              ],
            ),
          );
        },
        separatorBuilder:
            (context, index) => Divider(color: AppColors.lighterGrey),
        itemCount: titles.length,
      ),
    );
  }
}

Widget SearchSection() {
  final TextEditingController searchController = TextEditingController();
  return Container(
    padding: const EdgeInsets.only(top: 7, bottom: 6),
    child: TextField(
      controller: searchController,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.all(9),
        fillColor: AppColors.lighterGrey,
        hint: Text(AppStrings.search, style: AppTextTheme.headingGrey16),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Image.asset(AppAssets.searchicon, scale: 2),
        prefixIcon: Image.asset(AppAssets.search1, scale: 1.8),
      ),
    ),
  );
}
