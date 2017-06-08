//
//  DetailController.h
//  Es22022017_Anagrafichev1
//
//  Created by Piero Silvestri on 22/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailDelegate <NSObject>
-(void)cancellArray:(long) indexRow;
-(void)updateArray:(long) indexRoe :(NSString *)nomeUpdate :(NSString *)cognomeUpdate;
-(void)addObjectArray:(NSString *)nomeAdd :(NSString *)cognomeAdd;

@end

@interface DetailController : UIViewController

@property (nonatomic, weak) id<DetailDelegate> delegate;

@property (nonatomic) long indexRowPassed;
@property (nonatomic) NSMutableArray *namesArray;
@property (nonatomic) NSMutableArray *surnamesArray;


-(IBAction)buttonStopPressed:(id)sender;
-(IBAction)buttonAnnullaPressed:(id)sender;
-(IBAction)buttonSalvaPressed:(id)sender;
-(IBAction)buttonModificaPressed:(id)sender;



@end
