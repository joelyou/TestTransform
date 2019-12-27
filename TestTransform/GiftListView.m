//
//  GiftListView.m
//  TestOUBI
//
//  Created by 陈微 on 2019/11/26.
//  Copyright © 2019 陈微. All rights reserved.
//

#import "GiftListView.h"
#import "GiftCollectionCell.h"

@interface GiftListView ()

@property (nonatomic, weak) IBOutlet UICollectionView *giftCollectionView;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint *collectionViewWidth;

@property (nonatomic, copy) NSArray *giftListArr;

@end

@implementation GiftListView

+ (instancetype)creatGiftListView{
    GiftListView *listView = [[[NSBundle mainBundle] loadNibNamed:@"GiftListView" owner:nil options:nil] lastObject];
    [listView initData];
    return listView;
}

- (void)initData{
    [_giftCollectionView registerNib:[UINib nibWithNibName:@"GiftCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"GiftCollectionCell"];
    [_giftCollectionView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)setGiftListArr:(NSArray *)giftArr{
    _giftListArr = giftArr;
    [_giftCollectionView reloadData];
}

#pragma mark - ******** collection相关代理
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//返回元素个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;//_giftListArr.count;
}

//设置元素内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GiftCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GiftCollectionCell" forIndexPath:indexPath];
    return cell;
}

//设置元素大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(100 , 110);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 0, 10, 0);
}

//设置元素的行间隙
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0;
}

//设置头视图元素大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 0);
}

#pragma mark - ******** kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    CGSize newSize = [[change objectForKey:NSKeyValueChangeNewKey] CGSizeValue];
    _collectionViewWidth.constant = newSize.width;
}

@end
