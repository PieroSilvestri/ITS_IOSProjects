//
//  ViewController.m
//  TapChallange
//
//  Created by Piero Silvestri on 13/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

#define GameTimer 1 // tempo di stick
#define GameTime 5 // definisco il tempo di una partita
#define FirstAppLaunch @"FirstAppLaunch"
#define Defaults [NSUserDefaults standardUserDefaults]
#define Results @"UserScore"

@interface ViewController (){
    int _tapCounter; // Conteggio dei tap
    int _timeCount; // Secondi rimanenti
    
    NSTimer *_gameTimer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tapsCountLabel.minimumScaleFactor = 0.5;
    [self.tapsCountLabel setAdjustsFontSizeToFitWidth:true];
    
    [self initializeGame];
    
}

-(void)viewDidAppear:(BOOL)animated{
    
    if([self firstAppLaunch] == false){
        // "Sporco" la variabile con true, così la prossima volta non cambia
        [Defaults setBool:true forKey:FirstAppLaunch];
        [Defaults synchronize];
    
    }else{
        if([self risultati].count > 0){
            NSNumber *value = [self risultati].lastObject;
            [self mostraUltimoRisultato:value.intValue];
        }
    }
    
}

-(void)initializeGame{
    _tapCounter = 0;
    _timeCount = GameTime;
    
    [self.tapsCountLabel setText:@"Tap to Play"];
    [self.timeLabel setText:[NSString stringWithFormat:@"Tap Challenge - %i sec", _timeCount]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)buttonPressed:(id)sender{
    NSLog(@"buttonPressed: %i", _tapCounter);
    
    if (_gameTimer == nil){
        _gameTimer = [NSTimer scheduledTimerWithTimeInterval:(GameTimer) target:self selector:@selector(timerTick) userInfo:nil repeats:true];
    }
    
    
    _tapCounter++;
    
    [self.tapsCountLabel setText:[NSString stringWithFormat:@"%i", _tapCounter]];
}

-(void)timerTick{
    // Quando finisce il mio timer+
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    _timeCount--;
    
    [self.timeLabel setText:[NSString stringWithFormat:@"%i sec", _timeCount]];
    
    if(_timeCount == 0){
        [_gameTimer invalidate];
        _gameTimer = nil;
        
        NSString *message = [NSString stringWithFormat:@"Hai fatto %i Taps!", _tapCounter];
        
        UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Game Over" message:message preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // Salvo i dati utente
            [self salvaRisultato];
            
            [self initializeGame];
        }];
        
        
        [alertViewController addAction:okAction];
        [self presentViewController:alertViewController animated:true completion:nil];
       
    }

}

#pragma mark - UI

-(void)mostraUltimoRisultato: (int)risultato{
    // Voglio che un UIAlertController mi mostri al primo avvio dell'app il precedente risultato del mio utente
    
    NSString *message = [NSString stringWithFormat:@"Nella partita precedente hai fatto %i Taps!", risultato];

    
    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle:@"Welcome" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertViewController addAction:okAction];
    [self presentViewController:alertViewController animated:true completion:nil];
}


#pragma mark - Persistenza

-(int)risultato{
    
    int value = [[NSUserDefaults standardUserDefaults] integerForKey:@"TapsCount"];
    
    NSLog(@"VALORE : %i", value);
    
    return value;
}

-(void)salvaRisultato{
    
    NSMutableArray *array = [[Defaults objectForKey:Results] mutableCopy];
    NSString *stringa_key = @"TapsCount";
    
    if(array == nil){
        // Old Way
        // array = [[NSMutableArray alloc] init].mutableCopy;
        
        // New Way and Swift
        array = @[].mutableCopy;
    }
    
    // Old Way
    // NSNumber *number = [NSNumber numberWithInt:_tapCounter];
    
    // Oggetto di tipo intero @(miooggetto)
    [array addObject:@(_tapCounter)];
    
    NSArray *arrayToBeSaved = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *obj1, NSNumber *obj2) {
        int value1 = obj1.intValue;
        int value2 = obj2.intValue;
        
        if(value1 == value2){
            return NSOrderedSame;
        }
        
        if(value1 < value2){
            return NSOrderedAscending;
        }
        
        // If value1 > value2
        return NSOrderedDescending;
    }];
    
    /* Vecchio skinhead codice
    [Defaults setInteger:_tapCounter forKey:stringa_key];
    [Defaults synchronize];
     */
    
    NSLog(@"Mio array -> %@", arrayToBeSaved);
    
    [Defaults setObject:arrayToBeSaved forKey:Results];
    [Defaults synchronize];
    
}

-(NSArray *)risultati{
    // Ricavo i dati salvati
    NSArray *array = [Defaults objectForKey:Results];
    
    if(array == nil){
        array = @[]; // Inizializzo un array statico
    }
    
    // Loggo la variabile "aaray"
    NSLog(@"Valori dagli userDefault -> %@", array);
    
    return array;
}

-(bool)firstAppLaunch{
    return [[NSUserDefaults standardUserDefaults] boolForKey:FirstAppLaunch];
}


@end
