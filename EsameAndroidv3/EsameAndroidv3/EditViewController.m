//
//  EditViewController.m
//  EsameAndroidv3
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController (){
    NSDictionary *editDictionary;
    long indiceMyArray;
}

@end

@implementation EditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    editDictionary = _myDictionaryPassed;
    indiceMyArray = _indiceArray;
    NSLog(@"EDITDICTIONARY: %@", editDictionary);
    NSLog(@"INDICAMYARRAY: %li", indiceMyArray);
    [_nameTextField setText:[editDictionary objectForKey:@"name"]];
    [_surnameTextField setText:[editDictionary objectForKey:@"surname"]];
    [_idTextField setText:[NSString stringWithFormat:@"%@",[editDictionary objectForKey:@"id"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

- (IBAction)nameDidEndOnExit:(id)sender{
    [self.view endEditing:YES];
}




- (IBAction)savePressed:(id)sender {
    NSDictionary *tempDictionary = @{
                                     @"id": [editDictionary objectForKey:@"id"],
                                     @"name": _nameTextField.text,
                                     @"surname": _surnameTextField.text
                                     };
    
    [self.delegate updateObject:indiceMyArray dictionary:tempDictionary];
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
