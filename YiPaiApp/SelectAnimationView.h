//
//  SelectAnimationView.h
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/9.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickBlock)(NSInteger buttonTag);
@interface SelectAnimationView : UIView

- (void)clikButtontag:(NSInteger)buttonTag;
@property   (nonatomic,copy)ClickBlock  block;

@end
