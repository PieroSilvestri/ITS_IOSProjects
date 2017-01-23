//
//  ViewController.m
//  Es23012017_esercizio3
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int _numeroRandom;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initGame];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initGame{
    NSLog(@"InitGame");
    _numeroRandom = [self getRandomNumberBetween:1 to: 10];
    
    [self.randomLabel setText:[NSString stringWithFormat:@"%d", _numeroRandom]];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(void)yesAlert{
    NSString *message = @"Hai risposto correttamente alla risposta";
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Corretto!" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Salvo i dati utente
        [self initGame];
    }];
    
    
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:true completion:nil];
}

-(void)noAlert{
    NSString *message = @"NON hai risposto correttamente alla risposta";
    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Sbagliato!" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // Salvo i dati utente
        [self initGame];
    }];
    
    
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:true completion:nil];
}

#pragma mark - Action
-(IBAction)yesButtonTouchUpInside:(id)sender{
    NSLog(@"yesButtonTouchUpInside");
    
    if(_numeroRandom % 2 == 0){
        [self yesAlert];
    }else{
        [self noAlert];
    }
    
}

-(IBAction)noButtonTouchUpInside:(id)sender{
    NSLog(@"noButtonTouchUpInside");
    
    if(_numeroRandom % 2 != 0){
        [self yesAlert];
    }else{
        [self noAlert];
    }
}

@end
