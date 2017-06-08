//
//  ViewController.m
//  Es28022017_JSONHTTP
//
//  Created by Piero Silvestri on 28/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    
}

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *idLabel;
@property (weak, nonatomic) IBOutlet UILabel *userIdLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _titleLabel.text = _titlePassed;
    _idLabel.text = [NSString stringWithFormat:@"%li",_idPassed];
    _userIdLabel.text = [NSString stringWithFormat:@"%li",_userIdPassed];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
