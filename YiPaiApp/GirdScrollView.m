//
//  GirdScrollView.m
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/9.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import "GirdScrollView.h"
#import "GirdCollectionViewCell.h"

@interface GirdScrollView()<UIScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@end
@implementation GirdScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self    =   [super initWithFrame:frame];
    if (self) {
        self.delegate   =   self;
        self.pagingEnabled  =   YES;
        self.contentSize    =   CGSizeMake(VIEWWIDTH*3/2, VIEWHEIGT);
        _selectArray    =   [NSMutableArray array];
        [self loadCollectionView];
    }
    return self;
}

-   (void)loadCollectionView{
    UICollectionViewFlowLayout  *flowLayout =   [[UICollectionViewFlowLayout alloc]init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _clollectionView    =   [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, VIEWHEIGT) collectionViewLayout:flowLayout];
    _clollectionView.delegate   =   self;
    _clollectionView.dataSource =   self;
    [_clollectionView registerNib:[UINib nibWithNibName:@"GirdCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GirdCell"];
    [self addSubview:_clollectionView];
    
    _imageCollectionView    =   [[UICollectionView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, VIEWHEIGT) collectionViewLayout:flowLayout];
    _imageCollectionView.delegate   =   self;
    _imageCollectionView.dataSource =   self;
    [_imageCollectionView registerNib:[UINib nibWithNibName:@"GirdCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"GirdCell"];
    [self addSubview:_imageCollectionView];
}
#pragma mark collectionview delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 4;
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    if (collectionView==_clollectionView) {
        
        return  _sourceVideoArray.count/4;
    }else{
        
        return _sourceImageArray.count/4;
    }
}
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GirdCollectionViewCell  *girdCell   =   (GirdCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"GirdCell" forIndexPath:indexPath];
    if (collectionView==_clollectionView) {
        FetchObject  *fetchObject    =  [_sourceVideoArray objectAtIndex:indexPath.item+indexPath.section*4];
        girdCell.girdImage.image  =    fetchObject.thumbImage;
        girdCell.girdLabel.hidden   =   NO;
    }else{
        FetchObject  *fetchObject    =  [_sourceImageArray objectAtIndex:indexPath.item+indexPath.section*4];
        girdCell.girdImage.image  =    fetchObject.thumbImage;
        girdCell.girdLabel.hidden   =   YES;
    }
   
    return girdCell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
      return  CGSizeMake((SCREENWIDTH-20-15)/4, (SCREENWIDTH-20-15)/4);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5.f;
}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 10, 5, 10);//分别为上、左、下、右
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    GirdCollectionViewCell  *girdCell   =   (GirdCollectionViewCell*)[collectionView  cellForItemAtIndexPath:indexPath];
    
    if (!girdCell.isSelected) {
        [girdCell showLayer];
        girdCell.isSelected =   YES;
        [_selectArray addObject:[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row]];
    }else{
        [girdCell dismisLayer];
        girdCell.isSelected =   NO;
        [_selectArray removeObject:[NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row]];
    }

#pragma mark 注释 这里扩散动画暂时搁置 未完成
//    CAKeyframeAnimation    *basicAnimation =   [CAKeyframeAnimation animationWithKeyPath:@"fillImageAnimation"];
//    basicAnimation.duration =   0.8;
//    basicAnimation.path =  CFAutorelease(CGPathCreateWithEllipseInRect(cell.girdImage.bounds, NULL));
//    basicAnimation.fillMode =   kCAFillModeForwards;
//    basicAnimation.calculationMode = kCAAnimationCubic;
//    basicAnimation.rotationMode = kCAAnimationRotateAuto;
//    [mask addAnimation:basicAnimation forKey:@"animationfillimage"];
//    mask.frame = cell.girdImage.bounds;
}
#pragma mark 滚动减速即将停止的方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (_isSelfScorll) {
        if (self.contentOffset.x==SCREENWIDTH) {
            _block(YES);
        }else if (self.contentOffset.x==0){
            _block(NO);
        }
    }
}
#pragma mark滚动刚开始的时候
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    _isSelfScorll   =   YES;
}




@end
