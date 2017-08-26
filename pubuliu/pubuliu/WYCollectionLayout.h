//
//  WYCollectionLayout.h
//  pubuliu
//
//  Created by ios-022 on 2017/8/24.
//  Copyright © 2017年 ios-022. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef CGFloat(^HeightBlock) (NSIndexPath *indexPath , CGFloat width);

@interface WYCollectionLayout : UICollectionViewLayout


/**
 列数
 */
@property(nonatomic,assign) NSInteger lineNumber;

/**
 行间距
 */
@property(nonatomic,assign) CGFloat rowSpacing;

/**
 列间距
 */
@property(nonatomic,assign) CGFloat lineSpacing;

/**
 内边距
 */
@property(nonatomic,assign) UIEdgeInsets sectionInset;


/**
 对象方法

 @param block 在block中最后要返回一个item的高度
 */
-(void)computeIndexCellHeightWithWidthBlock:(CGFloat(^)(NSIndexPath *indexPath , CGFloat width))block;

















@end
