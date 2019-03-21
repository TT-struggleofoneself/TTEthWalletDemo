//
//
//
//
//  Created by 田淘 on 2019/3/14.
//

#import "NSString+MnemonicWord.h"


#import "NSData+MyChange.h"
#import "NSString+MyChange.h"

#import <CommonCrypto/CommonHMAC.h>
#import <CommonCrypto/CommonKeyDerivation.h>

@implementation NSString (MnemonicWord)




/**
 *  生成助记字符串
 *  strlength   指定的长度
 *  language    指定的语言 如：english
 */
+(NSString *)generateMnemonicString:(NSNumber *)strlength language:(NSString *)language
{
    //输入长度必须为128、160、192、224、256
    if([strlength integerValue] % 32 != 0)
    {
        [NSException raise:@"Strength must be divisible by 32" format:@"Strength Was: %@",strlength];
    }
    
    //创建比特数组
    NSMutableData *bytes = [NSMutableData dataWithLength:([strlength integerValue]/8)];
    
    //生成随机data
    int status = SecRandomCopyBytes(kSecRandomDefault, bytes.length, bytes.mutableBytes);
    
    //如果生成成功
    if(status == 0)
    {
        NSString *hexString = [bytes my_hexString];
        
        return [self mnemonicStringFromRandomHexString:hexString language:language];
    }
    else
    {
        [NSException raise:@"Unable to get random data!" format:@"Unable to get random data!"];
    }
    return nil;
}



/**
    *  16进制字符串生成助记词
    *  seed        需要生成的二进制
    *  language    指定的语言 如：english
*/
+ (NSString *)mnemonicStringFromRandomHexString:(NSString *)seed language:(NSString *)language
{
    //将16进制转换为NSData
    NSData *seedData = [seed my_dataFromHexString];
    
    //计算 sha256 哈希
    NSMutableData *hash = [NSMutableData dataWithLength:CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(seedData.bytes, (int)seedData.length, hash.mutableBytes);
    
    
    NSMutableArray *checkSumBits = [NSMutableArray arrayWithArray:[[NSData dataWithData:hash] my_hexToBitArray]];
    
    NSMutableArray *seedBits = [NSMutableArray arrayWithArray:[seedData my_hexToBitArray]];
    
    for(int i = 0 ; i < (int)seedBits.count / 32 ; i++)
    {
        [seedBits addObject:checkSumBits[i]];
    }
    
    NSString *path = [NSString stringWithFormat:@"%@/%@.txt",[[NSBundle mainBundle] bundlePath], language];
    NSString *fileText = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    NSArray *lines = [fileText componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    
    NSMutableArray *words = [NSMutableArray arrayWithCapacity:(int)seedBits.count / 11];
    
    for(int i = 0 ; i < (int)seedBits.count / 11 ; i++)
    {
        NSUInteger wordNumber = strtol([[[seedBits subarrayWithRange:NSMakeRange(i * 11, 11)] componentsJoinedByString:@""] UTF8String], NULL, 2);
        
        [words addObject:lines[wordNumber]];
    }
    
    return [words componentsJoinedByString:@" "];
    
}






@end
