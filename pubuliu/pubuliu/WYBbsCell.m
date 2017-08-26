//
//  WYBbsCell.m
//  FindGoods
//
//  Created by ios-022 on 2017/8/15.
//  Copyright © 2017年 ios-022. All rights reserved.
//

#import "WYBbsCell.h"
#import "UIImageView+WebCache.h"

@implementation WYBbsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setData:(GetpostsAll *)data
{
    _data = data;
    [self.img sd_setImageWithURL:[NSURL URLWithString:data.imgs[0]] placeholderImage:[UIImage imageNamed:@"xp"]];
////    [self.img sd_setImageWithURL:[NSURL URLWithString:data.imgs[0]] ]];
//    
//    self.text.text = data.titles;
//    [self.focus setTitle:data.CommenNumber forState:UIControlStateNormal];
//    [self.focus setTitle:data.PostsNumber forState:UIControlStateNormal];

}


@end
