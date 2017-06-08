//
//  EditViewController.m
//  EsameAndroidv2
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController (){
    NSNumber *dicId;
}

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setEditViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setEditViews{
    NSLog(@"EditViewController");
    NSLog(@"%@",_dictionaryPassed);
    _nameTextField.text = [_dictionaryPassed objectForKey:@"name"];
    _phoneTextField.text = [_dictionaryPassed objectForKey:@"phone"];
    _numberTextField.text = [NSString stringWithFormat:@"%@", [_dictionaryPassed objectForKey:@"numberOfPerson"]];
    dicId = [_dictionaryPassed objectForKey:@"id"];
}
- (IBAction)nameEditingDidEnd:(id)sender {
    NSLog(@"nameEditingDidEnd");
    [self.view endEditing:YES];
}
- (IBAction)nameDidEndOnExit:(id)sender {
    NSLog(@"nameDidEndOnExit");
    [self.view endEditing:YES];

}

- (IBAction)saveEditButtonPressed:(id)sender {
    NSDictionary *updateDictionary = @{
                                       @"id": dicId,
                                       @"name": _nameTextField.text,
                                       @"phone": _phoneTextField.text,
                                       @"numberOfPerson": _numberTextField.text
                                       };
    NSLog(@"saveEditButtoNpressed: %@", updateDictionary);
    [self.delegate updateObject:_indexPassed :updateDictionary];
    [self.navigationController popViewControllerAnimated:YES];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
