//
//  PushViewController.h
//  SilvestriPiero
//
//  Created by Piero Silvestri on 02/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol PushDelegate <NSObject>

-(void)updatePushBtnColor:(UIColor *) newColor;

@end
 

@interface PushViewController : UIViewController

@property (nonatomic, weak) id<PushDelegate> delegate;

- (IBAction)btnGreenPressed:(id)sender;

- (IBAction)btnRedPressed:(id)sender;

- (IBAction)btnBluePressed:(id)sender;

@end
