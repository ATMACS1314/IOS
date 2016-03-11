//
//  SecondViewController.m
//  userDefaultsDemo
//
//  Created by baiheng on 16/3/8.
//  Copyright © 2016年 baiheng. All rights reserved.
//

#import "SecondViewController.h"
#import "Constants.h"


@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *engineSwitch;
@property (weak, nonatomic) IBOutlet UISlider *warpFactorSlider;

@end

@implementation SecondViewController

-(void)refreshFields
{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    self.engineSwitch.on = [defaults boolForKey:kWarpDriveKey];
    
    self.warpFactorSlider.value = [defaults floatForKey:kWarpFactorKey];
    
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self refreshFields];
    
}
- (IBAction)engineSwitchTapped:(id)sender {
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    //设置用户设置
    [defaults setBool:self.engineSwitch.on forKey:kWarpDriveKey];
    
    [defaults synchronize];

    
}
- (IBAction)warpSliderTouched:(id)sender {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:self.warpFactorSlider.value forKey:kWarpFactorKey];
    [defaults synchronize];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonPressed:(id)sender {
    
    //打开应用设置
    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
    
}

@end
