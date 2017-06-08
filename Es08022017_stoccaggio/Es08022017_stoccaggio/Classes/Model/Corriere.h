//
//  Corriere.h
//  Es08022017_stoccaggio
//
//  Created by Piero Silvestri on 10/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Corriere : NSObject

-(id)initWithVolume:(NSInteger)volume andCarico:(NSInteger)carico;
-(id)initWithTargaAndVolumeAndCarico:(NSString *)targa volume:(NSInteger)volume andCarico:(NSInteger)carico;

@property(nonatomic, readonly) NSString *targa;
@property(nonatomic, readonly) NSInteger volume;
@property(nonatomic, readonly) NSInteger carico;

@end
