//
//  ViewController.h
//  Es23012017_esercizio1
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic, weak) IBOutlet UILabel *myLabel;
@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;

// Actions:
-(IBAction)userNameTextFieldDidEndOnExit:(id)sender;
-(IBAction)userNameTextFieldEditingDidEnd:(id)sender;


@end

