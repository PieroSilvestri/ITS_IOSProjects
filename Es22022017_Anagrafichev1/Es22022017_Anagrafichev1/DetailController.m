//
//  DetailController.m
//  Es22022017_Anagrafichev1
//
//  Created by Piero Silvestri on 22/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "DetailController.h"
#import "TableViewController.h"

@interface DetailController (){
    NSString *nomePersona;
    NSString *cognomePersona;
}
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;

@end

@implementation DetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    nomePersona = _namesArray[_indexRowPassed];
    cognomePersona = _surnamesArray[_indexRowPassed];
    _nameTextField.placeholder = nomePersona;
    [_surnameTextField setPlaceholder: cognomePersona];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonStopPressed:(id)sender{
    
    
    NSString *message = [NSString stringWithFormat:@"Vuoi cancellare %@ %@?", nomePersona, cognomePersona];

    UIAlertController *alertViewController = [UIAlertController alertControllerWithTitle: @"ATTENZIONE!" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *siAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Si ACTION PREMUTA");
        
        [self.delegate cancellArray:_indexRowPassed];
        [self.navigationController popViewControllerAnimated:YES];
        //salva  il risultato
        
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"Annulla" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action){
        NSLog(@"Annulla ACTION PREMUTA");
        //salva  il risultato
        
    }];
    
    [alertViewController addAction:siAction];
    [alertViewController addAction:noAction];
    
    [self presentViewController:alertViewController animated:true completion:nil];

}
- (IBAction)nameTextField:(id)sender {
    NSLog(@"Ciao");
}

-(IBAction)buttonAnnullaPressed:(id)sender{
    NSLog(@"Hai premuto annulla");
    [self.navigationController popViewControllerAnimated:YES];

}
-(IBAction)buttonSalvaPressed:(id)sender{
    NSLog(@"Hai premuto salva");
    [self.delegate addObjectArray:_nameTextField.text :_surnameTextField.text];
    [self.navigationController popViewControllerAnimated:YES];

}
-(IBAction)buttonModificaPressed:(id)sender{
    NSLog(@"Hai premuto modifica");
    [self.delegate updateArray:_indexRowPassed :_nameTextField.text :_surnameTextField.text];
    [self.navigationController popViewControllerAnimated:YES];

}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    [segue destinationViewController];
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"detailSegueID"])
    {
        // Get reference to the destination view controller
        TableViewController *tvc = [segue destinationViewController];
        tvc.nomiArray = _namesArray.mutableCopy;
        tvc.cognomiArray = _surnamesArray.mutableCopy;
        
        // Pass any objects to the view controller here, like...
        
    }
    
}


@end
