//
//  ViewController.h
//  Collectionview
//
//  Created by TWer  on 9/9/15.
//  Copyright (c) 2015 TWer . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property UICollectionView *collectionview;
@end

