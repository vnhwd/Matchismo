//
//  PlayingCard.m
//  Matchismo
//
//  Created by MROtis on 14-7-21.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

+ (NSArray *)vaildSuits
{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

+ (NSArray *)vaildRanks
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",
             @"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [[self vaildRanks] count] - 1;
}

@synthesize suit = _suit;

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

- (void)setSuit:(NSString *)suit
{
    if ([[PlayingCard vaildSuits] containsObject:suit]) {
        _suit = suit;
    }
}


- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

- (NSString *)contents
{
    NSArray *rankString = [PlayingCard vaildRanks];
    return [rankString[self.rank] stringByAppendingString:self.suit];
}





@end
