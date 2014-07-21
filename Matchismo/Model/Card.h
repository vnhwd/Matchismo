//
//  Card.h
//  Matchismo
//
//  Created by MROtis on 14-7-21.
//  Copyright (c) 2014年 MROtis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong,nonatomic) NSString *contents;

@property (nonatomic) BOOL chosen;
@property (nonatomic) BOOL matched;

- (int)match:(NSArray *)otherCards;



@end
