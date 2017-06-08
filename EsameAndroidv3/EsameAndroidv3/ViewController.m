//
//  ViewController.m
//  EsameAndroidv3
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource, EditDelegate>
{
    NSArray *myArray;
    NSMutableArray *myDictionaryArray;
    NSDictionary *myDictionary;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myArray = @[@"Piero", @"Sbuk", @"Melillo", @"Ciao", @"Contin", @"James", @"Parolin"];
    
    myDictionary = @{
                     @"id": @1,
                     @"name": @"Piero",
                     @"surname": @"Silvestri"
                     };
    
    NSLog(@"MY DICTIONARY: %@", myDictionary);
    NSLog(@"ID: %@\nName: %@\nSurname: %@",
          [myDictionary objectForKey:@"id"],
          [myDictionary objectForKey:@"name"],
          [myDictionary objectForKey:@"surname"]);
    NSArray *tempArray = @[
                           myDictionary,
                           @{
                               @"id": @2,
                               @"name": @"Andrea",
                               @"surname": @"Sbuk"
                               },
                           @{
                               @"id": @3,
                               @"name": @"James",
                               @"surname": @"Jesse"
                               }
                           ];
    
    
    myDictionaryArray = [NSMutableArray arrayWithArray:tempArray];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - My Methods

-(void)updateObject:(NSInteger)indexRow dictionary:(NSDictionary *)dictionaryUpdate{
    
    myDictionaryArray[indexRow] = dictionaryUpdate;
    
    [[self tableView] reloadData];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    // Serve per sapere le sezioni della nostra tableView
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return myDictionaryArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mainCell"];
    
    NSDictionary *tempDictionary = myDictionaryArray[indexPath.row];
    
    NSString *tempName = [tempDictionary objectForKey:@"name"];
    NSString *tempSurname = [tempDictionary objectForKey:@"surname"];
    
    [cell.textLabel setText:tempName];
    [cell.detailTextLabel setText:tempSurname];
    
    return cell;
}

#pragma mark - Navigation
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"editSegue"]){
        
        long indiceToBePassed = [[_tableView indexPathForSelectedRow] row];
        NSDictionary *tempDictionary = myDictionaryArray[indiceToBePassed];
        
        EditViewController *evc = [segue destinationViewController];
        evc.myDictionaryPassed = tempDictionary;
        evc.indiceArray = indiceToBePassed;
        
        evc.delegate = self;
    }
    
}



@end
