//
//  WYBbsCell.h
//  FindGoods
//
//  Created by ios-022 on 2017/8/15.
//  Copyright © 2017年 ios-022. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetpostsAll.h"
@interface WYBbsCell : UICollectionViewCell

@property(nonatomic,weak)IBOutlet UIImageView *img;

@property(nonatomic,weak)IBOutlet UILabel *text;
@property(nonatomic,weak)IBOutlet UIButton *status;
@property(nonatomic,weak)IBOutlet UIButton *focus;
@property(nonatomic,weak)IBOutlet UIButton *discuss;

@property(nonatomic,strong)GetpostsAll *data;


@end
