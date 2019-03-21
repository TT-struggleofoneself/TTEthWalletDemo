//
//  WordCreateVC.m
//  CCTEthereum
//
//  Created by 田淘 on 2019/3/18.
//  Copyright © 2019年 Helios. All rights reserved.
//

#import "WordCreateVC.h"

#import "NSString+MnemonicWord.h"
#import "CCTEtherLib.h"

@interface WordCreateVC ()

@property (weak, nonatomic) IBOutlet UITextView *wordText;
@property (weak, nonatomic) IBOutlet UITextField *pwdTFD;
@property (weak, nonatomic) IBOutlet UITextView *textV;

@end

@implementation WordCreateVC

- (void)viewDidLoad {
    [super viewDidLoad];
}


///助记词自动生成
- (IBAction)wordBuildClick:(id)sender {
    //生成助记词DEMO
    NSString *mnemonicString = [NSString generateMnemonicString:@128 language:@"english"];
    
    self.wordText.text=mnemonicString;
    NSLog(@"自动生成的助记词：%@",mnemonicString);
    
}


///创建钱包
- (IBAction)createClick:(id)sender {
    
    NSString * word_txt=self.wordText.text;
    NSString* pwd_txt=self.pwdTFD.text;
    
    if(pwd_txt.length==0){
        NSLog(@"请输入密码");
        return;
    }
    
    if(word_txt.length==0){
        NSLog(@"请输入密码");
        return;
    }
    
    
    //通过助记词创建钱包
    [CCTEtherLib importWalletWithMnemonic:word_txt pwd:pwd_txt resultBlock:^(NSString *address, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey, BOOL suc, CCTEtherError error) {
        self.textV.text = [NSString stringWithFormat:@"【钱包地址address】%@\n\n【keyStore】%@\n\n【助记词mnemonicPhrase】%@\n\n【私钥privateKey】%@\n",address,keyStore,mnemonicPhrase,privateKey];
        
        NSLog(@"创建钱包所设置的密码：%@ \n",pwd_txt);
        NSLog(@"%@ \n",address);
        NSLog(@"%@ \n",keyStore);
        NSLog(@"%@ \n",mnemonicPhrase);
        NSLog(@"%@ \n",privateKey);
    }];
    
//    [CCTEtherLib createWalletWithPwd:@"12345678" resultBlock:^(NSString *addStr, NSString *keyStore, NSString *mnemonicPhrase, NSString *privateKey) {
//
//        self.textV.text = [NSString stringWithFormat:@"【钱包地址address】%@\n\n【keyStore】%@\n\n【助记词mnemonicPhrase】%@\n\n【私钥privateKey】%@\n",addStr,keyStore,mnemonicPhrase,privateKey];
//
//        NSLog(@"%@ \n",addStr);
//        NSLog(@"%@ \n",keyStore);
//        NSLog(@"%@ \n",mnemonicPhrase);
//        NSLog(@"%@ \n",privateKey);
//    }];
    
}



@end
