// Displays one recipe. Includes the recipe sheet with a background image.
import 'package:book/homepage.dart';
import 'package:flutter/material.dart';

const String _kSmallLogoImage = 'logos/pesto/logo_small.png';
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';
const double _kAppBarHeight = 300.0;
const double _kFabHalfSize = 28.0; // TODO(mpcomplete): needs to adapt to screen size
const double _kRecipePageMaxWidth = 500.0;
final Set<Recipe> _favoriteRecipes = <Recipe>{};
final ThemeData _kTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  accentColor: Colors.redAccent,
);

class RecipePage extends StatefulWidget {
  const RecipePage({ Key key, this.recipe }) : super(key: key);

  final Recipe recipe;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextStyle menuItemStyle = const PestoStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);

  double _getAppBarHeight(BuildContext context) => MediaQuery.of(context).size.height * 0.3;

  @override
  Widget build(BuildContext context) {
    // The full page content with the recipe's image behind it. This
    // adjusts based on the size of the screen. If the recipe sheet touches
    // the edge of the screen, use a slightly different layout.
    final double appBarHeight = _getAppBarHeight(context);
    final Size screenSize = MediaQuery.of(context).size;
    final bool fullWidth = screenSize.width < _kRecipePageMaxWidth;
    final bool isFavorite = _favoriteRecipes.contains(widget.recipe);
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            height: appBarHeight + _kFabHalfSize,
            child: Hero(
              tag: 'packages/$_kGalleryAssetsPackage/${widget.recipe.imagePath}',
              child: Image.asset(
                widget.recipe.imagePath,
                package: widget.recipe.imagePackage,
                fit: fullWidth ? BoxFit.fitWidth : BoxFit.cover,
              ),
            ),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: appBarHeight - _kFabHalfSize,
                backgroundColor: Colors.transparent,
                actions: <Widget>[
                  PopupMenuButton<String>(
                    onSelected: (String item) { },
                    itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      _buildMenuItem(Icons.share, 'Tweet recipe'),
                      _buildMenuItem(Icons.email, 'Email recipe'),
                      _buildMenuItem(Icons.message, 'Message recipe'),
                      _buildMenuItem(Icons.people, 'Share on FaceRecipe'),
                    ],
                  ),
                ],
                flexibleSpace: const FlexibleSpaceBar(
                  background: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, -1.0),
                        end: Alignment(0.0, -0.2),
                        colors: <Color>[Color(0x60000000), Color(0x00000000)],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: _kFabHalfSize),
                      width: fullWidth ? null : _kRecipePageMaxWidth,
                      child: RecipeSheet(recipe: widget.recipe),
                    ),
                    Positioned(
                      right: 16.0,
                      child: FloatingActionButton(
                        child: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                        onPressed: _toggleFavorite,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem<String> _buildMenuItem(IconData icon, String label) {
    return PopupMenuItem<String>(
      child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Icon(icon, color: Colors.black54),
          ),
          Text(label, style: menuItemStyle),
        ],
      ),
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_favoriteRecipes.contains(widget.recipe))
        _favoriteRecipes.remove(widget.recipe);
      else
        _favoriteRecipes.add(widget.recipe);
    });
  }
}

/// Displays the recipe's name and instructions.
class RecipeSheet extends StatelessWidget {
  RecipeSheet({ Key key, this.recipe }) : super(key: key);

  final TextStyle titleStyle = const PestoStyle(fontSize: 34.0);
  final TextStyle descriptionStyle = const PestoStyle(fontSize: 15.0, color: Colors.black54, height: 24.0/15.0);
  final TextStyle itemStyle = const PestoStyle(fontSize: 15.0, height: 24.0/15.0);
  final TextStyle itemAmountStyle = PestoStyle(fontSize: 15.0, color: _kTheme.primaryColor, height: 24.0/15.0);
  final TextStyle headingStyle = const PestoStyle(fontSize: 16.0, fontWeight: FontWeight.bold, height: 24.0/15.0);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40.0),
          child: Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(64.0),
            },
            children: <TableRow>[
              TableRow(
                children: <Widget>[
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Image.asset(
                      recipe.ingredientsImagePath,
                      package: recipe.ingredientsImagePackage,
                      width: 32.0,
                      height: 32.0,
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Text(recipe.name, style: titleStyle),
                  ),
                ]
              ),
              TableRow(
                children: <Widget>[
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                    child: Text(recipe.description, style: descriptionStyle),
                  ),
                ]
              ),
              TableRow(
                children: <Widget>[
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                    child: Text('Ingredients', style: headingStyle),
                  ),
                ]
              ),
              ...recipe.ingredients.map<TableRow>((RecipeIngredient ingredient) {
                return _buildItemRow(ingredient.amount, ingredient.description);
              }),
              TableRow(
                children: <Widget>[
                  const SizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
                    child: Text('Steps', style: headingStyle),
                  ),
                ]
              ),
              ...recipe.steps.map<TableRow>((RecipeStep step) {
                return _buildItemRow(step.duration ?? '', step.description);
              }),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildItemRow(String left, String right) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(left, style: itemAmountStyle),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Text(right, style: itemStyle),
        ),
      ],
    );
  }
}

class Recipe {
  const Recipe({
    this.name,
    this.author,
    this.description,
    this.imagePath,
    this.imagePackage,
    this.ingredientsImagePath,
    this.ingredientsImagePackage,
    this.ingredients,
    this.steps,
  });

  final String name;
  final String author;
  final String description;
  final String imagePath;
  final String imagePackage;
  final String ingredientsImagePath;
  final String ingredientsImagePackage;
  final List<RecipeIngredient> ingredients;
  final List<RecipeStep> steps;
}

class RecipeIngredient {
  const RecipeIngredient({this.amount, this.description});

  final String amount;
  final String description;
}

class RecipeStep {
  const RecipeStep({this.duration, this.description});

  final String duration;
  final String description;
}