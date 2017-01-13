//
//  ViewController.h
//  SingleViewApplication
//
//  Created by Piero Silvestri on 11/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// Il puntatore è di tipo debole (weak) perchè sarà compito della storyboard cancellarlo

@property (nonatomic, weak) IBOutlet UILabel *helloWorldLabel;
@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;
@property (nonatomic, weak) IBOutlet UIButton *myButton;

// *userNameTextField Actions
-(IBAction)userNameTextFieldDidEndOnExit:(id)sender;
-(IBAction)userNameTextFieldEditingDidEnd:(id)sender;

// *myButton Actions
-(IBAction)myButtonPressed:(id)sender;

@end

