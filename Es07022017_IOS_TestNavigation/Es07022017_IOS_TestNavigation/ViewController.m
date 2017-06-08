//
//  ViewController.m
//  Es07022017_IOS_TestNavigation
//
//  Created by Piero Silvestri on 07/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     // Do any additional setup after loading the view, typically from a nib.
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date]
                                              interval:5 repeats:NO block:^(NSTimer * _Nonnull timer){
        [self doTheSegueForMe];
    }];
    [timer fire];
}


-(void) doTheSegueForMe{
    
}


-(IBAction)ritornoDalPrimoController:(UIStoryboardSegue *)sender{
    
}

-(IBAction)ritornoDalPrimoController2:(UIStoryboardSegue *)sender{
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIButton *button;
    if([segue.identifier isEqualToString:@"ButtonSegue"]){
        if( [sender isKindOfClass:[UIButton class]]){
            button = (UIButton *) sender;
        }
        
        NSLog(@"Ho premuto il tasto! %@", button.currentTitle);
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
