import 'package:book/books.dart';
import 'package:book/description.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PestoDemo extends StatelessWidget {
  const PestoDemo({ Key key }) : super(key: key);

  static const String routeName = '/pesto';

  @override
  Widget build(BuildContext context) => PestoHome();
}

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

class PestoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const RecipeGridPage(recipes: kPestoRecipes);
  }
}

/*class PestoFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecipeGridPage(recipes: _favoriteRecipes.toList());
  }
}*/

class PestoStyle extends TextStyle {
  const PestoStyle({
    double fontSize = 12.0,
    FontWeight fontWeight,
    Color color = Colors.black87,
    double letterSpacing,
    double height,
  }) : super(
    inherit: false,
    color: color,
    fontFamily: 'Raleway',
    fontSize: fontSize,
    fontWeight: fontWeight,
    textBaseline: TextBaseline.alphabetic,
    letterSpacing: letterSpacing,
    height: height,
  );
}


class RecipeGridPage extends StatefulWidget {
  const RecipeGridPage({ Key key, this.recipes }) : super(key: key);

  final List<Recipe> recipes;

  @override
  _RecipeGridPageState createState() => _RecipeGridPageState();
}

class _RecipeGridPageState extends State<RecipeGridPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Theme(
      data: _kTheme.copyWith(platform: Theme.of(context).platform),
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.edit),
          onPressed: () {
            scaffoldKey.currentState.showSnackBar(const SnackBar(
              content: Text('Not supported.'),
            ));
          },
        ),
        body: CustomScrollView(
          semanticChildCount: widget.recipes.length,
          slivers: <Widget>[
            _buildAppBar(context, statusBarHeight),
            _buildBody(context, statusBarHeight),
          ],
        ),
      ),
    );
  }
    Widget _buildAppBar(BuildContext context, double statusBarHeight) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: _kAppBarHeight,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Search',
          onPressed: () async {
            scaffoldKey.currentState.showSnackBar(const SnackBar(
              content: Text('Not supported.'),
            ));
          final int selected =await showSearch(
            context: context,
            delegate: _SearchDemoSearchDelegate(),
          );
          },
        ),
      ],
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final Size size = constraints.biggest;
          final double appBarHeight = size.height - statusBarHeight;
          final double t = (appBarHeight - kToolbarHeight) / (_kAppBarHeight - kToolbarHeight);
          final double extraPadding = Tween<double>(begin: 10.0, end: 24.0).transform(t);
          final double logoHeight = appBarHeight - 1.5 * extraPadding;
          return Padding(
            padding: EdgeInsets.only(
              top: statusBarHeight + 0.5 * extraPadding,
              bottom: extraPadding,
            ),
            child: Center(
              child: PestoLogo(height: logoHeight, t: t.clamp(0.0, 1.0)),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(BuildContext context, double statusBarHeight) {
    final EdgeInsets mediaPadding = MediaQuery.of(context).padding;
    final EdgeInsets padding = EdgeInsets.only(
      top: 8.0,
      left: 8.0 + mediaPadding.left,
      right: 8.0 + mediaPadding.right,
      bottom: 8.0,
    );
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: _kRecipePageMaxWidth,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final Recipe recipe = widget.recipes[index];
            return RecipeCard(
              recipe: recipe,
              onTap: () { showRecipePage(context, recipe); },
            );
          },
          childCount: widget.recipes.length,
        ),
      ),
    );
  }

  void showFavoritesPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute<void>(
      settings: const RouteSettings(name: '/pesto/favorites'),
      builder: (BuildContext context) => PestoFavorites(),
          ));
        }
      
      
        void showRecipePage(BuildContext context, Recipe recipe) {
          Navigator.push(context, MaterialPageRoute<void>(
            settings: const RouteSettings(name: '/pesto/recipe'),
            builder: (BuildContext context) {
              return Theme(
                data: _kTheme.copyWith(platform: Theme.of(context).platform),
                child: RecipePage(recipe: recipe),
              );
            },
          ));
        }
      }
      
  class PestoFavorites extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RecipeGridPage(recipes: _favoriteRecipes.toList());
  }
}

class PestoLogo extends StatefulWidget {
  const PestoLogo({this.height, this.t});

  final double height;
  final double t;

  @override
  _PestoLogoState createState() => _PestoLogoState();
}

class _PestoLogoState extends State<PestoLogo> {
  // Native sizes for logo and its image/text components.
  static const double kLogoHeight = 162.0;
  static const double kLogoWidth = 220.0;
  static const double kImageHeight = 108.0;
  static const double kTextHeight = 48.0;
  final TextStyle titleStyle = const PestoStyle(fontSize: kTextHeight, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 3.0);
  final RectTween _textRectTween = RectTween(
    begin: const Rect.fromLTWH(0.0, kLogoHeight, kLogoWidth, kTextHeight),
    end: const Rect.fromLTWH(0.0, kImageHeight, kLogoWidth, kTextHeight),
  );
  final Curve _textOpacity = const Interval(0.4, 1.0, curve: Curves.easeInOut);
  final RectTween _imageRectTween = RectTween(
    begin: const Rect.fromLTWH(0.0, 0.0, kLogoWidth, kLogoHeight),
    end: const Rect.fromLTWH(0.0, 0.0, kLogoWidth, kImageHeight),
  );

  @override
  Widget build(BuildContext context) {
    return Semantics(
      namesRoute: true,
      child: Transform(
        transform: Matrix4.identity()..scale(widget.height / kLogoHeight),
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: kLogoWidth,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned.fromRect(
                rect: _imageRectTween.lerp(widget.t),
                child: Image.asset(
                  _kSmallLogoImage,
                  package: _kGalleryAssetsPackage,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned.fromRect(
                rect: _textRectTween.lerp(widget.t),
                child: Opacity(
                  opacity: _textOpacity.transform(widget.t),
                  child: Text('Book Reselling', style: titleStyle, textAlign: TextAlign.start),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// A card with the recipe's image, author, and title.
class RecipeCard extends StatelessWidget {
  const RecipeCard({ Key key, this.recipe, this.onTap }) : super(key: key);

  final Recipe recipe;
  final VoidCallback onTap;

  TextStyle get titleStyle => const PestoStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
  TextStyle get authorStyle => const PestoStyle(fontWeight: FontWeight.w500, color: Colors.black54);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: 'packages/$_kGalleryAssetsPackage/${recipe.imagePath}',
              child: AspectRatio(
                aspectRatio: 4.0 / 3.0,
                child: Image.asset(
                  recipe.imagePath,
                  package: recipe.imagePackage,
                  fit: BoxFit.cover,
                  semanticLabel: recipe.name,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      recipe.ingredientsImagePath,
                      package: recipe.ingredientsImagePackage,
                      width: 48.0,
                      height: 48.0,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(recipe.name, style: titleStyle, softWrap: false, overflow: TextOverflow.ellipsis),
                        Text(recipe.author, style: authorStyle),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class _SearchDemoSearchDelegate extends SearchDelegate<int> {
  final List<int> _data = List<int>.generate(100001, (int i) => i).reversed.toList();
  final List<int> _history = <int>[42607, 85604, 66374, 44, 174];

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final Iterable<int> suggestions = query.isEmpty
        ? _history
        : _data.where((int i) => '$i'.startsWith(query));

    return _SuggestionList(
      query: query,
      suggestions: suggestions.map<String>((int i) => '$i').toList(),
      onSelected: (String suggestion) {
        query = suggestion;
        showResults(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final int searched = int.tryParse(query);
    if (searched == null || !_data.contains(searched)) {
      return Center(
        child: Text(
          '"$query"\n is not a valid integer between 0 and 100,000.\nTry again.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return ListView(
      children: <Widget>[
        _ResultCard(
          title: 'This integer',
          integer: searched,
          searchDelegate: this,
        ),
        _ResultCard(
          title: 'Next integer',
          integer: searched + 1,
          searchDelegate: this,
        ),
        _ResultCard(
          title: 'Previous integer',
          integer: searched - 1,
          searchDelegate: this,
        ),
      ],
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      if (query.isEmpty)
        IconButton(
          tooltip: 'Voice Search',
          icon: const Icon(Icons.mic),
          onPressed: () {
            query = 'TODO: implement voice input';
          },
        )
      else
        IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({this.integer, this.title, this.searchDelegate});

  final int integer;
  final String title;
  final SearchDelegate<int> searchDelegate;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        searchDelegate.close(context, integer);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(title),
              Text(
                '$integer',
                style: theme.textTheme.headline.copyWith(fontSize: 72.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({this.suggestions, this.query, this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
          title: RichText(
            text: TextSpan(
              text: suggestion.substring(0, query.length),
              style: theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
              children: <TextSpan>[
                TextSpan(
                  text: suggestion.substring(query.length),
                  style: theme.textTheme.subhead,
                ),
              ],
            ),
          ),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}