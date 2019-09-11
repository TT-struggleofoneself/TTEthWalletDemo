//
//  ImportWithPkey.m
//  CCTEthereum
//
//  Created by Helios on 2019/2/18.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "ImportWithPkey.h"
#import "CCTEtherLib.h"

@interface ImportWithPkey ()

@property (weak, nonatomic) IBOutlet UITextField *textF;

@property (weak, nonatomic) IBOutlet UITextView *textV;

@end

@implementation ImportWithPkey

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通过私钥导入钱包";
}

- (IBAction)importBtnAction:(id)sender {
    
    /**
     完整的 CCTEtherLib 代码，请加微信：tiantaotaobao 收费600元（ETH+BTC全套库+Demo代码）
     代码里不明白的都可以问我，其他区块链相关的问题我们也都可以互相讨论，专注区块链开发，还希望交个朋友。
     **/
    
    _textF.text = @"0x5b54e1332c0dc45c77e9068eb449c80785d2224b17af4d1752e706aa10a1c79a";
    
    if(_textF.text.length == 0){
        return;
    }
    
    [CCTEtherLib importWalletWithPrivateKey:self.textF.text pwd:@"12345678" resultblock:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey, BOOL suc, CCTEtherError error) {

        if(suc){
            self.textV.text = [NSString stringWithFormat:@"【钱包地址address】%@\n\n【keyStore】%@\n\n【助记词mnemonicPhrase】%@\n\n【私钥privateKey】%@\n",address,keyStore,mnemonicPhrase,privateKey];
        }else{
            NSLog(@"导入失败  %ld",(long)error);
        }
    }];
}


@end
