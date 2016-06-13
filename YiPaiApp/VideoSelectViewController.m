//
//  VideoSelectViewController.m
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/8.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import "VideoSelectViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "FetchResult.h"
#import "FetchObject.h"
#import "SelectAnimationView.h"
#import "GirdScrollView.h"
@interface VideoSelectViewController ()
@property   (nonatomic,strong)NSMutableArray    *groupArray;
@end

@implementation VideoSelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    [self loadSubView];
}

- (void)loadSubView{
    UIButton    *closeButton    =   [UIButton buttonWithType:UIButtonTypeCustom];
    [closeButton setFrame:CGRectMake(10,10, 30, 30)];
    [closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [closeButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    closeButton.layer.cornerRadius  =   15;
    closeButton.layer.masksToBounds =   YES;
    [closeButton setBackgroundColor:[UIColor grayColor]];
    [closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeButton];
   
    UILabel *titleLabel =   [[UILabel alloc]initWithFrame:CGRectMake((SCREENWIDTH-100)/2, 10, 100, 30)];
    [titleLabel setText:@"相册"];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setTextColor:[UIColor whiteColor]];
    [self.view addSubview:titleLabel];
    
    UIButton    *takeVideoButton    =   [UIButton buttonWithType:UIButtonTypeCustom];
    [takeVideoButton setFrame:CGRectMake(SCREENWIDTH-10-30, 10, 30, 30)];
    [takeVideoButton.titleLabel setFont:[UIFont systemFontOfSize:12]];
    [takeVideoButton setTitle:@"摄像" forState:UIControlStateNormal];
    [takeVideoButton addTarget:self action:@selector(takeVideoAction) forControlEvents:UIControlEventTouchUpInside];
    [takeVideoButton setBackgroundColor:[UIColor grayColor]];
    takeVideoButton.layer.cornerRadius  =   15;
    takeVideoButton.layer.masksToBounds =   YES;
    [self.view addSubview:takeVideoButton];
    
    SelectAnimationView *selectAnimationView    =   [[SelectAnimationView alloc]initWithFrame:CGRectMake(0, 50, SCREENWIDTH, 52)];
    [self.view addSubview:selectAnimationView];
    
   
    
    GirdScrollView  *girdView   =   [[GirdScrollView alloc]initWithFrame:CGRectMake(0, 103, 2*SCREENWIDTH, SCREENHEIGHT-103)];
    girdView.sourceImageArray    =   [NSMutableArray array];
    girdView.sourceVideoArray    =   [NSMutableArray array];
    [self.view addSubview:girdView];
    [girdView setBlock:^(BOOL direction){
        if (direction) {
            [selectAnimationView clikButtontag:2];
            
        }else{
            
            [selectAnimationView clikButtontag:1];
        }
    }];
    
    [selectAnimationView setBlock:^(NSInteger buttonTag){
        girdView.isSelfScorll   =   NO;
        [girdView setContentOffset:CGPointMake(SCREENWIDTH * (buttonTag-1), 0) animated:YES];
    }];
    
    [[FetchResult shareResult] setBlock:^(NSMutableArray *videoArray,NSMutableArray *imageArray){
        girdView.sourceVideoArray =    videoArray;
        girdView.sourceImageArray =  imageArray;
        [girdView.clollectionView reloadData];
    }];
    
    [[FetchResult shareResult] getVideoArray];
}


- (void)closeAction{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)takeVideoAction{
    
    
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    if (![[FetchResult shareResult] authStatus]) {
        UIAlertController   *alertController    =   [UIAlertController alertControllerWithTitle:@"无访问权限" message:@"易拍大师没有获得系统权限，无法访问照片，您可以在“设置-隐私-照片”中开启美拍大师的照片访问权限。" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction   *cancleAction   =   [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
           
            
        }];
        
        UIAlertAction   *setAction  =   [UIAlertAction actionWithTitle:@"去设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        
        [alertController addAction:cancleAction];
        [alertController addAction:setAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

- (BOOL)prefersStatusBarHidden{
    
    return YES;
}
@end
