//
//  Card.h
//  Matchismo
//
//  Created by Scott Barr on 02/02/2013.
//  Copyright (c) 2013 Scott Barr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;

@end