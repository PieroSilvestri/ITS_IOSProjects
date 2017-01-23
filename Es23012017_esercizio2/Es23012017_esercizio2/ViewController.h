//
//  ViewController.h
//  Es23012017_esercizio2
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (nonatomic, weak) IBOutlet UILabel *risultatoLabel;
@property (nonatomic, weak) IBOutlet UITextField *numberTextField;


// Actions:
// Fai l'azione quando tolgo il focus
-(IBAction)numberTextFieldDidEndOnExit:(id)sender;
// Fai l'azione quando premo invio
-(IBAction)numberTextFieldEditingDidEnd:(id)sender;


@end

