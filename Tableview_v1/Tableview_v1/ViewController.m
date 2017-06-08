//
//  ViewController.m
//  Tableview_v1
//
//  Created by Piero Silvestri on 13/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *imageNameArray;
}
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self arraySetup];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)arraySetup{
    imageNameArray = [NSMutableArray arrayWithArray:@[@"image1", @"image2", @"image3", @"image4"]];
}

# pragma mark - UITableView Methods


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return imageNameArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    cell.imageView.image = [UIImage imageNamed:imageNameArray[indexPath.row]];
    cell.textLabel.text = imageNameArray[indexPath.row];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%d", (int)indexPath.row + 1];
    return cell;
}




@end
