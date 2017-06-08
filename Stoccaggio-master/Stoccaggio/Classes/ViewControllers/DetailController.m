//
//  DetailController.m
//  Stoccaggio
//
//  Created by Piero Silvestri on 13/02/17.
//  Copyright © 2017 MOLO17 Srl. All rights reserved.
//

#import "DetailController.h"
#import "Pacco.h"

@interface DetailController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *pacchiArray;
}

@property (weak, nonatomic) IBOutlet UILabel *titleDetail;

@end

@implementation DetailController

-(void)viewDidLoad{
    NSString *myTitle = [NSString stringWithFormat:@"Corriere: %@", _corriere.targa ];
    self.title = myTitle;
    pacchiArray = _corriere.pacchi;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _corriere.pacchi.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId= @"cellDetail";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    Pacco *mypacco = pacchiArray[indexPath.row];
    NSString *textLabel = [NSString stringWithFormat:@"Volume: %@", mypacco.codice];
    
    [cell.textLabel setText:textLabel];
    return cell;
}


@end
