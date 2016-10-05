//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by 徐俊扬 on 16/10/4.
//  Copyright © 2016年 徐俊扬. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck *)deck;

- (void)chooseCardAtIndex: (NSUInteger) index;
- (Card *)cardAtIndex: (NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
