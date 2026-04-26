import Foundation

// MARK: - 快捷构造
private func ing(_ n: String, _ a: String) -> Ingredient { Ingredient(name: n, amount: a) }
private func stp(_ o: Int, _ d: String) -> CookingStep { CookingStep(order: o, description: d) }

struct RecipeStore {
    static let all: [Recipe] = braised + seafood + rawPickled + kueh + desserts + soups + sideDishes + classics

    // MARK: - 卤味
    static let braised: [Recipe] = [
        Recipe(name:"潮州卤鹅",category:.braised,difficulty:.hard,prepTime:60,cookTime:120,servings:8,
               ingredients:[ing("狮头鹅","1只约5kg"),ing("南姜","200g"),ing("八角","6粒"),ing("桂皮","2段"),ing("甘草","10g"),ing("老抽","200ml"),ing("生抽","300ml"),ing("冰糖","100g"),ing("米酒","150ml")],
               steps:[stp(1,"香料装纱布袋，与水、酱油、冰糖大火烧开熬卤水"),stp(2,"整鹅入锅，三吊三浸使受热均匀"),stp(3,"小火保持似滚非滚状态卤制90分钟"),stp(4,"关火浸泡30分钟入味"),stp(5,"切片装盘，配蒜泥白醋汁")],
               tips:["南姜是灵魂香料不可省略","老抽少量多次加，色泽红润即可","卤水冷冻可反复使用越久越香"],
               culturalNote:"潮州卤鹅被誉为潮菜之魂，是衡量酒家水平的标准。宴席拜神祭祖必备。"),
        Recipe(name:"卤水猪手",category:.braised,difficulty:.medium,prepTime:30,cookTime:90,servings:6,
               ingredients:[ing("猪手","2只"),ing("卤水香料包","1份"),ing("生抽","200ml"),ing("老抽","50ml"),ing("冰糖","60g")],
               steps:[stp(1,"猪手焯水去腥沥干"),stp(2,"放入熬好的卤水中大火烧开"),stp(3,"转小火卤制90分钟至筷子可插透"),stp(4,"浸泡20分钟后捞出切块")],
               tips:["焯水时加姜片和料酒效果更好"],culturalNote:"卤水拼盘是潮州宴席经典头盘。"),
        Recipe(name:"卤水拼盘",category:.braised,difficulty:.medium,prepTime:20,cookTime:60,servings:6,
               ingredients:[ing("豆腐","2块"),ing("鸡蛋","6个"),ing("大肠","500g"),ing("卤水","适量")],
               steps:[stp(1,"鸡蛋煮熟去壳，豆腐切块炸至金黄"),stp(2,"大肠清洗干净焯水"),stp(3,"全部放入卤水小火卤30分钟"),stp(4,"切件摆盘淋卤汁")],
               tips:["豆腐先炸再卤更入味"],culturalNote:"一盘卤味见功力，是潮菜师傅的基本功。"),
    ]

    // MARK: - 海鲜
    static let seafood: [Recipe] = [
        Recipe(name:"豆酱焗青蟹",category:.seafood,difficulty:.medium,prepTime:20,cookTime:15,servings:4,
               ingredients:[ing("青蟹","2只"),ing("普宁豆酱","3大匙"),ing("大蒜","1头"),ing("姜片","5片"),ing("米酒","1大匙")],
               steps:[stp(1,"蟹洗净斩块"),stp(2,"砂锅底铺炸蒜和姜片"),stp(3,"放入蟹块淋豆酱和米酒"),stp(4,"盖紧猛火焗8-10分钟")],
               tips:["蒜瓣炸至金黄会吸满蟹油极香","普宁豆酱是灵魂调料"],
               culturalNote:"豆酱焗蟹是潮州宴席必点海鲜大菜。"),
        Recipe(name:"潮式清蒸鱼",category:.seafood,difficulty:.easy,prepTime:15,cookTime:12,servings:4,
               ingredients:[ing("鲜鱼","1条约600g"),ing("潮州咸菜","50g"),ing("咸水梅","3颗"),ing("番茄","1个"),ing("姜丝","适量"),ing("香菇","3朵")],
               steps:[stp(1,"鱼处理干净，底部垫嫩豆腐"),stp(2,"铺上咸菜丝、番茄片、压烂的咸水梅和姜丝"),stp(3,"大火蒸10分钟"),stp(4,"出锅撒葱丝香菜")],
               tips:["咸水梅自带咸酸味不需额外加盐"],culturalNote:"潮州蒸鱼与粤式不同，讲究酸咸开胃。"),
        Recipe(name:"金不换炒薄壳",category:.seafood,difficulty:.easy,prepTime:10,cookTime:3,servings:3,
               ingredients:[ing("薄壳","500g"),ing("金不换(九层塔)","1大把"),ing("蒜蓉","3瓣"),ing("辣椒","2个"),ing("鱼露","1大匙")],
               steps:[stp(1,"薄壳洗净沥干"),stp(2,"热锅下蒜蓉辣椒爆香"),stp(3,"倒入薄壳猛火翻炒加鱼露"),stp(4,"壳全开后放金不换即出锅")],
               tips:["必须猛火快炒，不可久炒否则肉缩","金不换最后放保持香气"],
               culturalNote:"炒薄壳是潮汕大排档经典，没有金不换就没有灵魂。"),
        Recipe(name:"海鲜砂锅粥",category:.seafood,difficulty:.medium,prepTime:20,cookTime:40,servings:4,
               ingredients:[ing("珍珠米","200g"),ing("虾","200g"),ing("蟹","1只"),ing("干贝","30g"),ing("姜丝","适量"),ing("冬菜","20g"),ing("香菜","适量")],
               steps:[stp(1,"米浸泡后拌油盐腌制"),stp(2,"砂锅水沸下米小火熬煮"),stp(3,"米粒开花时放入海鲜和姜丝"),stp(4,"关火前加冬菜白胡椒粉麻油")],
               tips:["米拌油可防粘锅","海鲜不可过早放否则老化"],
               culturalNote:"潮汕砂锅粥讲究米粒开花而不烂，海鲜原汁原味。"),
        Recipe(name:"潮汕虾枣",category:.seafood,difficulty:.medium,prepTime:30,cookTime:15,servings:4,
               ingredients:[ing("鲜虾仁","500g"),ing("肥猪肉","50g"),ing("马蹄(荸荠)","100g"),ing("面粉","30g"),ing("鸭蛋","1个"),ing("葱白","适量"),ing("桔油","1碟")],
               steps:[stp(1,"虾仁拍扁后剁碎，肥肉切极小的丁"),stp(2,"马蹄切碎挤干水分，葱白切碎"),stp(3,"将所有材料混合，打入鸭蛋，加盐和少量面粉顺一个方向搅拌上劲"),stp(4,"挤成枣子大小的丸子，入五成热油锅炸至定型"),stp(5,"复炸一次至金黄酥脆，蘸桔油食用")],
               tips:["肥肉的加入能让虾枣口感更润滑不柴","必须配潮汕特有的桔油才解腻提鲜"],
               culturalNote:"虾枣因形似枣子而得名，外酥里嫩，鲜甜无比，是潮汕宴席上不可或缺的炸物。"),
    ]

    // MARK: - 生腌
    static let rawPickled: [Recipe] = [
        Recipe(name:"生腌血蚶",category:.rawPickled,difficulty:.easy,prepTime:30,cookTime:0,servings:3,
               ingredients:[ing("血蚶","500g"),ing("蒜末","3瓣"),ing("姜末","1块"),ing("香菜","适量"),ing("酱油","3大匙"),ing("鱼露","1大匙"),ing("辣椒","2个")],
               steps:[stp(1,"血蚶养水吐沙洗净"),stp(2,"快速焯烫5秒捞出过冰水"),stp(3,"调汁：酱油+鱼露+蒜末+姜末+辣椒+香菜"),stp(4,"拌匀冷藏腌制1小时即食")],
               tips:["务必保证食材新鲜，现腌现吃"],culturalNote:"生腌被称为潮汕毒药，一口上瘾。"),
        Recipe(name:"生腌虾蛄",category:.rawPickled,difficulty:.easy,prepTime:20,cookTime:0,servings:3,
               ingredients:[ing("虾蛄","500g"),ing("蒜末","4瓣"),ing("金不换","1把"),ing("酱油","4大匙"),ing("白糖","1小匙"),ing("麻油","1小匙")],
               steps:[stp(1,"虾蛄清洗干净剪去尖刺"),stp(2,"调制酱汁拌匀"),stp(3,"密封冷藏腌制2小时"),stp(4,"取出装盘撒金不换")],
               tips:["腌制时间不宜超过4小时"],culturalNote:"生腌虾蛄是潮汕夜市的灵魂小吃。"),
        Recipe(name:"生腌膏蟹",category:.rawPickled,difficulty:.medium,prepTime:30,cookTime:0,servings:4,
               ingredients:[ing("鲜活红膏蟹","2只"),ing("蒜末","1头"),ing("姜末","50g"),ing("辣椒","适量"),ing("芫荽","适量"),ing("生抽","200ml"),ing("高度白酒","50ml"),ing("陈醋","2大匙")],
               steps:[stp(1,"膏蟹用刷子彻底刷洗干净，斩件，去除蟹鳃"),stp(2,"用高度白酒均匀喷洒蟹块杀菌消毒，静置10分钟"),stp(3,"调制腌料：生抽、陈醋、蒜末、姜末、辣椒混合"),stp(4,"将蟹块完全浸没在腌汁中，密封冷藏腌制24小时"),stp(5,"取出撒上芫荽即可食用")],
               tips:["必须使用鲜活且满膏的优质红膏蟹","白酒杀菌步骤绝对不能省略"],
               culturalNote:"生腌膏蟹是潮汕生腌界的“劳斯莱斯”，蟹膏晶莹剔透如果冻般诱人。"),
    ]

    // MARK: - 粿品小吃
    static let kueh: [Recipe] = [
        Recipe(name:"潮州蚝烙",category:.kueh,difficulty:.medium,prepTime:15,cookTime:10,servings:3,
               ingredients:[ing("生蚝","300g"),ing("地瓜粉","100g"),ing("鸭蛋","3个"),ing("葱花","适量"),ing("鱼露","2大匙"),ing("猪油","适量")],
               steps:[stp(1,"地瓜粉加水调糊放入蚝和葱花"),stp(2,"热锅加猪油倒入蚝浆摊平"),stp(3,"淋上打散的蛋液"),stp(4,"煎至两面金黄酥脆蘸鱼露食用")],
               tips:["猪油比植物油更香","火候要足才能外酥内嫩"],
               culturalNote:"蚝烙是潮州街头巷尾最地道的特色小吃。"),
        Recipe(name:"手捶牛肉丸",category:.kueh,difficulty:.hard,prepTime:40,cookTime:15,servings:6,
               ingredients:[ing("牛后腿肉","500g"),ing("冰水","80ml"),ing("盐","8g"),ing("鱼露","1大匙"),ing("生粉","15g"),ing("胡椒粉","适量")],
               steps:[stp(1,"牛肉切块冷冻至半硬"),stp(2,"搅打成浆加调料朝一方向搅至起胶"),stp(3,"反复摔打增强弹性"),stp(4,"挤成丸放入70°C温水浸熟"),stp(5,"捞出过冰水增加口感")],
               tips:["全程保持肉浆8°C以下是Q弹关键","忌大火沸煮会变老"],
               culturalNote:"潮州牛肉丸讲究手捶工艺，弹性十足可当乒乓球弹。"),
        Recipe(name:"红桃粿",category:.kueh,difficulty:.medium,prepTime:40,cookTime:20,servings:8,
               ingredients:[ing("糯米粉","200g"),ing("粘米粉","100g"),ing("糯米饭","300g"),ing("香菇","5朵"),ing("虾米","30g"),ing("花生","50g")],
               steps:[stp(1,"制粿母：部分面团煮熟揉入生粉团增韧性"),stp(2,"炒制馅料：糯米饭+香菇+虾米+花生"),stp(3,"包馅用桃粿模具压型"),stp(4,"大火蒸15分钟至熟")],
               tips:["粿母是口感糯韧的关键"],culturalNote:"红桃粿是潮汕祭祀和节庆必备粿品。"),
        Recipe(name:"粿汁",category:.kueh,difficulty:.easy,prepTime:10,cookTime:15,servings:4,
               ingredients:[ing("米浆粿条","400g"),ing("卤猪肉","200g"),ing("卤蛋","2个"),ing("卤豆腐","2块"),ing("卤汁","适量")],
               steps:[stp(1,"粿条切段煮至软滑"),stp(2,"捞入碗中"),stp(3,"铺上切好的卤味"),stp(4,"淋上热卤汁即可")],
               tips:["粿条要煮透才够滑"],culturalNote:"粿汁是潮汕早餐首选，搭配各式卤味。"),
        Recipe(name:"普宁炸豆腐",category:.kueh,difficulty:.easy,prepTime:10,cookTime:15,servings:4,
               ingredients:[ing("普宁豆腐","4块"),ing("韭菜水","1碟"),ing("食盐","适量"),ing("食用油","500ml")],
               steps:[stp(1,"将普宁豆腐切成小块备用"),stp(2,"热锅下宽油，烧至八成热"),stp(3,"放入豆腐块，中小火慢炸至外表金黄酥脆"),stp(4,"捞出沥油，搭配特色韭菜盐水食用")],
               tips:["炸的时候不要频繁翻动以免碎裂","韭菜水是普宁炸豆腐的灵魂蘸料"],
               culturalNote:"普宁炸豆腐外皮酥脆，内里却如豆花般鲜嫩，是潮汕街头最受欢迎的平民小吃之一。"),
        Recipe(name:"猪肠胀糯米",category:.kueh,difficulty:.hard,prepTime:45,cookTime:60,servings:6,
               ingredients:[ing("猪大肠","500g"),ing("糯米","300g"),ing("五花肉","100g"),ing("香菇","50g"),ing("虾米","30g"),ing("花生米","50g"),ing("莲子","30g")],
               steps:[stp(1,"猪肠用盐和生粉反复揉洗干净"),stp(2,"糯米浸泡后与炒熟的五花肉丁、香菇丁等馅料拌匀调味"),stp(3,"将馅料灌入猪肠，两端用棉线扎紧，只装七分满"),stp(4,"冷水下锅，中火煮约1小时至熟透"),stp(5,"捞出放凉切片，可淋上甜酱油食用")],
               tips:["灌肠时不能太满，否则煮的时候容易撑破","用牙签在肠衣上扎几个小孔可以防止爆裂"],
               culturalNote:"“胀”在潮汕话中是灌入的意思。这道菜将各种珍味与糯米结合，口感丰富，是传统的潮汕名吃。"),
        Recipe(name:"炒糕粿",category:.kueh,difficulty:.medium,prepTime:15,cookTime:10,servings:3,
               ingredients:[ing("糕粿","400g"),ing("鸡蛋","2个"),ing("猪肉片","50g"),ing("虾仁","50g"),ing("芥蓝菜","100g"),ing("沙茶酱","1大匙"),ing("鱼露","1小匙")],
               steps:[stp(1,"糕粿切成三角形小块"),stp(2,"平底锅加油，将糕粿煎至两面微黄结皮"),stp(3,"打入鸡蛋液，使蛋液包裹住糕粿，盛出备用"),stp(4,"另起锅爆香肉片和虾仁，加入芥蓝菜和沙茶酱翻炒"),stp(5,"倒入煎好的糕粿，淋少量鱼露，猛火快炒均匀即出锅")],
               tips:["糕粿一定要先煎出焦脆的皮再炒，外酥内软才好吃","猛火快炒保留镬气"],
               culturalNote:"炒糕粿是汕头极具地方特色的传统街头小吃，带有浓郁的沙茶香和蛋香。"),
    ]

    // MARK: - 甜品
    static let desserts: [Recipe] = [
        Recipe(name:"金瓜芋泥",category:.dessert,difficulty:.medium,prepTime:30,cookTime:40,servings:6,
               ingredients:[ing("芋头","600g"),ing("南瓜","200g"),ing("猪油","50g"),ing("白糖","150g"),ing("白果","20粒"),ing("红枣","10颗")],
               steps:[stp(1,"芋头去皮蒸至软烂趁热压成泥"),stp(2,"南瓜蒸熟压泥铺盘底"),stp(3,"热锅加猪油放芋泥和糖中小火翻炒至油亮"),stp(4,"堆叠在南瓜泥上放白果红枣装饰")],
               tips:["猪油是香味来源不可省","选荔浦芋头口感最佳"],
               culturalNote:"芋泥是潮州宴席压轴甜品，头甜尾甜寓意生活甜美。"),
        Recipe(name:"反沙芋",category:.dessert,difficulty:.medium,prepTime:15,cookTime:15,servings:4,
               ingredients:[ing("芋头","400g"),ing("白糖","80g"),ing("水","40ml"),ing("油","适量")],
               steps:[stp(1,"芋头切条炸至金黄外脆捞出"),stp(2,"净锅放水和糖中火搅至浓稠"),stp(3,"倒入芋条快速翻炒"),stp(4,"炒至糖浆结晶成白霜即反沙成功")],
               tips:["最后阶段不停翻炒是关键切忌火大"],
               culturalNote:"反沙是潮州独特技法，糖浆结晶如白霜包裹食材。"),
        Recipe(name:"鸭母捻",category:.dessert,difficulty:.easy,prepTime:30,cookTime:10,servings:4,
               ingredients:[ing("糯米粉","250g"),ing("绿豆沙","100g"),ing("芋泥","100g"),ing("白糖","80g"),ing("薏米","30g"),ing("白木耳","20g")],
               steps:[stp(1,"糯米粉加热水揉成软面团"),stp(2,"取面团包入馅料收口揉圆"),stp(3,"水开放入煮至浮起"),stp(4,"另煮甜汤加薏米木耳，盛入碗中")],
               tips:["热水烫面皮更糯不易裂"],culturalNote:"鸭母捻因形似母鸭浮水而得名，是潮州传统甜点。"),
        Recipe(name:"清心丸绿豆爽",category:.dessert,difficulty:.easy,prepTime:15,cookTime:30,servings:5,
               ingredients:[ing("去皮绿豆(绿豆畔)","200g"),ing("清心丸","150g"),ing("冰糖","100g"),ing("清水","800ml"),ing("马蹄粉","2大匙")],
               steps:[stp(1,"去皮绿豆提前浸泡2小时"),stp(2,"绿豆隔水蒸20分钟至熟透但不烂"),stp(3,"锅中加水烧开，放入清心丸煮至浮起"),stp(4,"加入冰糖煮化，倒入蒸熟的绿豆"),stp(5,"马蹄粉加少许水调成芡汁，淋入锅中勾成薄芡即可")],
               tips:["绿豆要蒸熟而不是煮熟，这样才能保持颗粒分明","勾芡要薄，增加顺滑口感即可"],
               culturalNote:"这是潮汕地区夏天最受欢迎的消暑甜品，绿豆清凉去火，清心丸Q弹爽口。"),
    ]

    // MARK: - 汤品
    static let soups: [Recipe] = [
        Recipe(name:"护国菜",category:.soup,difficulty:.hard,prepTime:30,cookTime:40,servings:6,
               ingredients:[ing("番薯叶嫩尖","300g"),ing("草菇","100g"),ing("火腿","50g"),ing("浓鸡汤","800ml"),ing("鸡油","1大匙")],
               steps:[stp(1,"番薯叶碱水浸后搓洗去筋切碎"),stp(2,"草菇切碎备用"),stp(3,"放入鸡汤小火煨至软烂如翡翠"),stp(4,"勾芡撒火腿茸淋鸡油")],
               tips:["素菜荤做是潮菜一大绝活"],
               culturalNote:"相传南宋末帝逃难至潮州，百姓以番薯叶做羹进献，帝赐名护国菜。"),
        Recipe(name:"咸菜猪肚汤",category:.soup,difficulty:.medium,prepTime:30,cookTime:60,servings:4,
               ingredients:[ing("猪肚","1个"),ing("潮州咸菜","150g"),ing("白胡椒","10g"),ing("姜片","5片")],
               steps:[stp(1,"猪肚用盐和面粉反复搓洗干净"),stp(2,"焯水后与胡椒姜片炖1小时"),stp(3,"加入咸菜再煮15分钟"),stp(4,"切条装碗")],
               tips:["白胡椒整粒拍碎更香"],culturalNote:"潮汕家庭养胃暖身的经典汤品。"),
    ]

    // MARK: - 杂咸配粥
    static let sideDishes: [Recipe] = [
        Recipe(name:"菜脯蛋",category:.sideDish,difficulty:.easy,prepTime:5,cookTime:5,servings:2,
               ingredients:[ing("菜脯(萝卜干)","50g"),ing("鸡蛋","3个"),ing("葱花","适量")],
               steps:[stp(1,"菜脯切小丁"),stp(2,"鸡蛋打散加入菜脯和葱花"),stp(3,"热锅下油煎至两面金黄")],
               tips:["菜脯本身有咸味不需加盐"],culturalNote:"菜脯蛋是潮汕家家户户的家常菜。"),
        Recipe(name:"橄榄菜",category:.sideDish,difficulty:.hard,prepTime:60,cookTime:180,servings:10,
               ingredients:[ing("青橄榄","500g"),ing("芥菜叶","500g"),ing("食用油","300ml"),ing("生抽","3大匙"),ing("南姜末","适量")],
               steps:[stp(1,"橄榄煮熟去核切瓣浸泡数天去涩"),stp(2,"芥菜切碎攥干水分"),stp(3,"起油锅炸橄榄至微皱"),stp(4,"加芥菜碎和调料文火慢熬3小时至深褐浓稠")],
               tips:["油量要足全程文火是香味来源","制作器具必须无油无生水"],
               culturalNote:"橄榄菜是潮汕三宝之一，配白粥绝配。"),
    ]

    // MARK: - 经典名菜
    static let classics: [Recipe] = [
        Recipe(name:"明炉烧响螺",category:.classic,difficulty:.hard,prepTime:30,cookTime:45,servings:4,
               ingredients:[ing("大响螺","2个"),ing("清鸡汤","500ml"),ing("火腿","30g"),ing("蜜柑酒","2大匙"),ing("荔枝木炭","适量")],
               steps:[stp(1,"清理螺壳保留螺肉完整"),stp(2,"荔枝木炭火慢烤螺壳注入高汤和酒"),stp(3,"反复注汤让螺肉缓慢收缩至熟"),stp(4,"切薄片蘸梅膏酱食用")],
               tips:["片片透光是刀工最高标准"],culturalNote:"明炉烧响螺是潮州高端宴席压轴菜。"),
        Recipe(name:"富贵石榴鸡",category:.classic,difficulty:.hard,prepTime:60,cookTime:30,servings:6,
               ingredients:[ing("鸡皮","6张"),ing("鸡肉","200g"),ing("虾仁","100g"),ing("香菇","5朵"),ing("笋丝","50g")],
               steps:[stp(1,"鸡皮整张取下修圆备用"),stp(2,"馅料切丁调味炒熟"),stp(3,"鸡皮包馅扎成石榴形状"),stp(4,"入油锅炸至金黄")],
               tips:["鸡皮取整是最考验刀工的步骤"],culturalNote:"石榴鸡是潮菜工艺巅峰，形似石榴寓意多子多福。"),
        Recipe(name:"八宝素菜",category:.classic,difficulty:.medium,prepTime:40,cookTime:30,servings:6,
               ingredients:[ing("大白菜","300g"),ing("鲜草菇","50g"),ing("口蘑","50g"),ing("发菜","10g"),ing("腐竹","50g"),ing("莲子","30g"),ing("白果","30g"),ing("木耳","20g"),ing("上汤","500ml")],
               steps:[stp(1,"各类干货分别泡发，莲子白果煮熟去芯"),stp(2,"草菇、口蘑、白菜切块焯水备用"),stp(3,"砂锅底垫入大白菜"),stp(4,"将其他七宝整齐码放在白菜上"),stp(5,"注入上汤，小火慢煨20分钟至食材软烂入味")],
               tips:["素菜要用荤汤煨制才够鲜美，这是潮州素菜的秘诀"],
               culturalNote:"潮汕人崇尚礼佛，初一十五常吃素菜。八宝素菜用料讲究，是潮菜素宴中的极品。"),
        Recipe(name:"咸菜炒猪肚",category:.classic,difficulty:.medium,prepTime:20,cookTime:10,servings:4,
               ingredients:[ing("熟猪肚","250g"),ing("潮州咸菜","150g"),ing("红椒","1个"),ing("青椒","1个"),ing("大蒜","3瓣"),ing("白胡椒粉","适量")],
               steps:[stp(1,"熟猪肚切成条状，咸菜洗净切片并用水浸泡去咸味"),stp(2,"青红椒切丝，大蒜切末"),stp(3,"热锅冷油爆香蒜末，下猪肚条猛火翻炒"),stp(4,"加入挤干水分的咸菜片和青红椒丝继续爆炒"),stp(5,"撒入少许白胡椒粉和糖提鲜，迅速出锅")],
               tips:["咸菜本身有咸味，一般不需要再加盐","必须猛火快炒保证猪肚的爽脆口感"],
               culturalNote:"潮州咸菜与猪肚是绝配，这道菜酸咸开胃，脆嫩爽口，是极为经典的潮汕下饭菜。"),
    ]
}

// MARK: - 调味品百科
struct CondimentStore {
    static let all: [Condiment] = [
        Condiment(name:"普宁豆酱",description:"以黄豆为原料发酵制成的万能酱料",usage:"焗蟹、蒸鱼、蘸食",icon:"takeoutbox.and.cup.and.straw.fill"),
        Condiment(name:"南姜",description:"潮汕卤水的灵魂香料，辛香独特",usage:"卤水、咸菜腌制",icon:"leaf.fill"),
        Condiment(name:"鱼露",description:"鲜味液体调料，潮菜的秘密武器",usage:"炒菜、蘸食、腌制",icon:"drop.fill"),
        Condiment(name:"沙茶酱",description:"蒜、辣、虾、花生混合的浓郁酱料",usage:"火锅蘸料、炒牛肉",icon:"flame.fill"),
        Condiment(name:"梅膏酱",description:"酸甜适口的蘸食酱",usage:"蘸海鲜、响螺",icon:"seal.fill"),
        Condiment(name:"金不换",description:"九层塔/罗勒，炒薄壳的灵魂",usage:"炒薄壳、炒螺",icon:"leaf.arrow.triangle.circle.path"),
        Condiment(name:"红豉油",description:"潮式特色酱油",usage:"蘸食卤味",icon:"drop.circle.fill"),
        Condiment(name:"橘油",description:"柑橘制成的清香蘸碟",usage:"配海鲜",icon:"orange.fill"),
    ]
}

// MARK: - 工夫茶数据
struct TeaStore {
    static let tools: [TeaInfo] = [
        TeaInfo(name:"孟臣罐",description:"宜兴紫砂小壶，聚香耐用，泡茶核心器皿",icon:"cup.and.saucer.fill"),
        TeaInfo(name:"若琛甌",description:"白瓷小杯，薄如纸白如雪，品茶专用",icon:"mug.fill"),
        TeaInfo(name:"砂铫",description:"陶制烧水壶，传热快保温好",icon:"flame.fill"),
        TeaInfo(name:"红泥火炉",description:"传统炭炉，讲究活火烧水",icon:"fireplace.fill"),
    ]
    static let teas: [TeaInfo] = [
        TeaInfo(name:"凤凰单丛",description:"潮州代表茶种，香型丰富（蜜兰香/鸭屎香/芝兰香）",icon:"leaf.fill"),
        TeaInfo(name:"武夷岩茶",description:"大红袍/水仙/肉桂，焙火重适合工夫茶泡法",icon:"mountain.2.fill"),
        TeaInfo(name:"安溪铁观音",description:"独特观音韵，潮汕人喜爱的经典茶品",icon:"leaf"),
    ]
    static let steps = ["治器（温杯）","纳茶（放茶）","候汤（烧水）","冲茶（高冲）","刮沫（去泡）","淋罐（保温）","烫杯（洁杯）","斟茶（关公巡城·韩信点兵）"]
}
