
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:wow_flutter/views/app.view.dart';
import 'package:wow_flutter/views/home/home.view.dart';
import 'package:wow_flutter/views/demo/demo.view.dart';
import 'package:wow_flutter/views/util/util.view.dart';
import 'package:wow_flutter/views/about/about.view.dart';
import 'package:wow_flutter/views/welcome/welcome.view.dart';
import 'package:wow_flutter/views/demo/nestedScrollView/nestedScrollView.demo.view.dart';
import 'package:wow_flutter/views/demo/nestedScrollView/nestedScrollViewParams.demo.view.dart';
import 'package:wow_flutter/views/demo/sliverAppBar/sliverAppBar.demo.view.dart';
import 'package:wow_flutter/views/demo/sliverAppBar/sliverAppBarParams.demo.view.dart';
import 'package:wow_flutter/views/demo/expansionTile/expansionTile.demo.view.dart';
import 'package:wow_flutter/views/demo/expansionTile/expansionTileParams.demo.view.dart';

class Router {

  static final Router _router = Router._internal();

  factory Router () {
    return _router;
  }

  Router._internal();

  static Map<String, Map<String, dynamic>> config = {
    'welcome': {
      'route': (_) => new WelcomeView(),
      'handle': (params) {
        return new WelcomeView();
      }
    },
    '/': {
      'route': (_) => new AppView(),
      'handle': (params) {
        return new AppView();
      }
    },
    'home': {
      'route': (_) => new HomeView(),
      'handle': (params) {
        return new HomeView();
      }
    },
    'demo': {
      'route': (_) => new DemoView(),
      'handle': (params) {
        return new DemoView();
      }
    },
    'util': {
      'route': (_) => new UtilView(),
      'handle': (params) {
        return new UtilView();
      }
    },
    'about': {
      'route': (_) => new AboutView(),
      'handle': (params) {
        return new AboutView();
      }
    },
    'nestedScrollView': {
      'route': (_) => new NestedScrollViewDemo(),
      'handle': (params) {
        return new NestedScrollViewDemo(titleText: params['titleText']);
      }
    },
    'nestedScrollViewParams': {
      'route': (_) => new NestedScrollViewParams(),
      'handle': (params) {
        return new NestedScrollViewParams();
      }
    },
    'sliverAppBar': {
      'route': (_) => new SliverAppBarDemo(),
      'handle': (params) {
        return new SliverAppBarDemo(titleText: params['titleText']);
      }
    },
    'sliverAppBarParams': {
      'route': (_) => new SliverAppBarParams(),
      'handle': (params) {
        return new SliverAppBarParams();
      }
    },
    'expansionTile': {
      'route': (_) => new ExpansionTileDemo(),
      'handle': (params) {
        return new ExpansionTileDemo(titleText: params['titleText']);
      }
    },
    'expansionTileParams': {
      'route': (_) => new ExpansionTileParams(),
      'handle': (params) {
        return new ExpansionTileParams();
      }
    },
  };

  static Map<String, WidgetBuilder> _routes;

  Map<String, WidgetBuilder> get routes {
    if (_routes != null) return _routes;
    _routes = {};
    config.forEach((key, value) {
      _routes[key] = value['route'];
    });
    return _routes;
  }

  push (BuildContext context, routeName, {params}) {
    return navigatorRouter(context, config[routeName]['handle'](params));
  }

  replace (BuildContext context, String routeName) {
    return Navigator.pushReplacementNamed(context, routeName);
  }

  pop (BuildContext context, {params}) {
    return Navigator.of(context).pop(params);
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}