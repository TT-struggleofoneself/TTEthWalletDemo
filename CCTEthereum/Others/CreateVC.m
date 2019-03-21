//
//  CreateVC.m
//  CCTEthereum
//
//  Created by Helios on 2019/2/18.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "CreateVC.h"
#import "CCTEtherLib.h"

/**
 完整的 CCTEtherLib 代码，请加微信：tiantaotaobao 收费400元（ETH+BTC全套库+Demo代码）
 代码里不明白的都可以问我，其他区块链相关的问题我们也都可以互相讨论，专注区块链开发，还希望交个朋友。
 **/

@interface CreateVC()

@property (weak, nonatomic) IBOutlet UITextView *textV;

@end

@implementation CreateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"创建";
}

- (IBAction)createBtnAction:(id)sender {
    
    //创建需要几秒钟，请不要着急
    [CCTEtherLib createWalletWithPwd:@"12345678" resultBlock:^(NSString *addStr, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
        
        self.textV.text = [NSString stringWithFormat:@"【钱包地址address】%@\n\n【keyStore】%@\n\n【助记词mnemonicPhrase】%@\n\n【私钥privateKey】%@\n",addStr,keyStore,mnemonicPhrase,privateKey];
        
        NSLog(@"%@ \n",addStr);
        NSLog(@"%@ \n",keyStore);
        NSLog(@"%@ \n",mnemonicPhrase);
        NSLog(@"%@ \n",privateKey);
    }];
}


@end
