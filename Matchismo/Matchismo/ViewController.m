//
//  ViewController.m
//  Matchismo
//
//  Created by 徐俊扬 on 16/10/4.
//  Copyright © 2016年 徐俊扬. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touchCardButton:(id)sender {
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex: chosenButtonIndex];
    [self updateUI];
    
}

- (void)updateUI
{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject: cardButton];
        Card *card = [self.game cardAtIndex: cardButtonIndex];
        [cardButton setTitle: [self titleForCard: card] forState: UIControlStateNormal];
        
        NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString: cardButton.currentTitle];
        UIColor *titleColor = [UIColor redColor];
        if([cardButton.currentTitle containsString: @"♠︎"] || [cardButton.currentTitle containsString: @"♣︎"]){
            titleColor = [UIColor blackColor];
        }
        [commentString addAttribute:NSForegroundColorAttributeName value: titleColor range:NSMakeRange(0, [commentString length])];
        [cardButton setAttributedTitle: commentString forState: UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard: card] forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat: @"Score: %d", self.game.score];
    }
}

- (NSString *)titleForCard: (Card *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard: (Card *)card
{
    return [UIImage imageNamed: card.isChosen ? @"cardfront" : @"cardback"];
}

-(CardMatchingGame *) game
{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount: [self.cardButtons count] usingDeck: [self createDeck]];
    }
    
    return _game;
}


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}


@end
