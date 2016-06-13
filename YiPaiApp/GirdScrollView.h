//
//  GirdScrollView.h
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/9.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FetchObject.h"
typedef void (^ScrollViewBlock)(BOOL direction);

@interface GirdScrollView : UIScrollView

@property   (nonatomic,copy)ScrollViewBlock   block;
@property   (nonatomic,assign)BOOL          isSelfScorll;
@property   (nonatomic,strong)NSMutableArray    *sourceVideoArray;
@property   (nonatomic,strong)NSMutableArray    *sourceImageArray;
@property   (nonatomic,strong)UICollectionView  *clollectionView;
@property   (nonatomic,strong)UICollectionView  *imageCollectionView;
@property   (nonatomic,strong)NSMutableArray    *selectArray;

@end
