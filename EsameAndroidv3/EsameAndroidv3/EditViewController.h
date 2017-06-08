//
//  EditViewController.h
//  EsameAndroidv3
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditDelegate <NSObject>

-(void)updateObject:(NSInteger) indexRow dictionary:(NSDictionary *)dictionaryUpdate;

@end


@interface EditViewController : UIViewController

@property (nonatomic, weak) id<EditDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *surnameTextField;
@property (weak, nonatomic) IBOutlet UITextField *idTextField;

- (IBAction)nameDidEndOnExit:(id)sender;

- (IBAction)savePressed:(id)sender;

@property (nonatomic, weak) NSDictionary *myDictionaryPassed;
@property (nonatomic) NSInteger indiceArray;

@end
