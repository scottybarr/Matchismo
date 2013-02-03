//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Scott Barr on 01/02/2013.
//  Copyright (c) 2013 Scott Barr. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) NSString *lastCard;
@property (strong, nonatomic) NSString *nextcard;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *deck;
@property (weak, nonatomic) IBOutlet UILabel *lastCardDrawnLabel;

@end

@implementation CardGameViewController

- (PlayingCardDeck *)deck
{
    if (!_deck) {
        _deck = [[PlayingCardDeck alloc] init];
    }
    return _deck;
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

-(void)setLastCard:(NSString *)lastCard
{
    if (lastCard) {
        _lastCard = lastCard;
        self.lastCardDrawnLabel.text = [NSString stringWithFormat:@"Last: %@", self.lastCard];
        self.lastCardDrawnLabel.textColor = [self nextCardColor:(NSString *)_lastCard];
    } else {
        self.lastCardDrawnLabel.text = [NSString stringWithFormat:@"Last: N/A"];
    }
}

- (UIColor *)nextCardColor:(NSString *)nextcard
{
    if ([_nextcard rangeOfString:@"♥" ].location != NSNotFound || [_nextcard rangeOfString:@"♦"].location != NSNotFound)
    {
        return [UIColor redColor];
    }
    return [UIColor blackColor];
}

- (IBAction)flipCard:(UIButton *)sender {
    self.lastCard = _nextcard;
    UIColor *cardColor = nil;
    
    if (!sender.isSelected) {
        _nextcard = [self.deck drawRandomCard].contents;
        cardColor = [self nextCardColor:(NSString *) _nextcard];
        [sender setTitle:_nextcard forState:UIControlStateSelected];
        [sender setTitleColor:cardColor forState:UIControlStateSelected];
        
    }
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

@end
