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
    } else {
        self.lastCardDrawnLabel.text = [NSString stringWithFormat:@"Last: N/A"];
    }
}

- (IBAction)flipCard:(UIButton *)sender {
    self.lastCard = _nextcard;
    if (!sender.isSelected) {
        _nextcard = [self.deck drawRandomCard].contents;
        [sender setTitle:_nextcard forState:UIControlStateSelected];
    }
    sender.selected = !sender.isSelected;
    self.flipCount++;
}

@end
