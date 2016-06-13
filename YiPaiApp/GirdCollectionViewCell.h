//
//  GirdCollectionViewCell.h
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/9.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GirdCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *girdImage;
@property (weak, nonatomic) IBOutlet UILabel *girdLabel;
@property (nonatomic,strong)CALayer *mask;
@property (nonatomic,assign)  BOOL  isSelected;
- (void)showLayer;
- (void)dismisLayer;

@end
