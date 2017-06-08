//
//  TableViewController.m
//  Es22022017_Anagrafichev1
//
//  Created by Piero Silvestri on 22/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "TableViewController.h"
#import "DetailController.h"

@interface TableViewController (){
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
    
    
    
    [self httpResp];
    
    indexPathRowToBePassed = -100;
}

-(void)httpResp{
    NSString *urlAsString = [NSString stringWithFormat:@"https://jsonplaceholder.typicode.com/albums"];
    
    NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
    NSString *encodedUrlAsString = [urlAsString stringByAddingPercentEncodingWithAllowedCharacters:set];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    [[session dataTaskWithURL:[NSURL URLWithString:encodedUrlAsString]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                
                NSLog(@"RESPONSE: %@",response);
                NSLog(@"DATA: %@",data);
                
                if (!error) {
                    // Success
                    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                        NSError *jsonError;
                        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                        
                        if (jsonError) {
                            // Error Parsing JSON
                            
                        } else {
                            // Success Parsing JSON
                            // Log NSDictionary response:
                            NSLog(@"JSONRESPONSE: %@",jsonResponse);
                        }
                    }  else {
                        //Web server is returning an error
                    }
                } else {
                    // Fail
                    NSLog(@"error : %@", error.description);
                }
            }] resume];
}

-(void)viewWillAppear:(BOOL)animated{
    
    
    if(_nomiArray == nil && _cognomiArray == nil){
        [self setMyArray];
        NSLog(@"==NULL");

    }else{
        NSLog(@"!=NULL");
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)cancellArray:(long)indexRow{
    NSLog(@"cancellArray");
    [_nomiArray removeObjectAtIndex:indexRow];
    [_cognomiArray removeObjectAtIndex:indexRow];
}

-(void)updateArray:(long)indexRow :(NSString *)nomeUpdate :(NSString *)cognomeUpdate{
    NSLog(@"updateArray");
    _nomiArray[indexRow] = nomeUpdate;
    _cognomiArray[indexRow] = cognomeUpdate;
}

-(void)addObjectArray:(NSString *)nomeAdd :(NSString *)cognomeAdd{
    [_nomiArray addObject:nomeAdd];
    [_cognomiArray addObject:cognomeAdd];
}

-(void)setMyArray{
    _nomiArray = @[@"Piero", @"Marco", @"Giulio"].mutableCopy;
    _cognomiArray = @[@"Silvestri", @"Lavopovich", @"Germin"].mutableCopy;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _nomiArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellId= @"cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSString *textLabel = [NSString stringWithFormat:@"%@ %@", _nomiArray[indexPath.row],
                           _cognomiArray[indexPath.row]];
    
    [cell.textLabel setText:textLabel];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Deseleziono la row quando la premo
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    //where indexPath.row is the selected cell
    
    indexPathRowToBePassed = [indexPath row];
    
    //DetailController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailControllerID"];
    
    [self performSegueWithIdentifier:@"detailSegueID" sender: self];
    //[self.navigationController pushViewController:viewController animated:true];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detailSegueID"])
    {
        // Get reference to the destination view controller
        DetailController *vc = [segue destinationViewController];
        
        vc.namesArray = _nomiArray.mutableCopy;
        vc.surnamesArray = _cognomiArray.mutableCopy;
        // Lego l'interfaccia che ho creato
        vc.delegate = self;
        
        // Pass any objects to the view controller here, like...
        vc.indexRowPassed = indexPathRowToBePassed;
        
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
