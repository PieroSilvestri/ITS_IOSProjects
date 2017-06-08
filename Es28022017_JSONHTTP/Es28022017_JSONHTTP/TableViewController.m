//
//  TableViewController.m
//  Es28022017_JSONHTTP
//
//  Created by Piero Silvestri on 28/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController (){
    NSMutableArray *tempMutable;
    NSString *titleToBePassed;
    NSInteger idToBePassed;
    NSInteger userIdToBePassed;
    Boolean segueFlag;
    UIActivityIndicatorView *spinner;
    __weak IBOutlet UILabel *cellLabel;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    segueFlag = false;
    
    spinner = [[UIActivityIndicatorView alloc] initWithFrame:self.view.frame];
    spinner.color = [UIColor blackColor];
    // Metodo per aggiungere UIVIEW DENTRO LE VIEW
    [self.view addSubview:spinner];
    [spinner startAnimating];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self httpResp];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
                        NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                        
                        if (jsonError) {
                            // Error Parsing JSON
                            
                        } else {
                            // Success Parsing JSON
                            // Log NSDictionary response
                            NSLog(@"%@",jsonResponse);
                            tempMutable = jsonResponse.mutableCopy;
                            [self.tableView reloadData];
                            [spinner stopAnimating];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tempMutable.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSDictionary *tempDictionary = (NSDictionary *) tempMutable[indexPath.row];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"id"]];

    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *tempDictionary = (NSDictionary *) tempMutable[indexPath.row];
    
    titleToBePassed = [tempDictionary objectForKey:@"title"];
    idToBePassed = (NSInteger)[tempDictionary valueForKey:@"id"];
    userIdToBePassed = (NSInteger)[tempDictionary valueForKey:@"userId"];
    
    NSLog(@"TEMPTITLE: %@", titleToBePassed);
    NSLog(@"TEMPID: %li", idToBePassed);
    NSLog(@"USERID: %li", userIdToBePassed);
    
    segueFlag = true;

    [self performSegueWithIdentifier:@"detailSegue" sender:self];
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
    
    if([[segue identifier] isEqualToString:@"detailSegue"]){
        ViewController *vc = [segue destinationViewController];
        vc.titlePassed = titleToBePassed;
        vc.idPassed = idToBePassed;
        vc.userIdPassed = userIdToBePassed;
        
        segueFlag = false;
        
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if(segueFlag){
        return true;
    }else{
        return false;
    }
}

@end
