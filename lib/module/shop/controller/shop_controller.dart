import 'package:flutter/material.dart';
import 'package:fively/state_util.dart';
import '../view/shop_view.dart';

class ShopController extends State<ShopView>
    with TickerProviderStateMixin
    implements MvcController {
  static late ShopController instance;
  late ShopView view;

  @override
  void initState() {
    instance = this;
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  late final TabController tabController;

  final List<String> categories = ['New', 'Urban', 'Sport', 'Sneaker'];

  final List<String> women = [
    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5295a50937f1457e9cc7af87008607f1_9366/Ultraboost_Light_Running_Shoes_Black_GY9353_01_standard.jpg',
    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/20900efbda164458a954af3b00f7c320_9366/Samba_Golf_Shoes_Grey_ID9297_01_standard.jpg',
    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/e2a6b8ff84fe4dee8e0faf4a00b2e276_9366/Y-3_Gazelle_White_FZ6404_01_standard.jpg',
    'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/698e41ae0196408eb16aa7fb008046ad_9366/Gazelle_Shoes_Blue_BB5478_01_standard.jpg'
  ];
  final List<String> men = [
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1853308a-2d38-43c2-b978-05a18e6ec40d/dunk-high-retro-shoes-c4lpG4.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/cbc00fd0-6145-470c-97f5-24f96b161913/dunk-mid-shoes-6m6jH7.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f64a8cb2-376d-4e9f-b075-6d15577420f7/air-max-90-shoes-kRsBnD.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/9259e44d-8e6a-4253-aefa-7db9720ea2b4/air-jordan-1-low-flyease-easy-on-off-shoes-SsT4HK.png'
  ];
  final List<String> kids = [
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/36fe66a5-7e0c-40bc-87de-35436b78fe55/huarache-run-older-shoes-Wmqk9N.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/85f54b8b-0168-4e16-85eb-4dbe9a85d647/air-max-90-ltr-older-shoes-M0TsXt.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/3e8bcdc2-b599-4658-a984-b31c3e33033e/team-hustle-d-11-older-basketball-shoes-q4t8cZ.png',
    'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/40c7da80-3616-4943-8a2d-fe9d73a07450/jordan-1-mid-and-shoe-xBHJ1M.png'
  ];
}
