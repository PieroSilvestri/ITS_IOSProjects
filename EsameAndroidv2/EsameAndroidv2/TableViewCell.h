//
//  TableViewCell.h
//  EsameAndroidv2
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end
