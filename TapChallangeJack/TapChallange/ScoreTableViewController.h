//
//  ScoreTableViewController.h
//  TapChallange
//
//  Created by giacomo osso on 18/01/17.
//  Copyright © 2017 Giacomo Osso. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScoreTableViewController : UITableViewController


// Strong perchè mi serve una referenza forte, rischio che il mio array si perda :(
@property (nonatomic, strong) NSArray *scoresArray;

@end
