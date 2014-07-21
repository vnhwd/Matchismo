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

@end

@implementation CardGameViewController
-(void)viewDidLoad
{
    [self setCardContent:self.cardButton];
}
-(void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipLable.text = [NSString stringWithFormat:@"Flipcount: %d",self.flipCount];
    NSLog(@"flipCount change to %d",self.flipCount);
}

-(NSString *)setRandomCard
{
    PlayingCardDeck *myDeck = [[PlayingCardDeck alloc]init];
    Card * randomCard = [myDeck drawRandomCard];
    return randomCard.contents;
}

- (IBAction)playCard:(UIButton *)sender
{
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else {
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [self setCardContent:sender];
    }
    
    self.flipCount++;
    
}

- (void) setCardContent:(UIButton *)sender
{
    NSString *cardContent = [self setRandomCard];
    [sender setTitle:cardContent forState:UIControlStateNormal];
    NSRange redP = [cardContent rangeOfString:@"♥︎"];
    NSRange redD = [cardContent rangeOfString:@"♦︎"];
    if (redD.location != NSNotFound || redP.location != NSNotFound) {
        [sender setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    }
    else
    {
        [sender  setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
}

@end
