//
//  ViewController.h
//  Es24012017_esercizio6
//
//  Created by Piero Silvestri on 24/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *userNameTextField;
@property (nonatomic, weak) IBOutlet UITextField *userSurnameTextField;
@property (nonatomic, weak) IBOutlet UITextField *userAgeTextField;

-(IBAction)buttonTouchUpInside:(id)sender;

@end

