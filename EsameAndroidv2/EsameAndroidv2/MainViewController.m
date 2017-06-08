//
//  MainViewController.m
//  EsameAndroidv2
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "MainViewController.h"
#import "TableViewCell.h"
#import "EditViewController.h"

@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate, EditDelegate>
{
    NSMutableArray *myMutableArray;
    NSMutableDictionary *myDictionary;
    
    NSDictionary *dictionaryToBePassed;
}

@end

// RICORDATI DI COLLEGARE LA TABLE VIEW AL VIEW CONTROLLER DALLA STORYBOARD CON IL CONTROL

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setMyMain];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - My Methods

-(void)setMyMain{
    myMutableArray = [NSMutableArray arrayWithArray:@[
                                                      @{
                                                          @"id": @1,
                                                          @"name": @"Piero",
                                                          @"phone": @"+393339535218",
                                                          @"numberOfPerson": @2
                                                          },
                                                      @{
                                                          @"id": @2,
                                                          @"name": @"Franco",
                                                          @"phone": @"+391234567890",
                                                          @"numberOfPerson": @11
                                                          },
                                                      @{
                                                          @"id": @3,
                                                          @"name": @"Elena",
                                                          @"phone": @"+391111111111",
                                                          @"numberOfPerson": @5
                                                          }
                                                      ]];
}

-(void)deleteObject:(NSInteger)indexArray{
    // Cancello un oggetto nella posizione inserita
    [myMutableArray removeObjectAtIndex:indexArray];
    [[self tableView] reloadData];
}

-(void)updateObject:(NSInteger)indexRow :(NSDictionary *)dictionaryUpdate{
    NSLog(@"updateObject");

    NSInteger tempIndex = indexRow;
    myMutableArray[tempIndex] = dictionaryUpdate;
    NSLog(@"tempIndex: %li", tempIndex);
    NSLog(@"dictionaryUpdate: %@", dictionaryUpdate);
    NSLog(@"myArray: %@", myMutableArray);
    [[self tableView] reloadData];

}

-(void)addObjectToArray:(NSDictionary *)dictionaryAdd{
    NSLog(@"addObjectToArray");
    NSNumber *newId = [[myMutableArray lastObject] objectForKey:@"id"];
    NSLog(@"newId: %@", newId);
    NSLog(@"dictionaryAdd: %@", dictionaryAdd);
}

#pragma mark - UITableView Methods

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return myMutableArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSDictionary *tempDictionary = myMutableArray[indexPath.row];
    NSString *tempName = [tempDictionary objectForKey:@"name"];
    NSString *tempPhone = [tempDictionary objectForKey:@"phone"];
    NSString *tempNumber = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"numberOfPerson"]];
    
    [cell.nameLabel setText:tempName];
    [cell.phoneLabel setText:tempPhone];
    [cell.numberLabel setText:tempNumber];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // Funzione che uso solo per deselezionare la cella
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSDictionary *tempDictionary = myMutableArray[indexPath.row];
    NSString *tempName = [tempDictionary objectForKey:@"name"];
 
    NSString *message = [NSString stringWithFormat:@"Vuoi cancellare la prenotazione di %@?", tempName];
 
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle: @"ATTENZIONE!" message:message preferredStyle:UIAlertControllerStyleAlert];
 
    UIAlertAction *siAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Si ACTION PREMUTA");
        //Cancella  il risultato
        [self deleteObject:indexPath.row];
    }];
 
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Annulla" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Annulla ACTION PREMUTA");
 
    }];
 
    [alertViewController addAction:siAction];
    [alertViewController addAction:noAction];
 
    [self presentViewController:alertViewController animated:true completion:nil];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if([[segue identifier] isEqualToString:@"editSegue"]){
        
        long tempIndex = [_tableView.indexPathForSelectedRow row];
        
        
        NSDictionary *tempDictionary = myMutableArray[tempIndex];
        NSString *tempName = [tempDictionary objectForKey:@"name"];
        NSString *tempPhone = [tempDictionary objectForKey:@"phone"];
        NSString *tempNumber = [NSString stringWithFormat:@"%@", [tempDictionary objectForKey:@"numberOfPerson"]];
        
        NSLog(@"Name: %@\n Phone: %@\n NumberOfPerson: %@", tempName, tempPhone, tempNumber);
        
        dictionaryToBePassed = tempDictionary;
        
        EditViewController *evc = [segue destinationViewController];
        evc.indexPassed = tempIndex;
        evc.dictionaryPassed = dictionaryToBePassed;
        evc.delegate = self;
    }
    
}



@end
