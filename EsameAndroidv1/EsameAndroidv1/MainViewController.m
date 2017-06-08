//
//  MainViewController.m
//  EsameAndroidv1
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *tempMutable;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    tempMutable = [NSMutableArray arrayWithArray:@[@"Franco", @"Giulio", @"Piero"]];
    
    [[self myTableView] reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"maincell"];

    [cell.textLabel setText:@"ciao piero"];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deseleziono la row quando la premo
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    //where indexPath.row is the selected cell
    NSLog(@"Hai premuto: %@", tempMutable[indexPath.row]);

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
