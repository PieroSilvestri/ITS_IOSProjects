//
//  Corriere.m
//  Stoccaggio
//
//  Created by Daniele Angeli on 10/02/17.
//  Copyright © 2017 MOLO17 Srl. All rights reserved.
//

#import "Corriere.h"

@implementation Corriere

-(id)initWithTarga:(NSString *)targa volume:(NSInteger)volume carico:(NSInteger)carico andPacchi:(NSArray *)pacchi{
    self = [super init];
    
    if (self) {
        _targa = targa;
        _volume = volume;
        _carico = carico;
        _pacchi = pacchi;
    }
    
    return self;
}

#pragma mark - Overrides

-(NSString *)description {
    return [NSString stringWithFormat:@"%@\nTarga: %@\nVolume: %li\nCarico: %li \nPacchi: %@",
            [super description],
            self.targa,
            self.volume,
            self.carico/1000,
            self.pacchi
            ];
}

@end
