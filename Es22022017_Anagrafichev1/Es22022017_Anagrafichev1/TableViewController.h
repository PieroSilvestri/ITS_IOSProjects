//
//  TableViewController.h
//  Es22022017_Anagrafichev1
//
//  Created by Piero Silvestri on 22/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailController.h"

@interface TableViewController : UITableViewController<DetailDelegate>

@property (nonatomic) NSMutableArray *nomiArray;
@property (nonatomic) NSMutableArray *cognomiArray;


@end
