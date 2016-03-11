//
//  FirstViewController.m
//  userDefaultsDemo
//
//  Created by baiheng on 16/3/8.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "FirstViewController.h"
#import "Constants.h"



@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *officerLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorizationCodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpDriveLabel;
@property (weak, nonatomic) IBOutlet UILabel *warpFactorLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteTeaLabel;

@property (weak, nonatomic) IBOutlet UILabel *favoriteCaptainLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteGadgetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteAlienLabel;



@end

@implementation FirstViewController

-(void)refreshFields
{
    //用户设置单例
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    //读取各个设置项目
    self.officerLabel.text = [defaults objectForKey:kOfficerKey];
    self.authorizationCodeLabel.text = [defaults objectForKey:kAuthorizationCodeKey];
    self.rankLabel.text = [defaults objectForKey:kRankKey];
    
    self.warpDriveLabel.text = [defaults boolForKey:kWarpDriveKey]?@"可用":@"不可用";
    self.warpFactorLabel.text = [[defaults objectForKey:kWarpFactorKey]stringValue];
    
    self.favoriteTeaLabel.text = [defaults objectForKey:kFavoriteTeakKey];
    self.favoriteCaptainLabel.text = [defaults objectForKey:kFavoriteCaptainKey];
    self.favoriteGadgetLabel.text = [defaults objectForKey:kFavoriteGadgetKey];
    self.favoriteAlienLabel.text = [defaults objectForKey:kFavoriteAlienKey];
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshFields];
    
    UIApplication * app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
    
    //secondViewController中做同样的事情
    
    
}

-(void)applicationWillEnterForeground:(NSNotification *)notification
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
   //保存更改
    [defaults synchronize];
   //刷新字段
    [self refreshFields];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
