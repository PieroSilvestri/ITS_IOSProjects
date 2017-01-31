//
//  ViewController.m
//  Calcolatrice v1
//
//  Created by Piero Silvestri on 29/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

#define myTextFieldSelf self.myTextField

@interface ViewController (){
    NSString *_valoreAttuale;
    NSString *_valoreSecondo;
    double _primoValore;
    double _secondoValore;
    char segno;
    Boolean myFlag; // Funziona appena inserisco un nuovo valore dopo il più
    Boolean firstNumber;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _valoreAttuale = @"0.0";
    _valoreSecondo = @"";
    myFlag = false;
    [self.myTextField setText:_valoreAttuale];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - My Functions

-(void)updateTextField:(NSString *)newValue{
    if([_valoreAttuale  isEqualToString: @"0.0"] || [_valoreAttuale isEqualToString:@"0"]){
        _valoreAttuale = newValue;
    }else{
        if([newValue isEqualToString:@"+"]){
            _primoValore = [_valoreAttuale doubleValue];
            segno = '+';
            myFlag = true;
        }
        if([newValue isEqualToString:@"-"]){
            _primoValore = [_valoreAttuale doubleValue];
            segno = '-';
            myFlag = true;
        }
        if([newValue isEqualToString:@"x"]){
            _primoValore = [_valoreAttuale doubleValue];
            segno = 'x';
            myFlag = true;
        }
        if([newValue isEqualToString:@"/"]){
            _primoValore = [_valoreAttuale doubleValue];
            segno = '/';
            myFlag = true;
        }
        if([newValue isEqualToString:@"="]){
            NSLog(@"ANCHE QUI PRENDE");
            _secondoValore = [_valoreAttuale doubleValue];
        }else{
            _valoreAttuale = [_valoreAttuale stringByAppendingString:newValue];
        }
    }
    [myTextFieldSelf setText:_valoreAttuale];
    if([newValue isEqualToString:@"="]){
        NSString *risultato;
        switch(segno){
                case '+':
                    risultato = [NSString stringWithFormat:@"%f", (_primoValore + _secondoValore)];
                    break;
                case '-':
                    risultato = [NSString stringWithFormat:@"%f", (_primoValore - _secondoValore)];
                    break;
                case 'x':
                    risultato = [NSString stringWithFormat:@"%f", (_primoValore * _secondoValore)];
                    break;
                case '/':
                    risultato = [NSString stringWithFormat:@"%f", (_primoValore / _secondoValore)];
                    break;
        }
        _valoreAttuale = risultato;
        [myTextFieldSelf setText:_valoreAttuale];
    }
    if(myFlag){
        _valoreAttuale = @"";
        myFlag = false;
    }
    
}

#pragma mark - Actions

-(IBAction)button0Pressed:(id)sender{
    [self updateTextField:@"0"];
}
-(IBAction)button1Pressed:(id)sender{
    [self updateTextField:@"1"];
}
-(IBAction)button2Pressed:(id)sender{
    [self updateTextField:@"2"];
}
-(IBAction)button3Pressed:(id)sender{
    [self updateTextField:@"3"];
}
-(IBAction)button4Pressed:(id)sender{
    [self updateTextField:@"4"];
}
-(IBAction)button5Pressed:(id)sender{
    [self updateTextField:@"5"];
}
-(IBAction)button6Pressed:(id)sender{
    [self updateTextField:@"6"];
}
-(IBAction)button7Pressed:(id)sender{
    [self updateTextField:@"7"];
}
-(IBAction)button8Pressed:(id)sender{
    [self updateTextField:@"8"];
}
-(IBAction)button9Pressed:(id)sender{
    [self updateTextField:@"9"];
}
-(IBAction)buttonPuntoPressed:(id)sender{
    [self updateTextField:@"."];
}
-(IBAction)buttonEqualsPressed:(id)sender{
    
    [self updateTextField:@"="];
}
-(IBAction)buttonVirgolaPressed:(id)sender{
    [self updateTextField:@","];
}
-(IBAction)buttonPiuPressed:(id)sender{
    [self updateTextField:@"+"];
}
-(IBAction)buttonMenoPressed:(id)sender{
    [self updateTextField:@"-"];
}
-(IBAction)buttonPerPressed:(id)sender;{
    [self updateTextField:@"x"];
}
-(IBAction)buttonDivisoPressed:(id)sender{
    [self updateTextField:@"/"];
}
-(IBAction)buttonCEPressed:(id)sender{
    _valoreAttuale = @"0";
    [self.myTextField setText:@"0.0"];
}








@end
