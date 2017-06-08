//
//  TableViewController.m
//  Es27022017_Anagrafichev3
//
//  Created by Piero Silvestri on 27/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController (){
    NSMutableArray *nomiArray;
    NSMutableArray *cognomiArray;
    NSInteger indexPathRowToBePassed;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    indexPathRowToBePassed = -1;
    [self initArray];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)initArray{
    nomiArray = @[@"Piero", @"Silvio", @"Luca"].mutableCopy;
    cognomiArray = @[@"Silvestri", @"Berlusconi", @"Fumagalli"].mutableCopy;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return nomiArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *nomeLabel = [NSString stringWithFormat:@"%@", nomiArray[indexPath.row]];
    NSString *cognomiLabel = [NSString stringWithFormat:@"%@", cognomiArray[indexPath.row]];
    
    [cell.textLabel setText:nomeLabel];
    [cell.detailTextLabel setText:cognomiLabel];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%@", nomiArray[indexPath.row]);
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    indexPathRowToBePassed = indexPath.row;
    //where indexPath.row is the selected cell
    
    
    //DetailController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailControllerID"];
    
    [self performSegueWithIdentifier:@"detailSegueID" sender: self];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    [segue destinationViewController];
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detailSegueID"])
    {
        // Get reference to the destination view controller
        ViewController *vc = [segue destinationViewController];
        
        vc.namesArray = nomiArray;
        vc.surnamesArray = cognomiArray;
        // Lego l'interfaccia che ho creato
        
        // Pass any objects to the view controller here, like...
        vc.indexPassed = indexPathRowToBePassed;
        
        indexPathRowToBePassed = -100;
        
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if(indexPathRowToBePassed > -1){
        return YES;
    }
    return NO;
    
}


@end
