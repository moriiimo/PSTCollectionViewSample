//
//  CustomCell.h
//  CollectionViewExample
//
//  Created by Tim on 9/5/12.
//  Copyright (c) 2012 Charismatic Megafauna Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSTCollectionViewCell.h"

@interface CustomCell : PSTCollectionViewCell
@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@end
