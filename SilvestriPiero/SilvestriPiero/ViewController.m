//
//  ViewController.m
//  SilvestriPiero
//
//  Created by Piero Silvestri on 02/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"

@interface ViewController ()<PushDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
   

}

- (void)viewDidLayoutSubviews{
    CGRect newFrame = self.btnPush.frame;
    
    //    NSInteger screenHeight = [[UIScreen mainScreen] bounds].size.height;
    NSInteger screenWidth = [[UIScreen mainScreen] bounds].size.width;
    
    newFrame.size.width = screenWidth/3;
    newFrame.size.height = screenWidth/3;
    [self.btnPush setFrame:newFrame];
    
    
    CGFloat width = self.btnModal.frame.size.width;
    [self.btnModal.layer setCornerRadius:width/2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate Methods

-(void)updatePushBtnColor:(UIColor *)newColor{
    
    [_btnPush setBackgroundColor:newColor];
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if([[segue identifier] isEqualToString:@"pushSegue"]){
         NSLog(@"Push Segue");
         PushViewController *pvc = [segue destinationViewController];
         pvc.delegate = self;
     }
 }

@end
