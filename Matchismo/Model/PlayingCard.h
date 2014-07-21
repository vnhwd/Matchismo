//
//  PlayingCard.h
//  Matchismo
//
//  Created by MROtis on 14-7-21.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong,nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)vaildSuits;
+ (NSArray *)vaildRanks;
+ (NSUInteger)maxRank;


@end
