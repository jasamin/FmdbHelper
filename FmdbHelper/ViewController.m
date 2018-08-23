//
//  ViewController.m
//  FmdbHelper
//
//  Created by Hanrun on 2018/8/22.
//  Copyright © 2018年 Carvin. All rights reserved.
//

#import "ViewController.h"
#import "CVFmdbHelper.h"
#import "TestModel.h"
#import "CVGetIvarModel.h"

#define PERSON @"Person"
#define STUDENT @"Student"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)creat:(id)sender {
    
    //CVGetIvarModel *getmodel = [[CVGetIvarModel alloc]init];
    NSArray *nameArr = [CVGetIvarModel getClassPropertyName:[TestModel class]];
    NSLog(@"keys = %@",nameArr);
    
    
    CVFmdbHelper *model = [CVFmdbHelper shareDelegate];
    [model createTableWithName:STUDENT andVualeNames:nameArr];
}

- (IBAction)saveAction:(id)sender {
    
    NSString *lastName = @"赵,钱,孙,李,周,吴,郑,王,冯,陈,褚,卫,蒋,沈,韩,杨,朱,秦,尤,许,何,吕,施,张,孔,曹,严,华,金,魏,陶,姜,戚,谢,邹,喻,柏,水,窦,章,云,苏,潘,葛,奚,范,彭,郎,鲁,韦,昌,马,苗,凤,花,方,俞,任,袁,柳,酆,鲍,史,唐,费,廉,岑,薛,雷,贺,倪,汤,滕,殷,罗,毕,郝,邬,安,常,乐,于,时,傅,皮,卞,齐,康,伍,余,元,卜,顾,孟,平,黄,和,穆,萧,尹,姚,邵,湛,汪,祁,毛,禹,狄,米,贝,明,臧,计,伏,成,戴,谈,宋,茅,庞,熊,纪,舒,屈,项,祝,董,梁,杜,阮,蓝,闵,席,季,麻,强,贾,路,娄,危,江,童,颜,郭,梅,盛,林,刁,钟,徐,邱,骆,高,夏,蔡,田,樊,胡,凌,霍,虞,万,支,柯,昝,管,卢,莫,经,房,裘,缪,干,解,应,宗,丁,宣,贲,邓,郁,单,杭,洪,包,诸,左,石,崔,吉,钮,龚,程,嵇,邢,滑,裴,陆,荣,翁,荀,羊,于,惠,甄,曲,家,封,芮,羿,储,靳,汲,邴,糜,松,井,段,富,巫,乌,焦,巴,弓,牧,隗,山,谷,车,侯,宓,蓬,全,郗,班,仰,秋,仲,伊,宫,宁,仇,栾,暴,甘,钭,厉,戎,祖,武,符,刘,景,詹,束,龙,叶,幸,司,韶,郜,黎,蓟,溥,印,宿,白,怀,蒲,邰,从,鄂,索,咸,籍,赖,卓,蔺,屠,蒙,池,乔,阴,郁,胥,能,苍,双,闻,莘,党,翟,谭,贡,劳,逄,姬,申,扶,堵,冉,宰,郦,雍,却,璩,桑,桂,濮,牛,寿,通,边,扈,燕,冀,浦,尚,农,温,别,庄,晏,柴,瞿,阎,充,慕,连,茹,习,宦,艾,鱼,容,向,古,易,慎,戈,廖,庾,终,暨,居,衡,步,都,耿,满,弘,匡,国,文,寇,广,禄,阙,东,欧,殳,沃,利,蔚,越,夔,隆,师,巩,厍,聂,晁,勾,敖,融,冷,訾,辛,阚,那,简,饶,空,曾,毋,沙,乜,养,鞠,须,丰,巢,关,蒯,相,查,后,荆,红,游,郏,竺,权,逯,盖,益,桓,公,仉,督,岳,帅,缑,亢,况,郈,有,琴,归,海,晋,楚,闫,法,汝,鄢,涂,钦,商,牟,佘,佴,伯,赏,墨,哈,谯,篁,年,爱,阳,佟,言,福,南,火,铁,迟,漆,官,冼,真,展,繁,檀,祭,密,敬,揭,舜,楼,疏,冒,浑,挚,胶,随,高,皋,原,种,练,弥,仓,眭,蹇,覃,阿,门,恽,来,綦,召,仪,风,介,巨,木,京,狐,郇,虎,枚,抗,达,杞,苌,折,麦,庆,过,竹,端,鲜,皇,亓,老,是,秘,畅,邝,还,宾,闾,辜,纵,侴,万俟,司马,上官,欧阳,夏侯,诸葛,闻人,东方,赫连,皇甫,羊舌,尉迟,公羊,澹台,公冶,宗正,濮阳,淳于,单于,太叔,申屠,公孙,仲孙,轩辕,令狐,钟离,宇文,长孙,慕容,鲜于,闾丘,司徒,司空,兀官,司寇,南门,呼延,子车,颛孙,端木,巫马,公西,漆雕,车正,壤驷,公良,拓跋,夹谷,宰父,谷梁,段干,百里,东郭,微生,梁丘,左丘,东门,西门,南宫,第五,公仪,公乘,太史,仲长,叔孙,屈突,尔朱,东乡,相里,胡母,司城,张廖,雍门,毋丘,贺兰,綦毋,屋庐,独孤,南郭,北宫,王孙";
    NSString *giveName = @"澄邈、德泽、海超、海阳、海荣、海逸、海昌、瀚钰、瀚文、涵亮、涵煦、涵蓄、涵衍、浩皛、浩波、浩博、浩初、浩宕、浩歌、浩广、浩邈、浩气、浩思、浩言、鸿宝、鸿波、鸿博、鸿才、鸿畅、鸿畴、鸿达、鸿德、鸿飞、鸿风、鸿福、鸿光、鸿晖、鸿朗、鸿文、鸿轩、鸿煊、鸿骞、鸿远、鸿云、鸿哲、鸿祯、鸿志、鸿卓、嘉澍、光济、澎湃、彭泽、鹏池、鹏海、浦和、浦泽、瑞渊、越泽、博耘、德运、辰宇、辰皓、辰钊、辰铭、辰锟、辰阳、辰韦、辰良、辰沛、晨轩、晨涛、晨濡、晨潍、鸿振、吉星、铭晨、起运、运凡、运凯、运鹏、运浩、运诚、运良、运鸿、运锋、运盛、运升、运杰、运珧、运骏、运凯、运乾、维运、运晟、运莱、运华、耘豪、星爵、星腾、星睿、星泽、星鹏、星然、震轩、震博、康震、震博、振强、振博、振华、振锐、振凯、振海、振国、振平、昂然、昂雄、昂杰、昂熙、昌勋、昌盛、昌淼、昌茂、昌黎、昌燎、昌翰、晨朗、德明、德昌、德曜、范明、飞昂、高旻、晗日、昊然、昊天、昊苍、昊英、昊宇、昊嘉、昊明、昊伟、昊硕、昊磊、昊东、鸿晖、鸿朗、华晖、金鹏、晋鹏、敬曦、景明、景天、景浩、俊晖、君昊、昆琦、昆鹏、昆纬、昆宇、昆锐、昆卉、昆峰、昆颉、昆谊、昆皓、昆鹏、昆明、昆杰、昆雄、昆纶、鹏涛、鹏煊、曦晨、曦之、新曦、旭彬、旭尧、旭鹏、旭东、旭炎、炫明、宣朗、学智、轩昂、彦昌、曜坤、曜栋、曜文、曜曦、曜灿、曜瑞、智伟、智杰、智刚、智阳、昌勋、昌盛、昌茂、昌黎、昌燎、昌翰、晨朗、昂然、昂雄、昂杰、昂熙、范明、飞昂、高朗、高旻、德明、德昌、德曜、智伟、智杰、智刚、智阳、瀚彭、旭炎、宣朗、学智、昊然、昊天、昊苍、昊英、昊宇、昊嘉、昊明、昊伟、鸿朗、华晖、金鹏、晋鹏、敬曦、景明、景天、景浩、景行、景中、景逸、景彰、昆鹏、昆明、昆杰、昆雄、昆纶、鹏涛、鹏煊、景平、俊晖、君昊、昆琦、昆鹏、昆纬、昆宇、昆锐、昆卉、昆峰、昆颉、昆谊、轩昂、彦昌、曜坤、曜文、曜曦、曜灿、曜瑞、曦晨、曦之、新曦、鑫鹏、旭彬、旭尧、旭鹏、旭东、浩轩、浩瀚、浩慨、浩阔、鸿熙、鸿羲、鸿禧、鸿信、泽洋、泽雨、哲瀚、胤运、佑运、允晨、运恒、运发、云天、耘志、耘涛、振荣、振翱、中震、子辰、晗昱、瀚玥、瀚昂、瀚彭、景行、景中、景逸、景彰、绍晖、文景、曦哲、永昌、子昂、智宇、智晖、晗日、晗昱、瀚昂、昊硕、昊磊、昊东、鸿晖、绍晖、文昂、文景、曦哲、永昌、子昂、智宇、智晖、浩然、鸿运、辰龙、运珹、振宇、高朗、景平、鑫鹏、昌淼、炫明、昆皓、曜栋、文昂、恨桃、依秋、依波、香巧、紫萱、涵易、忆之、幻巧、水风、安寒、白亦、惜玉、碧春、怜雪、听南、念蕾、紫夏、凌旋、芷梦、凌寒、梦竹、千凡、采波、元冬、思菱、平卉、笑柳、雪卉、南蓉、谷梦、巧兰、绿蝶、飞荷、平安、芷荷、怀瑶、慕易、若芹、紫安、曼冬、寻巧、寄波、尔槐、以旋、初夏、依丝、怜南、傲菡、谷蕊、笑槐、飞兰、笑卉、迎荷、元冬、痴安、妙绿、觅雪、寒安、沛凝、白容、乐蓉、映安、依云、映冬、凡雁、梦秋、梦凡、秋巧、若云、元容、怀蕾、灵寒、天薇、翠安、乐琴、宛南、怀蕊、白风、访波、亦凝、易绿、夜南、曼凡、亦巧、青易。冰真、白萱、友安、海之、小蕊、又琴、天风、若松、盼菡、秋荷、香彤、语梦、惜蕊、迎彤、沛白、雁山、易蓉、雪晴、诗珊、春冬、又绿、冰绿、半梅、笑容、沛凝、映秋、盼烟、晓凡、涵雁、问凝、冬萱、晓山、雁蓉、梦蕊、山菡、南莲、飞双、凝丝、思萱、怀梦、雨梅、冷霜、向松、迎丝、迎梅、雅彤、香薇、以山、碧萱、寒云、向南、书雁、怀薇、思菱、忆文、翠巧、怀山、若山、向秋、凡白、绮烟、从蕾、天曼、又亦、从安、绮彤、之玉、凡梅、依琴、沛槐、又槐、元绿、安珊、夏之、易槐、宛亦、白翠、丹云、问寒、易文、傲易、青旋、思真、雨珍、幻丝、代梅、盼曼、妙之、半双、若翠、初兰、惜萍、初之、宛丝、寄南、小萍、静珊、千风、天蓉、雅青、寄文、涵菱、香波、青亦、元菱、翠彤、春海、惜珊、向薇、冬灵、惜芹、凌青、谷芹、雁桃、映雁、书兰、盼香、向山、寄风、访烟、绮晴、映之、醉波、幻莲、谷冬、傲柔、寄容、以珊、紫雪、芷容、书琴、寻桃、涵阳、怀寒、易云、代秋、惜梦、尔烟、谷槐、怀莲、夜山、芷卉、向彤、新巧、语海、灵珊、凝丹、小蕾、迎夏、慕卉、飞珍、冰夏、亦竹、飞莲、海白、元蝶、春蕾、怀绿、尔容、小玉、幼南、凡梦、碧菡、初晴、宛秋、傲旋、新之、凡儿、夏真、静枫、痴柏、恨蕊、乐双、念薇、靖雁、寄松、丹蝶、元瑶、冰蝶、念波、迎松、海瑶、乐萱、凌兰、曼岚、若枫、傲薇、凡灵、乐蕊、秋灵、谷槐、觅云、寻春、恨山、从寒、忆香、觅波、静曼、青寒、笑天、涵蕾、元柏、代萱、紫真、千青、雪珍、寄琴、绿蕊、醉柳、诗翠、念瑶、孤风、曼彤、怀曼、香巧、采蓝、芷天、尔曼、巧蕊、";
    
    NSArray *lastNames = [lastName componentsSeparatedByString:@","];
    NSArray *giveNames = [giveName componentsSeparatedByString:@"、"];
    
    CVFmdbHelper *model = [CVFmdbHelper shareDelegate];
    
    TestModel *modeltest = [[TestModel alloc]init];
    NSArray *nameArr = [CVGetIvarModel getClassPropertyName:[TestModel class]];
    for (NSInteger i = 0; i<300; i++) {
        
        int last = arc4random() % lastNames.count;
        int give = arc4random() % giveNames.count;
        
        modeltest.name = [lastNames[last] stringByAppendingString:giveNames[give]];
        modeltest.age = [NSString stringWithFormat:@"%d",arc4random()%30];
        modeltest.hobit = @"打波波";
        modeltest.gender = @"man";
        NSArray *valueArr = [CVGetIvarModel getPropertyValue:modeltest names:nameArr];
        [model addValueIntoTable:STUDENT vaules:valueArr];
    }
    
}
- (IBAction)getAction:(id)sender {
    CVFmdbHelper *model = [CVFmdbHelper shareDelegate];
    [model findDataFromDatabase:STUDENT result:^(NSArray *arr) {
        
    }];
}
- (IBAction)clearAction:(id)sender {
    CVFmdbHelper *model = [CVFmdbHelper shareDelegate];
    [model clearTable:STUDENT];
}
- (IBAction)deleteAction:(id)sender {
    CVFmdbHelper *model = [CVFmdbHelper shareDelegate];
    [model deleteFrom:STUDENT whereKey:@"age" isEqure:@"19"];
}
- (IBAction)getLikeAction:(id)sender {
    CVFmdbHelper *model = [CVFmdbHelper shareDelegate];
    [model findDataFromTable:STUDENT whereKey:@"name" like:@"云" result:^(NSArray *arr) {
        
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
