//
//  ViewController.m
//  Es23012017_esercizio4
//
//  Created by Piero Silvestri on 23/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSArray *mioArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self initGame];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initGame{
    NSMutableArray *array = @[].mutableCopy;
    // mioArray = [NSMutableArray arrayWithCapacity:100];
    
    for(int i = 0; i < 100; i++){
        int numeroRandom = [self getRandomNumberBetween:1 to:10];
        [array addObject:@(numeroRandom)];
        NSLog(@"Numero[%i]: %i", i, numeroRandom);
    }
    
    mioArray = array;
    [self getSommaArray:array];
}

-(int)getRandomNumberBetween:(int)from to:(int)to {
    return (int)from + arc4random() % (to-from+1);
}

-(void)getSommaArray:(NSMutableArray *)arrayNumeri{
    
    int somma = 0;
    
    for(int i = 0; i < arrayNumeri.count; i++){
        somma += [arrayNumeri[i] intValue];
        
    }
    
    NSLog(@"Somma: %i", somma);
    
    [self.risultatoLabel setText:[NSString stringWithFormat:@"Somma = %i", somma]];
}

-(NSArray *) risultato{
    /*
     int tapsValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"TapsCount"];
     NSLog(@"VALORE DAGLI USER DEFOULTS -> %i", tapsValue);
     return tapsValue;
     */
    
    NSArray *array = [[NSUserDefaults standardUserDefaults] objectForKey:@"ciao"];
    
    if(array == nil){
        array = @[];
    }
    NSLog(@"VALORI NELL?ARRAY %@",array);
    return array;
    
}

#pragma mark - Action

-(IBAction)buttonTouchUpInside:(id)sender{
    [self initGame];
}


@end
