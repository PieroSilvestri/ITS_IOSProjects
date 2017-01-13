//
//  ViewController.m
//  SingleViewApplication
//
//  Created by Piero Silvestri on 11/01/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int _tapCounter;
    NSString *_testoIniziale;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@" 1: viewDidLoad");
    // Nib è un file d'interfaccia
    
    // Il numero del demonio
    int numero_bestia = 666;
    
    // Utilizzo i puntatori
    NSString *make = @"Ferrari";
    NSString *model = @"Spider";
    // Creo la mia NSString utilizzando un formato speciale aggiungendo un intero
    NSString *car = [make stringByAppendingFormat: @" %i %@ " , numero_bestia, model];
    
    
    
    NSLog(@"My car1: %@", car);        // Ferrari 666 Spider
    car = [make stringByAppendingFormat:@" %@", model];
    NSLog(@"My car2: %@ \n\n\n\n\nNumero: %d la bestia è tra noi.", car, numero_bestia);        // Ferrari Spider (note the space)
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *msg = [make stringByAppendingFormat: @" %i %@ " , numero_bestia, model];
    
    _testoIniziale = @"Ciao";
    
    [self updateLabel: _testoIniziale];
    
    // [self.userNameTextField setText:@"Mario"];
    [self.userNameTextField setPlaceholder:@"Inserisci il tuo nome..."];
    
    /*
    for (int i = 0; i < 10; i++) {
        NSString *string = [NSString stringWithFormat:@"Valore: %i", i];
        [self updateLabel:string];
        NSLog(@"%@", string);
    }
     */
    
    _tapCounter = 0;
    
}

-(void)updateLabel: (NSString *)nuovoTesto{
    [self.helloWorldLabel setText: nuovoTesto];
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@" 2: viewDidAppear");
}

-(void)viewWillAppear:(BOOL)animated{
    NSLog(@" 3: viewWillAppear");
}

-(void)awakeFromNib{
    [super awakeFromNib];
    NSLog(@" 4: awakeFromNib");
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@" %i", 4);
}


#pragma mark - Actions

// userNameTextField Actions:
-(IBAction)userNameTextFieldDidEndOnExit:(id)sende{
    NSLog(@"userNameTextFieldDidEndOnExit");
}

-(IBAction)userNameTextFieldEditingDidEnd:(UITextField *)sender{
    NSLog(@"userNameTextFieldEditingDidEnd");
    _testoIniziale = sender.text;
    
    [self updateLabel: _testoIniziale];
    
}

// myButton Actions:
-(IBAction)myButtonPressed:(id)sender{
    _tapCounter++;
    
    NSLog(@"Valore tapcounter: %i", _tapCounter);
    
    [self.helloWorldLabel setText:[_testoIniziale stringByAppendingFormat:@"%i", _tapCounter]];
}



@end
