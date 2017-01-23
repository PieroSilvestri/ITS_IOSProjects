//
//  ScoreTableViewController.h
//  TapChallange
//
//  Created by giacomo osso on 18/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ScoreTableViewDelegate <NSObject>

-(NSArray *)scoreTableViewFetchResults;

@end

@interface ScoreTableViewController : UITableViewController


// Strong perchè mi serve una referenza forte, rischio che il mio array si perda :(
@property (nonatomic, strong) NSArray *scoresArray;

// C'è un legame tra A e B finche uno esiste
@property (nonatomic, unsafe_unretained) id <ScoreTableViewDelegate> delegate;

@end
