//
//  ViewController.m
//  calculator
//
//  Created by Damiano Buscemi on 25/01/17.
//  Copyright © 2017 Cripsy Bacon S.r.l. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (IBAction)buttonPressed:(UIButton *)sender {
    NSLog(@"Button pressed %@", sender.currentTitle);
}

@end
