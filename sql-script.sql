-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.31-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 正在导出表  miaosha.car 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` (`id`, `uid`, `item_id`, `status`, `count`) VALUES
	(1, 1, 1, 0, 2),
	(2, 1, 2, 0, 1),
	(8, 23, 23, 0, 1),
	(9, 23, 6, 0, 1),
	(10, 23, 10, 0, 2),
	(11, 23, 8, 0, 2),
	(12, 23, 9, 0, 5),
	(13, 23, 11, 0, 12),
	(14, 23, 12, 0, 1),
	(15, 23, 16, 0, 1),
	(19, 46, 9, 0, 1),
	(20, 46, 8, 0, 1),
	(30, 62, 21, 0, 1),
	(31, 46, 15, 0, 5),
	(32, 40, 26, 0, 2),
	(33, 40, 13, 0, 1);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;

-- 正在导出表  miaosha.decrease_log 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `decrease_log` DISABLE KEYS */;
INSERT INTO `decrease_log` (`id`, `user_id`, `item_id`, `discount`) VALUES
	(1, 1, 9, 0),
	(2, 23, 9, 0),
	(3, 23, 11, 0),
	(5, 41, 21, 0),
	(6, 41, 24, 0),
	(8, 46, 14, 73),
	(9, 46, 17, 740),
	(14, 40, 29, 0),
	(16, 62, 18, 539.73),
	(17, 62, 21, 23.88),
	(20, 40, 26, 0),
	(21, 40, 13, 0);
/*!40000 ALTER TABLE `decrease_log` ENABLE KEYS */;

-- 正在导出表  miaosha.friend_rel 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `friend_rel` DISABLE KEYS */;
INSERT INTO `friend_rel` (`id`, `user_id`, `friend_id`, `status`, `item_id`) VALUES
	(1, 1, 34, NULL, NULL),
	(2, 1, 35, NULL, NULL),
	(3, 1, 36, NULL, NULL),
	(4, 40, 41, NULL, NULL),
	(5, 40, 44, NULL, NULL),
	(6, 40, 45, 28.999999999999996, NULL),
	(7, 40, 46, 459.77000000000004, NULL),
	(8, 46, 47, 27, 14),
	(9, 46, 48, 300, 17),
	(10, 46, 52, 440, 17),
	(11, 46, 58, 46, 14),
	(12, 40, 61, 539.82, 23),
	(13, 62, 63, 21.5, 31),
	(14, 62, 64, 23.88, 21),
	(15, 62, 65, 539.73, 18),
	(16, 62, 66, 0.2, 13);
/*!40000 ALTER TABLE `friend_rel` ENABLE KEYS */;

-- 正在导出表  miaosha.item 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` (`id`, `title`, `price`, `description`, `sales`, `img_url`) VALUES
	(8, 'ipad', 1000, '拼多多平板电脑', 0, 'https://img2.baidu.com/it/u=2396352424,51031180&fm=26&fmt=auto&gp=0.jpg'),
	(9, '一加 OnePlus 9R', 2999, '5G旗舰120Hz 柔性屏8GB+128GB 蓝屿 骁龙870 65W快充', 6, 'https://img14.360buyimg.com/n0/jfs/t1/162460/3/18389/64294/6076cd05Ece25fe7c/3d1eb3a9e829d5e0.jpg'),
	(10, '一加 OnePlus 9R', 2999, '5G旗舰120Hz 柔性屏8GB+128GB 蓝屿 骁龙870 65W快充', 0, 'https://img14.360buyimg.com/n0/jfs/t1/162460/3/18389/64294/6076cd05Ece25fe7c/3d1eb3a9e829d5e0.jpg'),
	(11, '【新款特价】真无线蓝牙耳机安卓华为vivo小米OPPO苹果通用入耳式', 1, 'OPPO苹果通用入耳式', 8, 'https://img.pddpic.com/mms-material-img/2021-03-15/beca1a4d-1724-4e8f-9582-0c2d6a49f4d6.jpeg.a.jpeg'),
	(12, '【100包巨量装】原木抽纸整箱批发家用纸巾餐巾纸面巾纸抽卫生纸', 1, '【100包巨量装】', 2, 'https://img.pddpic.com/goods/images/2021-04-28/51a90d43dc0c5ae030b6e262f51c182b.jpeg'),
	(13, '南极人电动牙刷男女成人款家用可充电式自动声波软毛美白防水情侣', 1, '南极人电动牙刷男女成人款家用可充电式自动声波软毛美白防水情侣', 6, 'https://img.pddpic.com/mms-material-img/2020-11-04/7228534a-8402-4302-baf4-36208559ad5f.jpeg.a.jpeg'),
	(14, '【买一箱送一箱】大桶装正宗网红嗨吃家酸辣粉红薯粉整箱泡面批发', 100, '【买一箱送一箱】大桶装正宗网红嗨吃家酸辣粉红薯粉整箱泡面批发', 1, 'https://img.pddpic.com/mms-material-img/2020-08-21/15eb296a-d5b4-484c-a726-245f47c14310.jpeg.a.jpeg'),
	(15, '苹果iPhoneX XR 8Plus', 1000, '苹果iPhoneX XR 8Plus全网通国行苹果xr双卡二手苹果手机九五成新', 0, 'https://img.pddpic.com/mms-material-img/2021-04-14/71b3329b-5a08-4b5e-a6e9-d6928c128f5c.jpeg.a.jpeg'),
	(16, 'P40手机水滴屏八核8+128G智能手机全网通人脸指纹解锁游戏学', 1000, 'P40手机水滴屏八核8+128G智能手机全网通人脸指纹解锁游戏学生', 2, 'https://img.pddpic.com/mms-material-img/2021-02-05/93f3d446-fb58-45b0-9242-48e8d6ed20fe.jpeg.a.jpeg'),
	(17, '【国行正品】iPhone 12 Apple', 2000, '苹果手机智能5G全网通', 0, 'https://img.pddpic.com/mms-material-img/2021-02-07/593105c1-afa9-41c9-9449-b46a1f57e140.jpeg.a.jpeg'),
	(18, '小米Redmi 红米K40年度旗舰产品', 1999, 'E4旗舰直屏 智能5G手机', 0, 'https://img.pddpic.com/mms-material-img/2021-04-27/b6e17cd7-fade-4eb8-9959-cd45045d33db.jpeg.a.jpeg'),
	(19, '布艺沙发小户型客厅', 499, '整装简约现代经济型出租房组合家具套装可拆洗', 0, 'https://img.pddpic.com/goods/images/2020-05-22/bea41be6-4bb7-46a1-b757-9e14d2232bb5.jpg'),
	(20, '新款智能平板电脑超薄高清', 199, '便宜学生安卓学习办公wifi上网', 0, 'https://img.pddpic.com/mms-material-img/2021-04-14/ad643822-cded-45e4-82d0-a7dc49071767.jpeg.a.jpeg'),
	(21, '24寸曲面无边框电竞显示器', 199, '19寸22寸27寸液晶电脑屏幕高清办公监控', 0, 'https://img.pddpic.com/mms-material-img/2021-04-19/a8836982-94e6-49da-b565-a03818128aa4.jpeg.a.jpeg'),
	(22, 'i9级十六核台式电脑主机高配i5', 799, '11400F吃鸡LOL游戏办公组装机全套', 0, 'https://img.pddpic.com/mms-material-img/2021-04-08/b59bc3ce-6e92-42c2-985a-48c99e870538.jpeg.a.jpeg'),
	(23, '小米/Xiaomi Pro【正品行货】', 2999, 'i5/i7办公学生超薄游戏笔记本电脑', 1, 'https://img.pddpic.com/mms-material-img/2021-03-21/a0449ed3-af2f-4f27-942b-1cb7ee5b93b5.jpeg.a.jpeg'),
	(24, 'Kindle paperwhite4电子书阅读器', 869, '电纸书kpw4 亚马逊电子墨水屏', 0, 'https://img.pddpic.com/mms-material-img/2021-01-19/2021-01-19/a300b0aa-b684-485a-889d-bc5baab9e35c.jpeg.a.jpeg'),
	(25, 'Komery数码相机学生入门级数码微单', 308, '4K高清摄像机家用旅行便携录拍', 0, 'https://img.pddpic.com/mms-material-img/2021-04-08/ea972178-4642-4be8-b700-18dcf04e4039.jpeg.a.jpeg'),
	(26, '兰蔻粉金菁纯柔雾哑光口红', 78, '196朱砂橘888小野莓274温柔奶茶小样', 4, 'https://img.pddpic.com/mms-material-img/2021-04-17/6c4117e7-c28c-4802-b523-c17386ef489b.jpeg'),
	(27, '韩国unny防晒霜学生军训防紫外线隔离', 89, '遮瑕防晒乳三合一SPF50正品', 0, 'https://img.pddpic.com/mms-material-img/2021-03-01/4efc36f5-832b-43bc-b3c4-05137a10e987.jpeg'),
	(28, '【国内现货】冠军男女同款经典草写印花LOGO休闲T恤', 99, 'GT23H', 0, 'https://img.pddpic.com/mms-material-img/2020-08-18/7e2518e3-13f2-4303-ae9e-d13d7c19299e.jpeg.a.jpeg'),
	(29, '小米（MI）小米11 Pro', 4999, '黑色 8+256GB 骁龙888处理器 5000mAh大电量', 38, 'https://imgservice.suning.cn/uimg1/b2c/image/EF37oQXrxMDFusjwSbWoFw.jpg_800w_800h_4e'),
	(31, '瑞仕兹 创意生日礼物', 50, '实用毕业季礼物ins网红少女心实用精致送朋友同学六一儿童节礼品床头伴睡灯小礼品', 1, 'https://imgservice.suning.cn/uimg1/b2c/image/hp6U-2p9ZkiEHPS4OtEMvw.jpg_800w_800h_4e');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;

-- 正在导出表  miaosha.item_detail_img 的数据：~63 rows (大约)
/*!40000 ALTER TABLE `item_detail_img` DISABLE KEYS */;
INSERT INTO `item_detail_img` (`id`, `item_id`, `img_url`) VALUES
	(4, 6, 'https://imgservice.suning.cn/uimg1/b2c/image/YiCCBCLHYUZrduSWZyI1pA.jpg_800w_800h_4e'),
	(5, 29, 'https://uimgproxy.suning.cn/uimg1/sop/commodity/zLr1Tadq5JBNsBoHJTKO4A.png'),
	(6, 29, 'https://uimgproxy.suning.cn/uimg1/sop/commodity/YuW5rVOGD5bxUZb_L8Cr0g.png'),
	(7, 9, 'https://img.pddpic.com/mms-material-img/2021-04-30/ccac91da-d6a2-4cf3-8db9-65bcc566de8a.jpeg?imageView2/2/w/1300/q/80'),
	(8, 9, 'https://commimg.pddpic.com/garner-api/51c67be3bad67065dcc47e3f1345279b.jpeg?imageView2/2/w/1300/q/80'),
	(9, 12, 'https://img.pddpic.com/mms-material-img/2021-01-30/2021-01-30/4e9cd6d4-4432-4fe3-8be0-fb35a1b5a110.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(10, 12, 'https://img.pddpic.com/mms-material-img/2021-01-30/2021-01-30/704ce61c-24ca-41d5-868c-760584f24616.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(11, 12, 'https://img.pddpic.com/mms-material-img/2021-01-30/2021-01-30/403a7c6b-f90f-45f3-921f-aa3faf892a57.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(12, 11, 'https://img-1.pddpic.com/mms-material-img/2020-11-04/925f45ff-ed9d-4b03-8209-43c107be951f.jpeg?imageView2/2/w/1300/q/80'),
	(13, 11, 'https://img-1.pddpic.com/mms-material-img/2020-11-04/50a35de0-0398-4366-8d71-0c6f930cbdc9.jpeg?imageView2/2/w/1300/q/80'),
	(14, 11, 'https://img-1.pddpic.com/mms-material-img/2020-11-04/030fd342-7f5c-4eef-9e72-13aa77a1ef10.jpeg?imageView2/2/w/1300/q/80'),
	(15, 13, 'https://img-1.pddpic.com/mms-material-img/2020-09-20/10435498-342e-4290-8dc8-4f81f221a623.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(16, 13, 'https://img-1.pddpic.com/mms-material-img/2020-09-09/d1d86edc-817d-43ca-8918-c88582df8210.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(17, 13, 'https://img-1.pddpic.com/mms-material-img/2020-09-09/59a4503b-8e5b-4b26-9032-380a67f1b96e.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(18, 16, 'https://commimg-1.pddpic.com/garner-api/d35b58c491440b26bdd3a3ba8d18a927.jpeg?imageView2/2/w/1300/q/80'),
	(19, 16, 'https://img-1.pddpic.com/mms-material-img/2021-02-02/2021-02-02/69a142ed-2e2e-4c1e-a9fc-157352f1ef4b.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(20, 16, 'https://img-1.pddpic.com/mms-material-img/2021-02-02/89bdba99-0a33-4162-b16d-112745a0fe8a.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(21, 14, 'https://img-1.pddpic.com/mms-material-img/2020-12-07/80c3ca85-16c7-4571-a2fd-462919726b2a.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(22, 14, 'https://img-1.pddpic.com/mms-material-img/2020-11-30/20c52518-c97c-4773-b423-32f3d2900f9b.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(23, 14, 'https://img-1.pddpic.com/mms-material-img/2020-08-17/3f1508f0-8041-43fd-bce8-73fdc3fd64cf.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(24, 8, 'https://img-1.pddpic.com/mms-material-img/2021-06-01/9309f2b6-f888-4610-8f57-081b0e81e7b9.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(25, 8, 'https://img-1.pddpic.com/mms-material-img/2021-06-01/bc9cde57-ac8a-444f-9df4-f5672d5be8a0.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(26, 8, 'https://img-1.pddpic.com/mms-material-img/2021-06-01/1c28868d-3fda-4142-b856-af3a843ccc87.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(27, 10, 'https://img-1.pddpic.com/mms-material-img/2021-05-09/65df9c04-6d2f-49bc-af48-bd929d4d34dc.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(28, 10, 'https://img-1.pddpic.com/mms-material-img/2021-05-09/a4011562-03a7-4acb-9784-0b2d6c0547bf.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(29, 10, 'https://img-1.pddpic.com/mms-material-img/2021-05-09/11897652-ccdc-4b0e-a971-b3d42bed69b7.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(30, 15, 'https://img-1.pddpic.com/mms-material-img/2020-10-13/a0b0713e-b8d6-413a-b4c4-e4f6b8d486ae.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(31, 15, 'https://img-1.pddpic.com/mms-material-img/2020-10-13/abb6a32f-93f5-44d2-98b1-4a44894f9c14.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(32, 15, 'https://img-1.pddpic.com/mms-material-img/2020-10-13/90f9045e-5532-4317-bc32-b5c650a73e6d.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(33, 17, 'https://img-1.pddpic.com/mms-material-img/2020-09-05/dd937fe5-134f-4054-b5ff-5557660f395a.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(34, 17, 'https://img-1.pddpic.com/mms-material-img/2020-10-17/0dce0cbe-74a9-4d76-a86c-d67124914381.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(35, 17, 'https://img-1.pddpic.com/mms-material-img/2020-10-17/26fcf043-60af-4ee9-ad2f-86b3f80e818a.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(36, 18, 'https://img-1.pddpic.com/mms-material-img/2021-02-26/ec29fa4a-206b-4a53-a33e-65bebb181231.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(37, 18, 'https://commimg-1.pddpic.com/garner-api/fc52ab4d39c5c0e7f6c6e72dfd6465ca.jpeg?imageView2/2/w/1300/q/80'),
	(38, 18, 'https://img-1.pddpic.com/mms-material-img/2021-02-26/73ec6ae5-d6c3-44df-baea-95d60ece21b6.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(39, 19, 'https://img-1.pddpic.com/mms-material-img/2020-07-11/2f464c56-2c9a-40df-b9f7-61adc5fc17f9.jpg.a.jpeg?imageView2/2/w/1300/q/80'),
	(40, 19, 'https://img-1.pddpic.com/mms-material-img/2020-07-11/8fbbdb77-df3d-4443-9719-784f10dc0ed4.jpg.a.jpeg?imageView2/2/w/1300/q/80'),
	(41, 19, 'https://img-1.pddpic.com/mms-material-img/2020-07-11/b6c2bed8-0939-4bd6-8087-4d8fcc1866b8.jpg.a.jpeg?imageView2/2/w/1300/q/80'),
	(42, 20, 'https://img-1.pddpic.com/mms-material-img/2021-05-30/3384880b-84b4-4e6f-b05f-c475e1c2e50b.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(43, 20, 'https://img-1.pddpic.com/mms-material-img/2021-03-06/381523cf-a1c4-477b-ac72-a0ab7433b332.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(44, 20, 'https://img-1.pddpic.com/mms-material-img/2021-03-06/14e41129-9b46-4077-a74f-1c3a4d59d390.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(45, 21, 'https://img-1.pddpic.com/mms-material-img/2020-11-22/95344008-1912-4d8d-9f5f-4e64c0c57a10.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(46, 21, 'https://img-1.pddpic.com/mms-material-img/2020-06-17/0539edd2-eef9-4747-8dbc-fe5b5d1a7949.jpeg?imageView2/2/w/1300/q/80'),
	(47, 21, 'https://img-1.pddpic.com/mms-material-img/2020-06-17/66454d9a-84ce-42ac-805b-0d69bbed1725.jpeg?imageView2/2/w/1300/q/80'),
	(48, 22, 'https://img-1.pddpic.com/mms-material-img/2020-09-30/f7d294de-1ff2-4500-b508-1113974303b7.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(49, 22, 'https://img-1.pddpic.com/mms-material-img/2021-05-27/1732eb7f-3658-4999-b20a-b2e132860ff4.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(50, 22, 'https://img-1.pddpic.com/mms-material-img/2020-12-19/0be37b47-b1d5-4b98-b48d-12b9e4b41097.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(51, 23, 'https://commimg-1.pddpic.com/garner-api/85e9111ac1fc18deedb0291965700b0e.jpeg?imageView2/2/w/1300/q/80'),
	(52, 23, 'https://commimg-1.pddpic.com/garner-api/85e9111ac1fc18deedb0291965700b0e.jpeg?imageView2/2/w/1300/q/80'),
	(53, 23, 'https://commimg-1.pddpic.com/garner-api/6498b24f5daae57404025d5bca0035fc.jpeg?imageView2/2/w/1300/q/80'),
	(54, 24, 'https://img-1.pddpic.com/mms-material-img/2021-05-10/1b998fb7-97b4-48c8-b502-ce81309dc530.jpeg?imageView2/2/w/1300/q/80'),
	(55, 24, 'https://img-1.pddpic.com/mms-material-img/2021-05-10/d6a24541-72fb-4755-bc2f-df8b6d313121.jpeg?imageView2/2/w/1300/q/80'),
	(56, 24, 'https://img-1.pddpic.com/mms-material-img/2021-05-10/1454a008-6f5e-4a63-8a6a-ea05c3e1ef20.jpeg?imageView2/2/w/1300/q/80'),
	(57, 25, 'https://img-1.pddpic.com/mms-material-img/2021-03-29/2d2c749b-7844-494b-9bc1-6636955420bc.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(58, 25, 'https://img-1.pddpic.com/mms-material-img/2021-03-29/2f37824e-be7a-4b05-b6e0-c7a70071beaa.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(59, 25, 'https://img-1.pddpic.com/mms-material-img/2021-03-29/7a0a0d63-63fd-4354-8270-02aec3a25a24.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(60, 26, 'https://img-1.pddpic.com/mms-material-img/2021-04-17/34476cf9-0652-4270-abcc-4250dbd85271.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(61, 26, 'https://img-1.pddpic.com/mms-material-img/2021-04-17/8031ab82-13cb-4ad2-bde2-26b797534429.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(62, 26, 'https://img-1.pddpic.com/mms-material-img/2021-04-17/0c545753-a804-4460-b388-c2492f402b38.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(63, 27, 'https://img-1.pddpic.com/mms-material-img/2020-12-18/7d6bf1d6-0986-408b-aaaa-48ed35aa4a46.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(64, 27, 'https://img-1.pddpic.com/mms-material-img/2020-12-18/b03e85a2-50e9-4760-a339-dc9d5b621c33.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(65, 27, 'https://img-1.pddpic.com/mms-material-img/2020-12-18/4daf75fa-e62a-4368-a0c4-618ad9586eef.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(66, 28, 'https://img-1.pddpic.com/mms-material-img/2021-02-19/a902a2fe-8ab7-4df9-adc1-cd2ca4612520.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(67, 28, 'https://img-1.pddpic.com/mms-material-img/2021-02-19/f43dd506-3c80-47b2-8ec4-7ddca7aab119.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(68, 28, 'https://img-1.pddpic.com/mms-material-img/2021-02-19/5b0f69ad-464f-45d1-b1fa-26781a1eb83c.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(69, 29, 'https://img-1.pddpic.com/mms-material-img/2021-03-31/8d8c5a2b-f3f7-4380-80de-0afc3d2c77bb.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(70, 29, 'https://commimg-1.pddpic.com/garner-api/6a4e4e3f509ccdba6d35a1a858f0abad.jpeg?imageView2/2/w/1300/q/80'),
	(71, 29, 'https://img-1.pddpic.com/mms-material-img/2021-03-31/83af218c-4ce9-4270-9cc8-c20663ff6221.jpeg.a.jpeg?imageView2/2/w/1300/q/80'),
	(72, 31, 'https://uimgproxy.suning.cn/uimg1/sop/commodity/LmlsMIc_aIhgAVJUwM2rWg.jpg'),
	(73, 31, 'https://uimgproxy.suning.cn/uimg1/sop/commodity/C8xJhOwlCOR1dPM0coSnig.jpg'),
	(74, 31, 'https://uimgproxy.suning.cn/uimg1/sop/commodity/nrxpJwOaPIfe_U6j6Cwksg.jpg');
/*!40000 ALTER TABLE `item_detail_img` ENABLE KEYS */;

-- 正在导出表  miaosha.item_stock 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `item_stock` DISABLE KEYS */;
INSERT INTO `item_stock` (`id`, `stock`, `item_id`) VALUES
	(6, 47, 6),
	(7, 197, 7),
	(8, 11, 8),
	(9, 91, 9),
	(10, 99, 10),
	(11, 85, 11),
	(12, 99, 12),
	(13, 91, 13),
	(14, 98, 14),
	(15, 100, 15),
	(16, 95, 16),
	(17, 100, 17),
	(18, 100, 18),
	(19, 100, 19),
	(20, 100, 20),
	(21, 100, 21),
	(22, 100, 22),
	(23, 99, 23),
	(24, 100, 24),
	(25, 89, 25),
	(26, 86, 26),
	(27, 90, 27),
	(28, 99, 28),
	(29, 61, 29),
	(30, 1, 30),
	(31, 9999, 31);
/*!40000 ALTER TABLE `item_stock` ENABLE KEYS */;

-- 正在导出表  miaosha.order_discount_rel 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `order_discount_rel` DISABLE KEYS */;
INSERT INTO `order_discount_rel` (`id`, `order_id`, `discount`) VALUES
	(1, '2021060700007100', 20),
	(2, '2021060700007200', 0),
	(3, '2021060700007300', 0),
	(4, '2021060700007400', 0),
	(5, '2021060700007500', 8),
	(6, '2021060700007600', 539.82),
	(7, '2021060700007700', 21.5),
	(8, '2021060700007800', 0.2),
	(9, '2021060700007900', 0),
	(10, '2021060700008000', 0),
	(11, '2021060700008100', 0),
	(12, '2021061100008200', 0);
/*!40000 ALTER TABLE `order_discount_rel` ENABLE KEYS */;

-- 正在导出表  miaosha.order_info 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `order_info` DISABLE KEYS */;
INSERT INTO `order_info` (`id`, `user_id`, `item_id`, `item_price`, `amount`, `order_price`, `promo_id`) VALUES
	('2021060700005700', 40, 11, 80, 1, 80, 3),
	('2021060700005800', 40, 11, 80, 1, 80, 3),
	('2021060700005900', 40, 16, 1000, 1, 1000, 0),
	('2021060700006000', 40, 11, 80, 1, 80, 3),
	('2021060700006100', 40, 11, 80, 1, 80, 3),
	('2021060700006200', 40, 13, 1, 3, 3, 0),
	('2021060700006300', 40, 16, 1000, 1, 1000, 0),
	('2021060700006400', 40, 14, 100, 1, 100, 0),
	('2021060700006500', 40, 11, 80, 1, 80, 3),
	('2021060700006600', 40, 9, 50, 1, 50, 5),
	('2021060700006700', 40, 9, 50, 1, 50, 5),
	('2021060700006800', 40, 9, 50, 1, 50, 5),
	('2021060700006900', 40, 29, 4999, 1, 4999, 0),
	('2021060700007000', 40, 29, 4999, 37, 184963, 0),
	('2021060700007100', 40, 9, 50, 1, 50, 5),
	('2021060700007200', 40, 9, 50, 1, 50, 5),
	('2021060700007300', 40, 11, 80, 1, 80, 3),
	('2021060700007400', 40, 11, 80, 1, 80, 3),
	('2021060700007500', 40, 11, 80, 1, 72, 3),
	('2021060700007600', 40, 23, 2999, 1, 2459.18, 0),
	('2021060700007700', 62, 31, 50, 1, 28.5, 0),
	('2021060700007800', 62, 13, 1, 3, 2.8, 0),
	('2021060700007900', 62, 9, 50, 1, 50, 5),
	('2021060700008000', 40, 12, 111, 1, 111, 4),
	('2021060700008100', 40, 26, 78, 4, 312, 0),
	('2021061100008200', 40, 12, 111, 1, 111, 4);
/*!40000 ALTER TABLE `order_info` ENABLE KEYS */;

-- 正在导出表  miaosha.promo 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `promo` DISABLE KEYS */;
INSERT INTO `promo` (`id`, `promo_name`, `start_date`, `item_id`, `promo_item_price`, `end_date`) VALUES
	(2, '挖到哇多哇多', '2021-05-02 00:00:00', 1, 213213, '2021-09-03 00:00:00'),
	(3, '618大促', '2021-05-01 00:00:00', 11, 80, '2021-08-30 00:00:00'),
	(4, '618', '2021-05-02 00:00:00', 12, 111, '2021-08-30 00:00:00'),
	(5, '518', '2021-05-02 00:00:00', 9, 50, '2021-08-30 00:00:00');
/*!40000 ALTER TABLE `promo` ENABLE KEYS */;

-- 正在导出表  miaosha.sequence_info 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sequence_info` DISABLE KEYS */;
INSERT INTO `sequence_info` (`name`, `current_value`, `step`) VALUES
	('order_info', 83, 1);
/*!40000 ALTER TABLE `sequence_info` ENABLE KEYS */;

-- 正在导出表  miaosha.stock_log 的数据：~78 rows (大约)
/*!40000 ALTER TABLE `stock_log` DISABLE KEYS */;
INSERT INTO `stock_log` (`stock_log_id`, `item_id`, `amount`, `status`) VALUES
	('05bcc80c65c74dc9969762fe63e58248', 6, 1, 2),
	('092d62a53fa447a49cc033ad71082abe', 29, 1, 2),
	('0ce72562a1654b17980afa1c4bc9c25a', 9, 1, 1),
	('0e29f900139c46529e54a4ba23ac750f', 16, 1, 2),
	('1151e433d0b84e6d93a0e20091071ebf', 6, 1, 1),
	('1392bff227564b439903a70521429bee', 6, 1, 2),
	('15779e0005334e3ca1290987225fc286', 6, 1, 2),
	('16887fa4d0e14be4b4b20913e321a326', 9, 1, 1),
	('1b2b2dd209dd4e36b1613a807f8621e0', 13, 3, 3),
	('1b68ab2d908242c398ffe8e7d4845153', 11, 1, 2),
	('1c04b2518f1e478c99345ca63e1cec3a', 6, 1, 1),
	('1c58d22a3c1a4680aa7d45a16c6f0a01', 17, 1, 1),
	('279148f7d65b42a38825f596f377b898', 11, 1, 2),
	('2a92cf44564e420fa46cbd8e3d15e379', 6, 1, 3),
	('2b36baa88d2d407ca1769516b680ddc4', 15, 5, 1),
	('2bad2ea0b1354df2a86f9af9644521ad', 6, 1, 2),
	('2f1959e4f28947389ccec8d1c9cb4955', 8, 1, 1),
	('350b0290ca684064938b74077af8d255', 17, 1, 1),
	('365976ebfc8a4d928f1348b9b87508f1', 12, 1, 2),
	('3959d23df9dc4456aa25faf1ca329c51', 9, 1, 1),
	('3c723989f9a14ce6a230eb3b36381070', 14, 1, 2),
	('3feff068ed8e4b91a757cce927bf0915', 6, 1, 2),
	('4510a3c95fd04c5f9985ec624c5bdb19', 9, 1, 2),
	('45c34a628b6d4ec693294509470f9f3d', 17, 1, 1),
	('45c8a66e70d94928a98ddb874cfaeb11', 6, 1, 2),
	('4600bd7abb024f4698f8caefc5dce7b3', 9, 1, 2),
	('496876d4f2774b52b400f5241dca3eef', 9, 1, 1),
	('51ac037d3cbd4177a93e728d633d87e5', 6, 1, 2),
	('5a3574e300f84abc8cba8bca52720b83', 9, 1, 2),
	('62a6243ef19e4361ba90a1a81645276c', 17, 1, 1),
	('661124bca1fc49c293f56361590aaad2', 12, 1, 1),
	('696824f95b2743e39fc42d73c211fc19', 11, 1, 2),
	('6a92c50c0c644475b03b476ecf16deae', 6, 1, 2),
	('6b5d7a909c1846aa879ab7e13acbc9ea', 6, 1, 2),
	('6b792aee5f574a8b9ad011e8e3962d04', 6, 1, 2),
	('7152c33137524d0189a57964995340d2', 11, 1, 2),
	('72f030b7f4cb4fc0a779fc8eccb44d7e', 9, 1, 1),
	('771d66f847db43bb97a7639c8a010a45', 6, 1, 2),
	('777621f3639f45a08f0c7cc75863c2f4', 6, 1, 2),
	('791cfbe9183c4f7a9ee936ab6943fd0f', 6, 1, 2),
	('7ae7cda09b9a43d5b2d0c7063716dc42', 9, 1, 2),
	('7e84ccb5a2024f7f8a469aba4f5930ac', 6, 1, 2),
	('7ed4b954b0ad4fc888c3ffbf8c522e49', 10, 1, 1),
	('7ee1aa69eac34a7096cad74a7742d881', 23, 1, 2),
	('821163bea7b24acf8fe447319cb93460', 6, 1, 2),
	('824dd80af130497eaad89c9edbd707ec', 11, 1, 2),
	('829002ec81c341ffa0677770f620707c', 13, 3, 2),
	('8428d20ff6ab480291d63c457cd17afa', 6, 1, 2),
	('898c647ec150442f976fb0f20a0dfd57', 6, 1, 2),
	('8ce29d6c5e654e21a8e530719ff6306c', 6, 1, 2),
	('912bf7696f6c4814bcd23a7409bff2a5', 6, 1, 2),
	('91520212305d40ba8abab59ce9837033', 13, 3, 2),
	('9fc249981e0446b7a4a6cbe1fb870388', 9, 1, 1),
	('a072b475b2db48ee8949d7e7f947e549', 11, 1, 2),
	('a32e78d2dee545acab4d68013a2b2d8c', 15, 5, 1),
	('a9eb13afb81f457fa05aa1a9830d2f4f', 11, 1, 2),
	('ad49a9161f554e289682b57ce405ea32', 17, 1, 1),
	('ad66cbf6ee704064b986fb92b0850c4d', 13, 1, 1),
	('afa316024a7d4cdd97f35fbfcaaeeb84', 10, 1, 1),
	('b0e8c355fd5d49b486494ef641fb8a2f', 8, 1, 1),
	('b3df7a5281f44d9ea55731439891a8ed', 26, 4, 2),
	('b48438209aa7436c82bf08e4e88e8b18', 6, 1, 2),
	('b50db7759f44400faf7f007a3062f680', 9, 1, 1),
	('b59a94504ccb44ce92447bda74dceb1f', 12, 1, 1),
	('b6be490536c14abc8480c165fb0070cd', 6, 1, 2),
	('b6d12f0c697c4c71b61867978b665583', 6, 1, 3),
	('b8b5ceb10ee84f16b09996423541c6e7', 13, 3, 3),
	('bfcd2c5bb7174496aac6cf52be40c2c8', 9, 1, 1),
	('c00c8e169d484ec99b4b0cb9a097416a', 9, 1, 1),
	('c025bad85abb46c095472547d42c568e', 15, 5, 1),
	('c2bf67c139f846b8917bcf7603e0f841', 9, 1, 2),
	('c4d65e21c4e94d6db35fe5dcce7eeaa2', 9, 1, 2),
	('cc37f958564a44a6971d1767e4841fc6', 13, 1, 1),
	('cd90aba5b6804df68af7b18f7bc333e9', 13, 3, 3),
	('cdf9434670b1461cbe7c2ca631aea15e', 13, 1, 1),
	('d0b08681b10f46359324234bb82ffc2c', 9, 1, 1),
	('d7dff5c778b34ee8a8a92955327329e6', 9, 1, 1),
	('da8a87fa75cd416baa922846ea99d17e', 11, 1, 2),
	('de662429aa0440848cd83baf58ebd52a', 6, 1, 2),
	('df8cbfc3b153422397f12317cbe3c810', 6, 1, 2),
	('ea1d939147d84acbbc4b424137b63f6f', 31, 1, 2),
	('ed673b5e6fb34efaa343a4cddbdf27f6', 16, 1, 2),
	('ee4e6d92e6dd4d0385a8c12b352d7780', 15, 5, 1),
	('ef137cdbc45a44359317bdedbec8d468', 29, 37, 2),
	('f8fa215726554887a13f5c32f3a57cce', 9, 1, 1),
	('fc0b513420df4a6a9853933edcdd0885', 6, 1, 2),
	('fdd2d89ca6b04706ad76e18957ff1aa9', 12, 1, 2);
/*!40000 ALTER TABLE `stock_log` ENABLE KEYS */;

-- 正在导出表  miaosha.user_info 的数据：~41 rows (大约)
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` (`id`, `name`, `gender`, `age`, `telphone`, `register_mode`, `third_party_id`, `avatar`) VALUES
	(1, '第一个用户', 1, 30, '13521234859', 'byphone', '', NULL),
	(15, 'teambition', 1, 20, '1312345678', 'byphone', '', NULL),
	(20, '82030', 1, 1, '11111122', 'byphone', '', NULL),
	(21, 'hzl', 1, 31, '13671573214', 'byphone', '', NULL),
	(22, 'testuser', 1, 20, '13562514273', 'byphone', '', NULL),
	(23, 'Mysql', 1, 121, '123456789', 'byphone', '', NULL),
	(24, '张东杰34', 1, 11, '78978', 'byphone', '', 'https://pic2.zhimg.com/80/v2-a8e5a4a776193e612343ca0e1891aace_1440w.jpg?source=1940ef5c'),
	(26, '张东杰1', 1, 11, '1243124324324', 'byphone', '', 'https://pic4.zhimg.com/80/v2-fc3d3cd05ead955b33dccf6479535bf8_1440w.jpg?source=1940ef5c'),
	(27, '111', 1, 11, '43654646', 'byphone', '', 'https://pic2.zhimg.com/80/v2-8c6806867fd3a72e455b4b3c54cb94a4_1440w.jpg?source=1940ef5c'),
	(28, '111', 1, 11, '3452', 'byphone', '', 'https://pic4.zhimg.com/80/v2-aef268306a2f76ba3c9e1ee7c4f8ff71_1440w.jpg?source=1940ef5c'),
	(30, '11', 1, 11, '34524536', 'byphone', '', 'https://pic4.zhimg.com/80/v2-cffae22f4abe8589ec316070b8d9ea50_1440w.jpg?source=1940ef5c'),
	(32, '1', 1, 1, '345245364353342', 'byphone', '', 'https://pic4.zhimg.com/80/v2-aef268306a2f76ba3c9e1ee7c4f8ff71_1440w.jpg?source=1940ef5c'),
	(33, '1', 1, 1, '324324325', 'byphone', '', 'https://pic4.zhimg.com/80/v2-aef268306a2f76ba3c9e1ee7c4f8ff71_1440w.jpg?source=1940ef5c'),
	(34, '11', 1, 1, '4835798098', 'byphone', '', 'https://pic2.zhimg.com/80/v2-5b4ef45f79bbc72721c3461325283def_1440w.jpg?source=1940ef5c'),
	(35, '11', 1, 22, '54768799876', 'byphone', '', 'https://pic1.zhimg.com/80/v2-7df17d8c9e7e810a089327419ab4b172_1440w.jpg?source=1940ef5c'),
	(36, '11', 1, 11, '798043268', 'byphone', '', 'https://pic4.zhimg.com/80/v2-fc3d3cd05ead955b33dccf6479535bf8_1440w.jpg?source=1940ef5c'),
	(38, '张东杰', 1, 11, '188', 'byphone', '', 'https://pic2.zhimg.com/80/v2-ca1e548a21c747781eff05fe74c20a56_1440w.jpg?source=1940ef5c'),
	(40, 'Tom', 1, 1, '130', 'byphone', '', 'https://pic1.zhimg.com/80/v2-3192f38e20d8bf3bb15c955903790b79_1440w.jpg?source=1940ef5c'),
	(41, 'Tom', 1, 1, '134', 'byphone', '', 'https://pic2.zhimg.com/80/v2-ca1e548a21c747781eff05fe74c20a56_1440w.jpg?source=1940ef5c'),
	(42, 'Tom', 1, 1, '234', 'byphone', '', 'https://pic1.zhimg.com/80/v2-ddcbdb9f9a6d76f8654a0d440fb471c4_1440w.jpg?source=1940ef5c'),
	(43, 'Tom', 1, 1, '444', 'byphone', '', 'https://pic4.zhimg.com/80/v2-7e2aab3fad79ce93b35eef78950f125c_1440w.jpg?source=1940ef5c'),
	(44, 'Tom', 1, 1, '5', 'byphone', '', 'https://pic3.zhimg.com/80/v2-6b8f28929f702a3d4f8061a2afd41064_1440w.jpg?source=1940ef5c'),
	(45, 'Tom', 1, 1, '666', 'byphone', '', 'https://pic2.zhimg.com/80/v2-6b88a8b945c542ce79155a34f1ac23a5_1440w.jpg?source=1940ef5c'),
	(46, 'Tom', 1, 1, '135', 'byphone', '', 'https://pic2.zhimg.com/80/v2-5b4ef45f79bbc72721c3461325283def_1440w.jpg?source=1940ef5c'),
	(47, 'Tom', 1, 1, '00', 'byphone', '', 'https://pic3.zhimg.com/80/v2-6b8f28929f702a3d4f8061a2afd41064_1440w.jpg?source=1940ef5c'),
	(48, 'Tom', 1, 1, '99', 'byphone', '', 'https://pic4.zhimg.com/80/v2-2e77b84bfb7a5c7cc87bde23f010eeb6_1440w.jpg?source=1940ef5c'),
	(49, 'Tom', 1, 1, '4', 'byphone', '', 'https://pic2.zhimg.com/80/v2-a8e5a4a776193e612343ca0e1891aace_1440w.jpg?source=1940ef5c'),
	(50, '个人', 1, 1, '6', 'byphone', '', 'https://pic1.zhimg.com/80/v2-8ec5fd1d95076516d44f9e5511d12737_1440w.jpg?source=1940ef5c'),
	(51, 'Tom', 1, 1, '7', 'byphone', '', 'https://pic4.zhimg.com/80/v2-fc3d3cd05ead955b33dccf6479535bf8_1440w.jpg?source=1940ef5c'),
	(52, 'Tom', 1, 1, '9', 'byphone', '', 'https://pic3.zhimg.com/80/v2-6b8f28929f702a3d4f8061a2afd41064_1440w.jpg?source=1940ef5c'),
	(53, '兰陵王', 1, 1, '90', 'byphone', '', 'https://pic3.zhimg.com/80/v2-6db51c268a8587df3aaf7e28aaa036a5_1440w.jpg?source=1940ef5c'),
	(54, '李宁', 1, 1, '888', 'byphone', '', 'https://pic4.zhimg.com/80/v2-7e2aab3fad79ce93b35eef78950f125c_1440w.jpg?source=1940ef5c'),
	(55, '张东杰1', 1, 1, '777', 'byphone', '', 'https://pic4.zhimg.com/80/v2-9ac9cb054d4d7be76b453126df4ab96a_1440w.jpg?source=1940ef5c'),
	(56, 'SpringBoot', 1, 1, '76', 'byphone', '', 'https://pic3.zhimg.com/80/v2-6db51c268a8587df3aaf7e28aaa036a5_1440w.jpg?source=1940ef5c'),
	(57, '张东杰34', 1, 1, '45', 'byphone', '', 'https://pic4.zhimg.com/80/v2-fc3d3cd05ead955b33dccf6479535bf8_1440w.jpg?source=1940ef5c'),
	(58, '张东杰', 1, 1, '12', 'byphone', '', 'https://pic1.zhimg.com/80/v2-057a1e0363af3dc126b7b9ea3bf7fb78_1440w.jpg?source=1940ef5c'),
	(59, '哇哈哈', 1, 1, '9090', 'byphone', '', 'https://pic1.zhimg.com/80/v2-7df17d8c9e7e810a089327419ab4b172_1440w.jpg?source=1940ef5c'),
	(60, '安不上', 1, 1, '7654', 'byphone', '', 'https://pic1.zhimg.com/80/v2-3192f38e20d8bf3bb15c955903790b79_1440w.jpg?source=1940ef5c'),
	(61, '张东杰', 1, 1, '887', 'byphone', '', 'https://pic1.zhimg.com/80/v2-c98552b9af9a7f949fb2bfc6c18ac793_1440w.jpg?source=1940ef5c'),
	(62, '派大星', 1, 1, '156825', 'byphone', '', 'https://pic1.zhimg.com/80/v2-8ec5fd1d95076516d44f9e5511d12737_1440w.jpg?source=1940ef5c'),
	(63, '海绵宝宝', 1, 1, '197', 'byphone', '', 'https://pic4.zhimg.com/80/v2-0ebe65bf59117a28745d47b3858e84c7_1440w.jpg?source=1940ef5c'),
	(64, '钢铁侠', 1, 1, '899', 'byphone', '', 'https://pic2.zhimg.com/80/v2-ca1e548a21c747781eff05fe74c20a56_1440w.jpg?source=1940ef5c'),
	(65, '戴总', 1, 1, '655', 'byphone', '', 'https://pic4.zhimg.com/80/v2-cffae22f4abe8589ec316070b8d9ea50_1440w.jpg?source=1940ef5c'),
	(66, '和红海子', 1, 1, '455', 'byphone', '', 'https://pic4.zhimg.com/80/v2-0ebe65bf59117a28745d47b3858e84c7_1440w.jpg?source=1940ef5c');
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;

-- 正在导出表  miaosha.user_password 的数据：~38 rows (大约)
/*!40000 ALTER TABLE `user_password` DISABLE KEYS */;
INSERT INTO `user_password` (`id`, `encrpt_password`, `user_id`) VALUES
	(1, 'ddlsjfjfjfjlf', 1),
	(9, '4QrcOUm6Wau+VuBX8g+IPg==', 15),
	(11, 'xMpCOKC5I4INzFCab3WEmw==', 20),
	(12, '4QrcOUm6Wau+VuBX8g+IPg==', 21),
	(13, '4QrcOUm6Wau+VuBX8g+IPg==', 22),
	(14, 'xMpCOKC5I4INzFCab3WEmw==', 23),
	(15, 'xMpCOKC5I4INzFCab3WEmw==', 0),
	(16, 'xMpCOKC5I4INzFCab3WEmw==', 0),
	(17, 'xMpCOKC5I4INzFCab3WEmw==', 0),
	(18, 'xMpCOKC5I4INzFCab3WEmw==', 33),
	(19, 'ZRK9Q9nKpuAsmQsKgmUtyg==', 34),
	(20, 'ZRK9Q9nKpuAsmQsKgmUtyg==', 35),
	(21, 'ZRK9Q9nKpuAsmQsKgmUtyg==', 36),
	(22, 'xMpCOKC5I4INzFCab3WEmw==', 38),
	(23, 'xMpCOKC5I4INzFCab3WEmw==', 40),
	(24, 'xMpCOKC5I4INzFCab3WEmw==', 41),
	(25, 'xMpCOKC5I4INzFCab3WEmw==', 42),
	(26, 'xMpCOKC5I4INzFCab3WEmw==', 43),
	(27, 'xMpCOKC5I4INzFCab3WEmw==', 44),
	(28, 'ZRK9Q9nKpuAsmQsKgmUtyg==', 45),
	(29, 'xMpCOKC5I4INzFCab3WEmw==', 46),
	(30, 'xMpCOKC5I4INzFCab3WEmw==', 47),
	(31, 'xMpCOKC5I4INzFCab3WEmw==', 48),
	(32, 'xMpCOKC5I4INzFCab3WEmw==', 49),
	(33, 'xMpCOKC5I4INzFCab3WEmw==', 50),
	(34, 'xMpCOKC5I4INzFCab3WEmw==', 51),
	(35, 'xMpCOKC5I4INzFCab3WEmw==', 52),
	(36, 'xMpCOKC5I4INzFCab3WEmw==', 53),
	(37, 'xMpCOKC5I4INzFCab3WEmw==', 54),
	(38, 'xMpCOKC5I4INzFCab3WEmw==', 55),
	(39, 'xMpCOKC5I4INzFCab3WEmw==', 56),
	(40, 'xMpCOKC5I4INzFCab3WEmw==', 57),
	(41, 'xMpCOKC5I4INzFCab3WEmw==', 58),
	(42, 'xMpCOKC5I4INzFCab3WEmw==', 59),
	(43, 'xMpCOKC5I4INzFCab3WEmw==', 60),
	(44, 'xMpCOKC5I4INzFCab3WEmw==', 61),
	(45, 'xMpCOKC5I4INzFCab3WEmw==', 62),
	(46, 'xMpCOKC5I4INzFCab3WEmw==', 63),
	(47, 'xMpCOKC5I4INzFCab3WEmw==', 64),
	(48, 'xMpCOKC5I4INzFCab3WEmw==', 65),
	(49, 'xMpCOKC5I4INzFCab3WEmw==', 66);
/*!40000 ALTER TABLE `user_password` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
