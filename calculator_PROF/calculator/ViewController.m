//
//  ViewController.m
//  calculator
//
//  Created by Damiano Buscemi on 25/01/17.
//  Copyright © 2017 Cripsy Bacon S.r.l. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSString *_valoreAttuale;
}


@end

@implementation ViewController

-(void)viewDidLoad{
    _valoreAttuale = @"";
}

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"Button pressed %@", sender.currentTitle);
}

-(IBAction)button1Pressed:(id)sender{
    NSLog(@"Premuto tasto");
    NSString *messaggio = [NSString stringWithFormat:@"%i",6];
    _valoreAttuale = [_valoreAttuale stringByAppendingString:messaggio];
    [self.myLabel setText:_valoreAttuale];
}

@end
