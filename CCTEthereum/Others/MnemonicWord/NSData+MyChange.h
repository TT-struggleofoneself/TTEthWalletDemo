//
//
//
//
//  Created by 田淘 on 2019/3/14.
//

#import <Foundation/Foundation.h>

@interface NSData (MyChange)

//将字符串转换为16进制
- (NSString *)my_hexString;

//16进制转换为比特数组
- (NSArray *)my_hexToBitArray;

@end
