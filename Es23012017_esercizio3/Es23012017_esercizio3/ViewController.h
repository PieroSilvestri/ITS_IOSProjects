//
//  ViewController.h
//  Es23012017_esercizio3
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *randomLabel;


// Action:
// Azione quando premo il tasto
-(IBAction)yesButtonTouchUpInside:(id)sender;
-(IBAction)noButtonTouchUpInside:(id)sender;


@end

