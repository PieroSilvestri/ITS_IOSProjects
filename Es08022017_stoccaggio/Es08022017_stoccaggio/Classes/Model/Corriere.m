//
//  Corriere.m
//  Es08022017_stoccaggio
//
//  Created by Piero Silvestri on 10/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "Corriere.h"

@implementation Corriere

-(id)initWithVolume:(NSInteger)volume andCarico:(NSInteger)carico{
    self = [super init];
    if(self){
        _volume = volume;
    }
    
    return self;
}

-(id)initWithTargaAndVolumeAndCarico:(NSString *)targa volume:(NSInteger)volume andCarico:(NSInteger)carico{
    self = [super init];
    
    if(self){
        _targa = targa;
        _volume = volume;
        _carico = carico;
    }
    
    return self;
}

@end
