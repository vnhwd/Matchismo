//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by MROtis on 14-7-22.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite)NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards; //of Card
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count playingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *randomCard = [deck drawRandomCard];
            if (randomCard) {
                [self.cards addObject:randomCard];
            } else {
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *)getCardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]) ? self.cards[index] : nil;
}


- (void)chooseCardAtIndex:(NSUInteger)index
{
    Card *currentCard = [self getCardAtIndex:index];
    if (!currentCard.isMatched) {
        self.score -= 1;
        if (!currentCard.isChosen) {
            NSMutableArray *chosenCards = [[NSMutableArray alloc] init]; //of chosen Card
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    [chosenCards addObject:otherCard];
                    if ([chosenCards count] == 2) {
                        int matchScore = [currentCard match:chosenCards];
                        if (matchScore) {
                            currentCard.matched = YES;
                            for (Card *otherCard in chosenCards) {
                                otherCard.matched = YES;
                            }
                            self.score += matchScore;
                        } else {
                            currentCard.chosen = NO;
                            for (Card *otherCard in chosenCards) {
                                otherCard.chosen = NO;
                            }
                        }
                        break;
                    }
                }
            }
            if ([chosenCards count] != 2) {
                currentCard.chosen = YES;
            }
        } else {
            currentCard.chosen = NO;
        }
        
    }
    
}



@end
