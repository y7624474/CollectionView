//
//  ViewController.m
//  Collectionview
//
//  Created by TWer  on 9/9/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame=CGRectMake(0, 40, 380, 710);
    UICollectionViewFlowLayout *flowLayout= [[UICollectionViewFlowLayout alloc]init];
    _collectionview=[[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
    [_collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    _collectionview.allowsMultipleSelection = YES;

    [_collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    _collectionview.dataSource=self;
    _collectionview.delegate=self;
    _collectionview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_collectionview];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:((1 * indexPath.row) / 255.0) green:((2 * indexPath.row)/255.0) blue:((3 * indexPath.row)/255.0) alpha:1.0f];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 100);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 30, 0, 30);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = {240,45};
    return size;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:@"header"   forIndexPath:indexPath];
    
    view.backgroundColor=[UIColor grayColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 30)];
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        label.text = [NSString stringWithFormat:@"header:%ld",(long)indexPath.section];
    }
    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        view.backgroundColor = [UIColor lightGrayColor];
        label.text = [NSString stringWithFormat:@"footer:%ld",indexPath.section];
    }
    [view addSubview:label];
    return view;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"s");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
