//
//  ViewController.h
//  UICollectionViewSample
//
//  Created by moriiimo on 2013/11/08.
//  Copyright (c) 2013年 moriiimo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionViewCommon.h"
#import "PSTCollectionViewFlowLayout.h"

@interface ViewController : UIViewController<PSTCollectionViewDelegate, PSTCollectionViewDataSource, PSTCollectionViewDelegateFlowLayout>

@end
