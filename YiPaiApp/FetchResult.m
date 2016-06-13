//
//  FetchResult.m
//  YiPaiApp
//
//  Created by 易 彬锋 on 16/6/8.
//  Copyright © 2016年 bfy. All rights reserved.
//

#import "FetchResult.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>

@implementation FetchResult
+ (FetchResult*)shareResult
{
    static  FetchResult *fetchResult    =   nil;
    static  dispatch_once_t once_t;
    dispatch_once(&once_t, ^{
        fetchResult =   [[FetchResult alloc]init];
    });
    return fetchResult;
}

#pragma mark if have authstatus
- (BOOL)authStatus
{
    ALAuthorizationStatus author = [ALAssetsLibrary authorizationStatus];
    
    if(author   ==  ALAuthorizationStatusRestricted ||author    ==  ALAuthorizationStatusDenied){
        
        //无权限
        return NO;
        
    }else{
        
        return YES;
    }
}

- (void)getVideoArray
{
        NSMutableArray  *videoArray =   [NSMutableArray array];
        NSMutableArray  *imageArray =   [NSMutableArray array];
        ALAssetsLibrary *libarary   =   [[ALAssetsLibrary alloc]init];
        [libarary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop){
            
            NSLog(@"goup==%@",group);
            
            if (group!=nil) {
                
                [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger xxindex, BOOL *xxstop) {
                    if ([result valueForProperty:ALAssetPropertyType]==ALAssetTypeVideo){
                        
                        FetchObject *fetchObject    =   [[FetchObject alloc]init];
                        fetchObject.thumbImage  =   [UIImage imageWithCGImage:result.thumbnail];
                        fetchObject.fileUr   =  [result defaultRepresentation].url;
                         NSLog(@"videoDuration==%@",[result valueForProperty:ALAssetPropertyDuration]);
                        fetchObject.videoDuration   =  [result valueForProperty:ALAssetPropertyDuration];
                        [videoArray addObject:fetchObject];
                       
                    }else if ([result valueForProperty:ALAssetPropertyType]==ALAssetTypePhoto)
                    {
                        FetchObject *fetchObject    =   [[FetchObject alloc]init];
                        fetchObject.thumbImage  =   [UIImage imageWithCGImage:result.thumbnail];
                        fetchObject.fileUr   =  [result defaultRepresentation].url;
                        NSLog(@"videoDuration==%@",[result valueForProperty:ALAssetPropertyDuration]);
                        [imageArray addObject:fetchObject];
                    }
                
                }];
                
                
            }else{
                
                
                NSLog(@"group==nil");
                
                _block(videoArray,imageArray);
                
            }
            
            

            
        }failureBlock:^(NSError *error){
            
            NSLog(@"error=======%@",error);
            
        }];
    
    
}



@end
