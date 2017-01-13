//
//  ViewController.h
//  TapChallange
//
//  Created by Piero Silvestri on 13/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *tapsCountLabel;

-(IBAction)buttonPressed:(id)sender;


@end

