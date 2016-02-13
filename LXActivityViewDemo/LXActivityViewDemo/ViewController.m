//
//  ViewController.m
//  LXActivityViewDemo
//
//  Created by lixiang on 16/2/13.
//  Copyright © 2016年 lixiang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) int tapIndex;

@property (nonatomic, strong) LXActivity *activityView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tapIndex = 0;
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    [shareButton setTitle:@"分享" forState:UIControlStateNormal];
    [shareButton setBackgroundColor:[UIColor redColor]];
    [shareButton addTarget:self action:@selector(didClickOnShareButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];
}

- (void)didClickOnShareButton:(id)sender {
    NSArray *shareButtonTitleArray = [[NSArray alloc] init];
    NSArray *shareButtonImageNameArray = [[NSArray alloc] init];
    
    if (self.tapIndex == 0) {
        shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博",@"微信",@"微信朋友圈",@"Twitter"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1",@"sns_icon_22",@"sns_icon_23",@"sns_icon_11"];
        self.tapIndex++;
    }
    else if (self.tapIndex == 1){
        shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博",@"微信",@"微信朋友圈"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1",@"sns_icon_22",@"sns_icon_23"];
        self.tapIndex++;
    }
    else if (self.tapIndex == 2){
        shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博",@"微信"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1",@"sns_icon_22"];
        self.tapIndex++;
    }
    else if (self.tapIndex == 3){
        shareButtonTitleArray = @[@"短信",@"邮件",@"新浪微博"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18",@"sns_icon_1"];
        self.tapIndex++;
    }
    else if (self.tapIndex == 4){
        shareButtonTitleArray = @[@"短信",@"邮件"];
        shareButtonImageNameArray = @[@"sns_icon_19",@"sns_icon_18"];
        self.tapIndex++;
    }
    else if (self.tapIndex == 5){
        shareButtonTitleArray = @[@"短信"];
        shareButtonImageNameArray = @[@"sns_icon_19"];
        self.tapIndex = 0;
    }
    
    self.activityView = [[LXActivity alloc] initWithTitle:@"分享到社交平台" delegate:self cancelButtonTitle:@"取消" ShareButtonTitles:shareButtonTitleArray withShareButtonImagesName:shareButtonImageNameArray];
    [_activityView show];
}

#pragma mark - LXActivityDelegate

- (void)didClickOnImageIndex:(NSInteger *)imageIndex {
    NSLog(@"%d",(int)imageIndex);
}

- (void)didClickOnCancelButton {
    NSLog(@"didClickOnCancelButton");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
