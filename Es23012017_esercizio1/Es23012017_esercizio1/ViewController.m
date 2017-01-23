//
//  ViewController.m
//  Es23012017_esercizio1
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *_nuovoTesto;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.userNameTextField setPlaceholder:@"Inserisci il tuo nick..."];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateLabel: (NSString *)newText{
    
    [self.myLabel setText: newText];
}

#pragma mark - Action

// userNameTextField Actions:
-(IBAction)userNameTextFieldDidEndOnExit:(id)sender{
    NSLog(@"userNameTextFieldDidEndOnExit");
}

-(IBAction)userNameTextFieldEditingDidEnd:(UITextField *)sender{
    NSLog(@"userNameTextFieldEditingDidEnd");
    NSLog(@"%@", sender.text);
    
    _nuovoTesto = sender.text;

    [self updateLabel: _nuovoTesto];
    
}




@end
