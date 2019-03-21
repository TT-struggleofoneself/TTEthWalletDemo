//
// 
//
//
//  Created by 田淘 on 2019/3/14.
//

#import <Foundation/Foundation.h>




NS_ASSUME_NONNULL_BEGIN
///字符串生成助记词的分类
@interface NSString (MnemonicWord)




/**
 *  16进制字符串生成助记词
 *  seed        需要生成的二进制
 *  language    指定的语言 如：english 文件地址    english.txt 支持：简体中文、繁体中文、英文、法文、意大利文、日文、韩文、西班牙文
 */
+ (NSString *)mnemonicStringFromRandomHexString:(NSString *)seed language:(NSString *)language;


/**
 *  生成助记字符串
 *  strlength   指定的长度
 *  language    指定的语言 如：english 文件地址    english.txt 支持：简体中文、繁体中文、英文、法文、意大利文、日文、韩文、西班牙文
 */
+(NSString *)generateMnemonicString:(NSNumber *)strlength language:(NSString *)language;




@end

NS_ASSUME_NONNULL_END
