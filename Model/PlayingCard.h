//
//  PlayingCard.h
//  Matchismo
//
//  Created by Scott Barr on 02/02/2013.
//  Copyright (c) 2013 Scott Barr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
