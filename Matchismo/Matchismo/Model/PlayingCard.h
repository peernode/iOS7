//
//  PlayingCard.h
//  Matchismo
//
//  Created by 徐俊扬 on 16/10/4.
//  Copyright © 2016年 徐俊扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSUInteger) maxRank;

@end
