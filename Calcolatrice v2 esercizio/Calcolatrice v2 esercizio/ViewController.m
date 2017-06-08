//
//  ViewController.m
//  Calcolatrice v2 esercizio
//
//  Created by Piero Silvestri on 31/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *display;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(UIButton *)sender{
    NSLog(@"Button pressed %@", sender.currentTitle);
}

-(IBAction)didNumberPressed:(UIButton *)sender{
    self.display.text = [self.display.text stringByAppendingString:sender.currentTitle];
}

@end
