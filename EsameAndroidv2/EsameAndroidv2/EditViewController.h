//
//  EditViewController.h
//  EsameAndroidv2
//
//  Created by Piero Silvestri on 01/03/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol EditDelegate <NSObject>
    -(void)updateObject:(NSInteger) indexRow :(NSDictionary *)dictionaryUpdate;
    -(void)addObjectToArray:(NSDictionary *)dictionaryAdd;
@end

@interface EditViewController : UIViewController

@property (nonatomic, weak) id<EditDelegate> delegate;


@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (nonatomic) NSInteger indexPassed;

@property (nonatomic, weak) NSDictionary *dictionaryPassed;

@end
