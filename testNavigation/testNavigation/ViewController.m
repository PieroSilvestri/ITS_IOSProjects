//
//  ViewController.m
//  testNavigation
//
//  Created by Federico Platania on 07/02/17.
//  Copyright © 2017 Federico Platania. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate date] interval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        [self doTheSegueForMe];
    }];
    [timer fire];
}

-(void)doTheSegueForMe{
    [self performSegueWithIdentifier:@"controllerSegue" sender:nil];
}
-(IBAction)ritornoDaPrimoController:(UIStoryboardSegue *)segue{
    
    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UIColor *color = [UIColor yellowColor];
    
    if ([segue.identifier isEqualToString:@"buttonSegue"]) {
        UIButton *button;
        if([sender isKindOfClass:[UIButton class]]){
            button=(UIButton*)sender;
            color=[UIColor blueColor];
            NSLog(@"Ho premuto il pulsante! %@",button.currentTitle);
        }

    }else if ([segue.identifier isEqualToString:@"controllerSegue"]){
        color=[UIColor redColor];
        NSLog(@"Ho fatto il segue del controller!");
    }
    secondViewController *secondVC = segue.destinationViewController;
    [secondVC setMyColor:color];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
