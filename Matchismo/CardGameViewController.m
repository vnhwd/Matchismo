//
//  CardGameViewController.m
//  Matchismo
//
//  Created by MROtis on 14-7-18.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (strong,nonatomic) Deck *myDeck;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong,nonatomic) CardMatchingGame *matchingGame;
@end

@implementation CardGameViewController

- (Deck *)myDeck
{
    if(!_myDeck) _myDeck = [self createDeck];
    return _myDeck;
}

- (CardMatchingGame *)matchingGame
{
    if(!_matchingGame) _matchingGame = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] playingDeck:[self createDeck]];
    return _matchingGame;
}

- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

- (void)viewDidLoad
{
    
}

- (IBAction)playCard:(UIButton *)sender
{
    NSUInteger chosenIndex = [self.cardButtons indexOfObject:sender];
    [self.matchingGame chooseCardAtIndex:chosenIndex];
    [self updateUI];
    
}

- (void)updateUI
{
    for (UIButton *currentCardButton in self.cardButtons) {
        NSUInteger currentIndex = [self.cardButtons indexOfObject:currentCardButton];
        Card *currentCard = [self.matchingGame getCardAtIndex:currentIndex];
        [currentCardButton setTitle:[self cardTittle:currentCard] forState:UIControlStateNormal];
        [currentCardButton setBackgroundImage:[self backgroundImageForCard:currentCard] forState:UIControlStateNormal];
        currentCardButton.enabled = !currentCard.isMatched;
    }
    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d",(int)self.matchingGame.score];
}

- (UIImage *)backgroundImageForCard: (Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (NSString *)cardTittle: (Card *)card
{
    return card.isChosen ? card.contents : @"";
}



@end
