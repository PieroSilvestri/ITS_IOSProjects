//
//  PushViewController.m
//  SilvestriPiero
//
//  Created by Piero Silvestri on 02/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnGreenPressed:(id)sender {
    // Se premo il tasto verde passo il numero 1 per colorare il bottone
    [self.delegate updatePushBtnColor:[UIColor greenColor]];
    
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)btnRedPressed:(id)sender {
    // Se premo il tasto rosso passo il numero 2 per colorare il bottone

    [self.delegate updatePushBtnColor:[UIColor redColor]];
    [self.navigationController popViewControllerAnimated:YES];

}

- (IBAction)btnBluePressed:(id)sender {
    // Se premo il tasto blue passo il numero 3 per colorare il bottone

    [self.delegate updatePushBtnColor:[UIColor blueColor]];
    [self.navigationController popViewControllerAnimated:YES];

}
@end
