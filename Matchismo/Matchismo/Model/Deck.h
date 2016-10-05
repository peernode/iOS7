//
//  Deck.h
//  Matchismo
//
//  Created by 徐俊扬 on 16/10/4.
//  Copyright © 2016年 徐俊扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard:(Card *)card atTop:(BOOL)atTop;
- (void) addCard:(Card *)card;

- (Card*) drawRandomCard;

@end
