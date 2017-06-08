//
//  ViewController.m
//  CorrezioneEsame
//
//  Created by Piero Silvestri on 02/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *circle;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGFloat width = self.circle.frame.size.width;
    [self.circle.layer setCornerRadius:width/2];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
