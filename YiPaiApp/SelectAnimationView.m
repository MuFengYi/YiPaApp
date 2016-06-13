//
//  SelectAnimationView.m
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/9.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import "SelectAnimationView.h"

#define SPACINGWIDTH    30

@implementation SelectAnimationView
- (instancetype)initWithFrame:(CGRect)frame{
    self    =   [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor blackColor]];
        UIButton    *videoSelectButton  =   [UIButton buttonWithType:UIButtonTypeCustom];
        [videoSelectButton setTitle:@"视频" forState:UIControlStateNormal];
        [videoSelectButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        [videoSelectButton setFrame:CGRectMake(SPACINGWIDTH, 0, (VIEWWIDTH-2*SPACINGWIDTH)/3, VIEWHEIGT-2)];
        videoSelectButton.tag   =   1;
        [videoSelectButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:videoSelectButton];
        
        UIView  *lineView   =   [[UIView alloc]initWithFrame:CGRectMake(SPACINGWIDTH, VIEWHEIGT-2, (VIEWWIDTH-2*SPACINGWIDTH)/3, 2)];
        lineView.tag    =   3;
        [lineView setBackgroundColor:[UIColor orangeColor]];
        [self addSubview:lineView];
        
        UIButton *photoSelectButton =   [UIButton buttonWithType:UIButtonTypeCustom];
        [photoSelectButton setTitle:@"照片" forState:UIControlStateNormal];
        [photoSelectButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        photoSelectButton.tag   =   2;
        [photoSelectButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [photoSelectButton setFrame:CGRectMake(VIEWWIDTH-(VIEWWIDTH-2*SPACINGWIDTH)/3-SPACINGWIDTH, 0, (VIEWWIDTH-2*SPACINGWIDTH)/3, VIEWHEIGT)];
        [self addSubview:photoSelectButton];
    }
    return self;
}

- (void)clickButton:(UIButton*)button{
    
    UIButton    *videoButton    =   [self viewWithTag:1];
    UIButton    *photoButton    =   [self viewWithTag:2];
    UIView      *lineView       =   [self viewWithTag:3];
    
    if (button.tag==1) {
        [UIView animateWithDuration:0.5 animations:^{
            [videoButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [photoButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [lineView setFrame:CGRectMake(SPACINGWIDTH, VIEWHEIGT-2, (VIEWWIDTH-2*SPACINGWIDTH)/3, 2)];
        }completion:^(BOOL finished){
            
           
            
            
        }];
    }else{
        
        [UIView animateWithDuration:0.5 animations:^{
            [photoButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [videoButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            [lineView setFrame:CGRectMake(VIEWWIDTH-(VIEWWIDTH-2*SPACINGWIDTH)/3-SPACINGWIDTH, VIEWHEIGT-2, (VIEWWIDTH-2*SPACINGWIDTH)/3, 2)];
        }completion:^(BOOL finished){
            
            
            
            
        }];
        
        
    }
    
    _block(button.tag);
}

- (void)clikButtontag:(NSInteger)buttonTag;{
    
    UIButton    *clickButton    =   [self viewWithTag:buttonTag];
    
    [self clickButton:clickButton];
}
@end
