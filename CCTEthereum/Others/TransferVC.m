//
//  TransferVC.m
//  CCTEthereum
//
//  Created by Helios on 2019/2/19.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "TransferVC.h"
#import "CCTEtherLib.h"

@interface TransferVC ()

@end

@implementation TransferVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"转账";
}

- (IBAction)transferBtnAction:(id)sender {
    
    /**
     完整的 CCTEtherLib 代码，请加微信：tiantaotaobao 收费600元（ETH+BTC全套库+Demo代码）
     代码里不明白的都可以问我，其他区块链相关的问题我们也都可以互相讨论，专注区块链开发，还希望交个朋友。
     **/
    NSString* keystore=@"{\"version\":3,\"id\":\"6229B92D-124A-4ED0-93E4-FE6180C4BC75\",\"x-ethers\":{\"gethFilename\":\"UTC--2019-03-18T11-36-20.0Z--30cfe84083a636f928719456086aa02556c4c7c2\",\"mnemonicCiphertext\":\"a4242317c29547c337a25eae364aad83\",\"mnemonicCounter\":\"b437fd047e6059978a4821afee42fe44\",\"client\":\"ethers\\/iOS\",\"version\":\"0.1\"},\"Crypto\":{\"ciphertext\":\"d557639d9fe162c3fdb25b77a3a2691adff08a88a6a4a6ed51c8770ec31b2e21\",\"cipherparams\":{\"iv\":\"67eb66e81d7f719f6d5c449728325c72\"},\"kdf\":\"scrypt\",\"kdfparams\":{\"r\":8,\"p\":1,\"n\":262144,\"dklen\":32,\"salt\":\"2c642a95926fd3a01cd58db783fcb1777ebef9018363223f93c510e75ad85634\"},\"mac\":\"84b4f226f77e7a3d18d17400dbd4f15e94ad78d620e3593d0ce04406753ce53a\",\"cipher\":\"aes-128-ctr\"},\"address\":\"30cfe84083a636f928719456086aa02556c4c7c2\"}";
    NSString* pass=@"111111";
    
    [CCTEtherLib transferToAssress:@"0xaf892426576c004c723a638dfc9d25d94f7b78a8" //收款地址
                             Money:@"10" //转账金额
                             Token:nil //eth填nil，其他代币填对应的token
                      DecimalCount:@"18" //小数位数
                   currentKeyStore:keystore //付款钱包的KeyStore
                               pwd:pass //付款钱包的密码
                          GasPrice:@"0.0006" //矿工费用，不填则自动获取
                          GasLimit:@"21000" //eth转账一般填21000  其他代币转账填60000   nil 默认 21000
                       Resultblock:^(NSString *hashStr, BOOL suc, CCTEtherError error) {
        
                           if(suc){
                               NSLog(@"成功！ 转账hash: %@",hashStr);
                           }else{
                               NSLog(@"失败！ %d",(short)error);
                           }
                          }];
}

@end
