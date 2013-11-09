//
//  ViewController.m
//  PSTCollectionViewSample
//
//  Created by moriiimo on 2013/11/08.
//  Copyright (c) 2013年 moriiimo. All rights reserved.
//

#import "ViewController.h"
#import "PSTCollectionView.h"
#import "CustomCell.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet PSTCollectionView *pstCollectionView;
@property (nonatomic, strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pstCollectionView.delegate = self;
    self.pstCollectionView.dataSource = self;
    
    // Create data for collection views
    NSMutableArray *firstSection = [[NSMutableArray alloc] init];
    NSMutableArray *secondSection = [[NSMutableArray alloc] init];

    for (int i=0; i<50; i++) {
        [firstSection addObject:[NSString stringWithFormat:@"Cell %d", i]];
        [secondSection addObject:[NSString stringWithFormat:@"item %d", i]];
    }

    self.dataArray = [[NSArray alloc] initWithObjects:firstSection, secondSection, nil];

    /* Uncomment this block to use nib-based cells */
    //UINib *cellNib = [UINib nibWithNibName:@"NibCell" bundle:nil];
    //[self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"customCell"];
    /* end of nib-based cells block */

    /* uncomment this block to use subclassed cells */
    UINib *cellNib = [UINib nibWithNibName:@"CustomCell" bundle:nil];
    [self.pstCollectionView registerNib:cellNib forCellWithReuseIdentifier:@"customCell"];
    /* end of subclass-based cells block */

    // Configure layout
    PSTCollectionViewFlowLayout *flowLayout = [[PSTCollectionViewFlowLayout alloc] init];
    [flowLayout setItemSize:CGSizeMake(90, 90)];
    [flowLayout setScrollDirection:PSTCollectionViewScrollDirectionVertical];
    [self.pstCollectionView setCollectionViewLayout:flowLayout];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.pstCollectionView = nil;
    self.dataArray = nil;
}


- (NSInteger)numberOfSectionsInCollectionView:(PSTCollectionView *)collectionView {
    return [self.dataArray count];
}

- (NSInteger)collectionView:(PSTCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    NSMutableArray *sectionArray = [self.dataArray objectAtIndex:(NSUInteger) section];
    return [sectionArray count];

}



- (CustomCell *)collectionView:(PSTCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    // Setup cell identifier
    static NSString *cellIdentifier = @"customCell";
    CustomCell * cell = (CustomCell *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    NSMutableArray *data = [self.dataArray objectAtIndex:(NSUInteger) indexPath.section];
    NSString *cellData = [data objectAtIndex:(NSUInteger) indexPath.row];
    cell.titleLabel.text = cellData;
    /* end of subclass-based cells block */

    // Return the cell
    return cell;
}


@end
