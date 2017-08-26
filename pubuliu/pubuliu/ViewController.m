//
//  ViewController.m
//  pubuliu
//
//  Created by ios-022 on 2017/8/19.
//  Copyright © 2017年 ios-022. All rights reserved.
//

#import "ViewController.h"
#import "WYBbsCell.h"
#import "WYCollectionLayout.h"
#import "AFNetworking.h"
#import "GetpostsAll.h"
#import "Tool_Answer.h"

#define SCREEN_WIDTH [[UIScreen mainScreen].bounds.size].width
#define SCREEN_HEIGHT [[UIScreen mainScreen].bounds.size].height

#define url @"http://apijava.gdswlw.com:88/salsa/posts/getpostsAll.do?token=535b0d65-0c70-48b5-ac30-14f6e61c330e&page=2"




static NSString *cellID = @"WYBbsCell";

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong) UICollectionView *collectionView;

@property(nonatomic,strong)WYCollectionLayout *layout;

@end

@implementation ViewController

{
    NSMutableArray *modelArray;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    modelArray = [NSMutableArray arrayWithCapacity:0];

    [self loadData];


    
}

-(void)loadData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
     [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *array = [responseObject[@"data"] mutableCopy];
        [array removeLastObject];

        for (NSDictionary *dic in array) {
            
            GetpostsAll *model = [[GetpostsAll alloc]init];
            
            
            model.CommenNumber = dic[@"CommenNumber"];
            model.PostsNumber  = dic[@"PostsNumber"];
            model.content      = dic[@"content"];
            model.demanid      = dic[@"demanid"];
            model.id      = dic[@"id"];
            model.imgs      = [Tool_Answer getAnswerWithString:dic[@"imgs"]];
            model.releasetime      = dic[@"releasetime"];
            model.state      = dic[@"state"];
            model.titles      = dic[@"titles"];
            model.uid      = dic[@"uid"];
            
            


            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.imgs.firstObject]];
            
            
            UIImage *image = [UIImage imageWithData:data];
            
            CGFloat image_width =120; CGFloat image_height=180;
            
            if (image) {
                image_width = image.size.width;
                image_height= image.size.height;
            }
            
            
            NSLog(@"w = %f,h = %f",image.size.width,image.size.height);
            
            model.width = [NSString stringWithFormat:@"%f",image_width];
            model.height = [NSString stringWithFormat:@"%f",image_height];
            
            [modelArray addObject:model];
        }
        
         [self _initCollictonview];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

-(void)_initCollictonview
{
    self.layout = [[WYCollectionLayout alloc]init];
    
    self.layout.lineNumber = 2;
    self.layout.rowSpacing = 5;
    self.layout.lineSpacing = 5;
    self.layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:self.layout];

    [self.collectionView registerNib:[UINib nibWithNibName:@"WYBbsCell" bundle:nil] forCellWithReuseIdentifier:cellID];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellID];
    
    self.collectionView.delegate    = self;
    self.collectionView.dataSource  = self;
    
    [self.view addSubview:self.collectionView];
    
    
    
    [self.layout computeIndexCellHeightWithWidthBlock:^CGFloat(NSIndexPath *indexPath, CGFloat width) {
        
        
        

        
        GetpostsAll *model = modelArray[indexPath.row];
        CGFloat oldWidth = [model.width floatValue];
        CGFloat oldHeight = [model.height floatValue];
        
        CGFloat newWidth = width;
        
        
        CGFloat newHeigth = (oldHeight*newWidth) / oldWidth;
        
        NSLog(@"%f--%f==%f!!%f",oldWidth,oldHeight,newWidth,newHeigth);
        

        
       return newHeigth;
        
    }];
    
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return modelArray.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WYBbsCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
//    cell.backgroundColor    = [UIColor yellowColor];
    
    cell.data = modelArray[indexPath.row];
    
    return cell;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
