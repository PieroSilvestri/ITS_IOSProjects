//
//  ViewController.m
//  Es23012017_esercizio2
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.numberTextField setPlaceholder:@"Inserisci il numero..."];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabel: (NSString *)newNumber{
    
    int numberEnter = newNumber.intValue;
    
    NSString *mioTesto;
    
    if(numberEnter % 2 == 0){
        NSLog(@"E' divisibile per due");
        mioTesto = [NSString stringWithFormat:@"%d è divisibile per 2.", numberEnter];
    }else{
        NSLog(@"Non è divisibile per due");
        mioTesto = [NSString stringWithFormat:@"%d NON è divisibile per 2.", numberEnter];
    }
    
    [self.risultatoLabel setText:mioTesto];
}

#pragma mark - Action
-(IBAction)numberTextFieldDidEndOnExit:(id)sender{
    NSLog(@"numberTextFieldDidEndOnExit");
}


-(IBAction)numberTextFieldEditingDidEnd:(UITextField *)sender{
    NSLog(@"numberTextFieldEditingDidEnd");
    [self updateLabel:sender.text];
    
}

@end
