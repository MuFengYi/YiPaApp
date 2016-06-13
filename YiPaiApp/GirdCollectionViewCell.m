//
//  GirdCollectionViewCell.m
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/9.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import "GirdCollectionViewCell.h"

@implementation GirdCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _isSelected =   NO;
    _mask   =   [CALayer layer];
    [_mask setBackgroundColor:[UIColor orangeColor].CGColor];
    [_mask setOpacity:0.5];
    _mask.cornerRadius   =   5.0;
    [self.girdImage.layer setMasksToBounds:YES];
}
- (void)showLayer{
    [UIView animateWithDuration:0.5 animations:^(){
        _mask.frame  =   CGRectZero;
    }completion:^(BOOL finished){
        _mask.frame = self.girdImage.bounds;
    }];
    [self.girdImage.layer addSublayer:_mask];
}
- (void)dismisLayer{
    
    [UIView animateWithDuration:0.5 animations:^(){
        _mask.frame = self.girdImage.bounds;
    }completion:^(BOOL finished){
        _mask.frame  =   CGRectZero;
    }];
    [_mask removeFromSuperlayer];
}


@end
