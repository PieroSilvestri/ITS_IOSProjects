//
//  ViewController.m
//  TapChallange
//
//  Created by giacomo osso on 13/01/17.
//  Copyright © 2017 Giacomo Osso. All rights reserved.
//

#import "GameViewController.h"
#import "ScoreTableViewController.h"

#define GameTimer 1 //tempo di tick
#define GameTime 5 //definisco il tempo di una partita

#define Defaults [NSUserDefaults standardUserDefaults]
#define Results @"UserScore"

@interface GameViewController (){
    int _tapsCounter;
    int _timeCount;
    
    NSTimer * _gameTimer;
}

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeGame];

    self.tapsCounterLabel.minimumScaleFactor = 0.5;
    [self.tapsCounterLabel setAdjustsFontSizeToFitWidth:true];
    
    //setto il navigation bar title
    self.title = @"Tap Challenge";
    
    //creo un pulsante che andrò a mettere dentro la NavigationBar
    UIBarButtonItem *scoreButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(scoreButtonPressed)];
    
    
    //imposto il pulsante come elemento alla DX della mia navigationBar
    self.navigationItem.rightBarButtonItem = scoreButtonItem;
    }

- (void) initializeGame{
    _tapsCounter = 0;
    _timeCount = GameTime;
 [self.timeLabel setText:[NSString stringWithFormat:@"Tap Challange - %i sec",GameTime ]];    [self.tapsCounterLabel setText:@"Tap to Play"];

}

# pragma mark - Action

-(void)scoreButtonPressed{
    /* io voglio quello dalla storyboard
    UIViewController *viewController = [[UIViewController alloc] init];
    viewController.title = @"Punteggi";
    viewController.view.backgroundColor = [UIColor redColor];
     */
    
    //prendo dalla story board il mio ViewController con story BoardId
    ScoreTableViewController *tableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ScoreTableViewController"];
    tableViewController.title = @"Punteggi";
    
    NSArray *resultsArray = [self risultato];
    [tableViewController setScoresArray:resultsArray];
    
    //pusho all'interno dello stack del mio navigationController un nuovo ViewController
    [self.navigationController pushViewController:tableViewController animated:true];
}

-(IBAction)tapsGestureRecognizerDidRecognizerTap:(id)sender{
    NSLog(@"Premuto: %i", _tapsCounter);
    
    if(_gameTimer == nil){
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true]; //schedula il timer nel time loop
    }
    _tapsCounter++;
    
    
    [self.tapsCounterLabel setText:[NSString stringWithFormat:@"%i",_tapsCounter]];
}
/*
-(void) buttonPressed:(id)sender{
    NSLog(@"Premuto: %i", _tapsCounter);
    
    if(_gameTimer == nil){
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:GameTimer target:self selector:@selector(timerTick) userInfo:nil repeats:true]; //schedula il timer nel time loop
    }
    _tapsCounter++;
    
    
    [self.tapsCounterLabel setText:[NSString stringWithFormat:@"%i",_tapsCounter]];
    
}
*/
- (void)timerTick{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    _timeCount--;
    
    [self.timeLabel setText:[NSString stringWithFormat:@"%i sec",_timeCount ]];
    
    //game over
    if(_timeCount==0){
        [_gameTimer invalidate]; // togliamo il timer dal run loop, descedula il timer dal loop
        _gameTimer = nil; //se facessimo solo questo avremmo un leak in memoria, distrugge il puntatore al timer
        
        NSString *massage = [NSString stringWithFormat:@"Hai fatto %i Taps!", _tapsCounter];
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle: @"Game Over" message:massage preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
            NSLog(@"OK ACTION PREMUTA");
            //salva  il risultato
            [self salvaRisultato];
            [self initializeGame];
        }];
        
        [alertViewController addAction:okAction];
        [self presentViewController:alertViewController animated:true completion:nil];
        
        

    }
    
}

-(void)viewDidAppear:(BOOL)animated{
    if([self primaApertura] ==false){
        //salvo prima apertura
        [[NSUserDefaults standardUserDefaults] setBool:true forKey:@"PrimaApertura"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }else{
        if([self risultato].count >0){
            NSNumber *value = [self risultato].lastObject;
        [self mostraUltimoRisultato: value.intValue];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI

-(void)mostraUltimoRisultato: (int)risultato{
    // voglio che UIAlertController mi mostri al primo avvio dell'app il precedente risultato del mio itente
    NSLog(@"PRIMA APERTURA -> %d", [self primaApertura]);
    
        
    
    NSString *massage = [NSString stringWithFormat:@"Il tuo miglior risultato : %i",risultato];
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle: @"Ben tornato !" message:massage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        [self initializeGame];
    }];
    
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:true completion:nil];

}

#pragma mark - Persistenza
-(NSArray *) risultato{
    /*
    int tapsValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"TapsCount"];
    NSLog(@"VALORE DAGLI USER DEFOULTS -> %i", tapsValue);
    return tapsValue;
     */
    
    NSArray *array = [Defaults objectForKey:Results];
    
    if(array == nil){
        array = @[];
    }
    NSLog(@"VALORI NELL?ARRAY %@",array);
    return array;
    
}

-(BOOL) primaApertura{
    bool primaApertura = [[NSUserDefaults standardUserDefaults] boolForKey:@"PrimaApertura"];
    return primaApertura;
}

- (void)salvaRisultato{
    //shared preferences -> android
    
    NSMutableArray *array = [[Defaults objectForKey:Results] mutableCopy];
    if(array == nil){
        //alloco e inizializzo l'array
        //old way
        // array = [[NSMutable alloc] init].mutableCopy;
        
        //new way
        array = @[].mutableCopy;
    }
    
    [array addObject: @(_tapsCounter)];
    
     NSLog(@"il mio array %@",array);
    
    NSArray *arrayToBeSaved = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1,NSNumber *obj2) {
        int value1 = obj1.intValue;
        int value2 = obj2.intValue;
        
        if(value1 == value2){
            return NSOrderedSame;
        }
        
        if(value1 < value2){
            return NSOrderedAscending;
        }
        
        return NSOrderedDescending;
        
    }];
     
    [Defaults setObject:arrayToBeSaved forKey:Results];
    [Defaults synchronize];
     
    /*
    //chiave valore
    [[NSUserDefaults standardUserDefaults] setInteger: _tapsCounter forKey: @"TapsCount"];
    [[NSUserDefaults standardUserDefaults] synchronize];
     */
}

@end
