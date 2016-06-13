//
//  ViewController.m
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/8.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import "ViewController.h"
#import "VideoSelectViewController.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *creatVideoButton;
@property (weak, nonatomic) IBOutlet UIButton *myVideoButton;
@property (weak, nonatomic) IBOutlet UIButton *setButton;
@end

@implementation ViewController

+ (void)initialize{
    

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _creatVideoButton.layer.cornerRadius    =   30.0;
    _creatVideoButton.layer.masksToBounds   =   YES;
    _myVideoButton.layer.cornerRadius   =   30.0;
    _myVideoButton.layer.masksToBounds  =   YES;
    _setButton.layer.cornerRadius   =   15.0;
    _setButton.layer.masksToBounds  =   YES;
}

- (IBAction)buttonClicked:(UIButton*)sender {
    
    [self presentViewController:[[VideoSelectViewController alloc]init] animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
