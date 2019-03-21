//
//  GetBalanceVC.m
//  CCTEthereum
//
//  Created by Helios on 2019/2/18.
//  Copyright © 2019 Helios. All rights reserved.
//

#import "GetBalanceVC.h"
#import "CCTEtherLib.h"

@interface GetBalanceVC ()

@property (weak, nonatomic) IBOutlet UITextField *tokenText;
@property (weak, nonatomic) IBOutlet UITextField *addText;
@property (weak, nonatomic) IBOutlet UILabel *resultText;

@end

@implementation GetBalanceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"查询余额";
}

- (IBAction)getBalanceAction:(id)sender {
    
    /**
     完整的 CCTEtherLib 代码，请加微信：tiantaotaobao 收费400元（ETH+BTC全套库+Demo代码）
     代码里不明白的都可以问我，其他区块链相关的问题我们也都可以互相讨论，专注区块链开发，还希望交个朋友。
     **/
    
    _addText.text = @"0xe2283b84afc7d99b2a4511b2bf5eaa42678aff49";
 
    if (_addText.text.length == 0) {
        return;
    }
    
    //NSArray *tokenArr = [NSArray arrayWithObject:_tokenText.text];
    //如果是查询ETH的余额，Tokens填nil就可以，如果是其他币种，则填写对应币种的token
    [CCTEtherLib getBalanceWithTokens:nil withAddress:_addText.text resultblock:^(NSArray *banlanceArr, BOOL suc) {
        
        if(suc){
            
            //注意：这个查询结果是没有经过小数转换的，要转换一下
            //转换的思路：查询到的值要除以 1000000000000000000 ，保留十八位小数，不要用float、double处理，要用 NSDecimalNumber
            NSLog(@"查询结果:%@",banlanceArr);
            self.resultText.text = banlanceArr[0];
        }
    }];
}

@end
