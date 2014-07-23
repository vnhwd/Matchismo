//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by MROtis on 14-7-22.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)count
                      playingDeck:(Deck *)deck;

- (Card *)getCardAtIndex:(NSUInteger)index;
- (void)chooseCardAtIndex:(NSUInteger)index;

@property (nonatomic,readonly)NSInteger score;

@end
