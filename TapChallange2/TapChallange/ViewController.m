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

@interface ViewController (){
    int _tapCounter;
    int _timeCount;
    
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
            NSLog(@"OK action premuto");
        }];
        
        
        [alertViewController addAction:okAction];
        [self presentViewController:alertViewController animated:true completion:nil];
        
        [self initializeGame];
    }

}


@end
