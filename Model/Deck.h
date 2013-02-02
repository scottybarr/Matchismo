//
//  Deck.h
//  Matchismo
//
//  Created by Scott Barr on 01/02/2013.
//  Copyright (c) 2013 Scott Barr. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end