//
//  CardGameViewController.m
//  Matchismo
//
//  Created by MROtis on 14-7-18.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipLable;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UIButton *cardButton;
@property (strong,nonatomic) Deck *myDeck;

@end

@implementation CardGameViewController

- (Deck *)myDeck
{
    if(!_myDeck) _myDeck = [self createDeck];
    return _myDeck;
}

-(Deck *)createDeck
{
    return [[PlayingCardDeck alloc]init];
}

-(void)viewDidLoad
{
    
}
-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipLable.text = [NSString stringWithFormat:@"Flipcount: %d",self.flipCount];
    NSLog(@"flipCount change to %d",self.flipCount);
}

- (IBAction)playCard:(UIButton *)sender
{
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
        self.flipCount++;
        
    }
    else {
        Card *randomCard = [self.myDeck drawRandomCard];
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                              forState:UIControlStateNormal];
            NSString *cardContent = randomCard.contents;
            [sender setTitle:cardContent forState:UIControlStateNormal];
            NSRange redP = [cardContent rangeOfString:@"♥️"];
            NSRange redD = [cardContent rangeOfString:@"♦️"];
            if (redD.location != NSNotFound || redP.location != NSNotFound) {
                [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            }
            else
            {
                [sender  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
            self.flipCount++;

        }
    }
 
}


@end
