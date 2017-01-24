//
//  ViewController.m
//  Es24012017_esercizio6
//
//  Created by Piero Silvestri on 24/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initGame];
    
    
}

-(void)initGame{
    [self.userNameTextField setPlaceholder:@"Inserisci il nome..."];
    [self.userSurnameTextField setPlaceholder:@"Inserisci il cognome..."];
    [self.userAgeTextField setPlaceholder:@"Inserisci l'età..."];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonTouchUpInside:(id)sender{
    NSLog(@"\n Nome: %@ Cognome: %@ Età: %@", self.userNameTextField.text, self.userSurnameTextField.text, self.userAgeTextField.text);
}


@end
