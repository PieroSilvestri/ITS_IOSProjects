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
@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

-(IBAction)buttonPressed:(id)sender;

-(IBAction)tapGestureRecognizerDidRecognizeTap:(id)sender;


@end

