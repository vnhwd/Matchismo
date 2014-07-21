//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by MROtis on 14-7-21.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard vaildSuits]) {
            for (NSUInteger rank=1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                if (![self.cards count]) {
                    [self addCard:card atTop:YES];
                }
                else
                {
                    [self addCard:card];
                } 
            }
        }
    }
    
    return self;
}


@end
