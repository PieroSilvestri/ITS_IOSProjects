//
//  ViewController.h
//  Calcolatrice v1
//
//  Created by Piero Silvestri on 29/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *myTextField;

-(IBAction)button0Pressed:(id)sender;
-(IBAction)button1Pressed:(id)sender;
-(IBAction)button2Pressed:(id)sender;
-(IBAction)button3Pressed:(id)sender;
-(IBAction)button4Pressed:(id)sender;
-(IBAction)button5Pressed:(id)sender;
-(IBAction)button6Pressed:(id)sender;
-(IBAction)button7Pressed:(id)sender;
-(IBAction)button8Pressed:(id)sender;
-(IBAction)button9Pressed:(id)sender;
-(IBAction)buttonEqualsPressed:(id)sender;
-(IBAction)buttonVirgolaPressed:(id)sender;
-(IBAction)buttonPiuPressed:(id)sender;
-(IBAction)buttonMenoPressed:(id)sender;
-(IBAction)buttonPerPressed:(id)sender;
-(IBAction)buttonDivisoPressed:(id)sender;
-(IBAction)buttonCEPressed:(id)sender;





@end

