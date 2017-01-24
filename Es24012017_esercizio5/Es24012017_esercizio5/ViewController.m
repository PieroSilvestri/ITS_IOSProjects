//
//  ViewController.m
//  Es24012017_esercizio5
//
//  Created by Piero Silvestri on 24/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *nomi;
    NSArray *cognomi;
    NSArray *nomicognomi;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadMyArray];
    [self logResultsSimple];    // Metodo Simple
    [self doTheSort];           // Metodo Due array distinti
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)logResultsSimple{
    
    NSLog(@"logResultsSimple");
    
    NSArray *sortedArrayNomiCognomi = [nomicognomi sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    for(int i = 0; i < sortedArrayNomiCognomi.count; i++){
        NSLog(@"%@", [sortedArrayNomiCognomi objectAtIndex:i]);
    }
}

-(void)doTheSort{
    
    // Metodo Selection Sort
    
    NSMutableArray *nomiSorted = [NSMutableArray arrayWithCapacity:nomi.count];
    NSMutableArray *cognomiSorted = [NSMutableArray arrayWithCapacity:cognomi.count];
    
    for(int a = 0; a < nomi.count; a++){
        [nomiSorted addObject:[nomi objectAtIndex:a]];
        [cognomiSorted addObject:[cognomi objectAtIndex:a]];
    }
    //NSMutableArray *cognomiSorted = [NSMutableArray arrayWithCapacity:cognomi.count];

    int minimo = 0;
    NSString *minimoNome;
    NSString *altroNome;
    
    for(int i = 0; i < nomiSorted.count; i++){
        minimo = i;
        for(int j = i; j < nomiSorted.count; j++){
            minimoNome = [nomiSorted objectAtIndex:minimo];
            altroNome = [nomiSorted objectAtIndex:j];
            NSComparisonResult result = [minimoNome compare:altroNome];
            if(j == (nomiSorted.count - 1)){
                NSString *firstName = nomiSorted[i];
                NSString *firstSurname = cognomiSorted[i];
                nomiSorted[i] = minimoNome;
                cognomiSorted[i] = [cognomiSorted objectAtIndex:minimo];
                nomiSorted[minimo] = firstName;
                cognomiSorted[minimo] = firstSurname;
            }else{
                if(result == NSOrderedDescending){
                    minimo = j;
                }
            }
        }
    }
    
    for(int a = 0; a < nomiSorted.count; a++){
        NSLog(@"VALORE:%@ %@", [nomiSorted objectAtIndex:a], [cognomiSorted objectAtIndex:a]);
    }
}


-(void)loadMyArray{
    nomi = @[@"Freddie", @"Krista", @"Merle", @"Lorraine", @"Lorenzo", @"Sandra", @"Nichole", @"Floyd", @"Andrea", @"Marcus", @"Jacob" ,@"Peter" ,@"Glenn", @"Francis", @"Yvette", @"Evan", @"Shelley", @"Gladys", @"Stella" ,@"Mindy" ,@"Beth" ,@"Everett" ,@"Audrey" ,@"Christie" ,@"Timothy"];
    cognomi = @[@"Campbell", @"Kim", @"Hubbard", @"Weber", @"Greene", @"Brock", @"Hines", @"Clarke", @"Ramsey", @"Reid", @"Garza" ,@"Herrera" ,@"Horton", @"Mack", @"Farmer", @"Hughes",@"Lane", @"Carroll", @"Thornton" ,@"Wilkerson" ,@"Diaz" ,@"Mckinney" ,@"Cooper" ,@"Sutton" ,@"Walters"];
    
    nomicognomi = @[@"Freddie Campbell", @"Krista Kim", @"Merle Hubbard", @"Lorraine Weber", @"Lorenzo Greene", @"Sandra Brock", @"Nichole Hines", @"Floyd Clarke", @"Andrea Ramsey", @"Marcus Reid", @"Jacob Garza" ,@"Peter Herrera" ,@"Glenn Horton", @"Francis Mack", @"Yvette Farmer", @"Evan Hughes", @"Shelley Lane", @"Gladys Carroll", @"Stella Thornton" ,@"Mindy Wilkerson" ,@"Beth Diaz" ,@"Everett Mckinney" ,@"Audrey Cooper" ,@"Christie Sutton" ,@"Timothy Walters"];
}

/* Nomi

 1)  Freddie	Campbell
 2)  Krista     Kim
 3)  Merle      Hubbard
 4)  Lorraine	Weber
 5)  Lorenzo	Greene
 6)  Sandra     Brock
 7)  Nichole	Hines
 8)  Floyd      Clarke
 9)  Andrea     Ramsey
 10) Marcus     Reid
 11) Jacob      Garza
 12) Peter      Herrera
 13) Glenn      Horton
 14) Francis	Mack
 15) Yvette     Farmer
 16) Evan       Hughes
 17) Shelley	Lane
 18) Gladys     Carroll
 19) Stella     Thornton
 20) Mindy      Wilkerson
 21) Beth       Diaz
 22) Everett	Mckinney
 23) Audrey     Cooper
 24) Christie	Sutton
 25) Timothy	Walters
 
 */
@end
