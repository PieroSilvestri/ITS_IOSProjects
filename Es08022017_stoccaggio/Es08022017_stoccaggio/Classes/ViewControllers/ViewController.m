//
//  ViewController.m
//  Es08022017_stoccaggio
//
//  Created by Piero Silvestri on 08/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "ViewController.h"
#import "Pacco.h"
#import "Corriere.h"

@interface ViewController (){
    NSMutableArray *pacchi;
    NSInteger _volumeTotalePacchi;
    NSInteger _pesoTotalePacchi;
    
    Corriere *_corriere;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Pacco  *pacco = [[Pacco alloc] initWithCodice:@"00AA00" mittente:@"Piero" destinatario:@"Daniele" lunghezza:800 altezza:600 profondita:20 andMateriale:MaterialeFerro];
    
    //NSLog(@"Codice del pacco: %@", pacco);

    
    id objects[] = { @"ciao", @"Hello, World!", @42 };
    id keys[] = { @"anObject", @"helloString", @"magicNumber"};
    NSUInteger count = sizeof(id) / sizeof(id);
   // NSDictionary *dictionary = [NSDictionary init];
    
    //NSLog(@"Dictionary");
    //NSLog(@"%@", dictionary);
    
    
    
    [pacchiDictionary setValue:@"Ciao Suerz" forKey:@"MESSAGGIO"];
    NSString *messaggiosuerz = pacchiDictionary[@"MESSAGGIO"];
    NSLog(@"Messaggio: %@", messaggiosuerz);
    
    // Esercizio 1
    [self esercizio1];
    
    // Esercizio 2
    [self esercizio2];
    
    // Esercizio 3-4-5
    [self esercizio345];
    
}

-(NSInteger)getRandomNumberBetween:(NSInteger)from to:(NSInteger)to{
    return from + arc4random() % (to - from + 1);
}

- (void) randomPacchi:(int)numeroPacchi{
    
    NSInteger proviamo = (NSInteger) 123456;
    NSLog(@"Stampa: %li", proviamo);
    
    for(int i = 0; i < numeroPacchi; i++){
        NSInteger numeroRandom = [self getRandomNumberBetween:0 to:1000];
        NSString *codice = [NSString stringWithFormat:@"Cod.%li", numeroRandom];
        NSString *mittente = [NSString stringWithFormat:@"Mittente%li", numeroRandom];
        NSString *destinatario = [NSString stringWithFormat:@"Destinatario%li", numeroRandom];
        NSInteger lunghezza = [self getRandomNumberBetween:10 to:50];
        NSInteger altezza = [self getRandomNumberBetween:10 to:50];
        NSInteger profondita = [self getRandomNumberBetween:10 to:50];
        int materialeType = arc4random_uniform(2);
        
        NSInteger materiale = 0;
        
        switch(materialeType){
            case 0:
                materiale = MaterialeFerro;
                break;
            case 1:
                materiale = MaterialePlastica;
                break;
            case 2:
                materiale = MaterialeCarta;
                break;
        }
        
        NSDictionary *dictionary = @{
                                        @"codice" : codice,
                                        @"mittente" : mittente,
                                        @"destinatario" : destinatario,
                                        @"lunghezza" : @(lunghezza),
                                        @"altezza": @(altezza),
                                        @"profondita": @(profondita),
                                        @"materiale": @(materiale)
                                   };
        
        
        Pacco *mPacco = [[Pacco alloc] initWithCodice:codice
                                             mittente:mittente
                                         destinatario:destinatario
                                            lunghezza:lunghezza
                                              altezza:altezza
                                           profondita:profondita
                                         andMateriale:materiale];
        
        //NSLog(@"Inserisco il pacco numero [%i]: %@", (i + 1), mPacco.mittente);
        [pacchi addObject:dictionary];
        
        
        _volumeTotalePacchi += mPacco.volume;
        _pesoTotalePacchi += mPacco.peso;
        
    }
    
    NSLog(@"MYDICTIONARYARRAY");
    NSLog(@"%@", pacchi);
    
}

#pragma mark - Esercizio 1
-(void)esercizio1{
    pacchi = [[NSMutableArray alloc] initWithCapacity:10];
    [self randomPacchi:10];
    
    for(int a = 0; a < 10; a++){
        NSLog(@"Stampo pacco %i:\n %@ \n\n", a, [pacchi objectAtIndex:a]);
    }
}

#pragma mark - Esercizio 2

-(void)esercizio2{
    NSString *targaRandom = [NSString stringWithFormat:@"Targa%li", [self getRandomNumberBetween:10 to:50] ];
    NSInteger volumeRandom = [self getRandomNumberBetween:10 to:50];
    NSInteger caricoRandom = [self getRandomNumberBetween:10 to:50];
    
    _corriere = [[Corriere alloc] initWithTargaAndVolumeAndCarico:targaRandom
                                                           volume:volumeRandom
                                                        andCarico:caricoRandom];
    
    NSAssert(_corriere.volume > 0, @"Volume impossibile");
    NSAssert(_corriere.carico > 0, @"Carico impossibile");
    NSAssert((_corriere.targa != nil) && (_corriere.targa.length > 1), @"Targa inesistente o non valida");

}

-(void)esercizio345{
    NSLog(@"Volume totale pacchi: %li", _volumeTotalePacchi);
    NSLog(@"Peso totale pacchi: %li", _pesoTotalePacchi);
    
    NSInteger corriereRichiestiPerVolume = _volumeTotalePacchi / _corriere.volume;
    NSInteger corrieriRichiestiPerPeso = _pesoTotalePacchi / _corriere.carico;
    
    NSInteger sum = corrieriRichiestiPerPeso + corriereRichiestiPerVolume;
    
    if(sum == 0){
        NSLog(@"Nessun corriere necessario");
        NSAssert(sum > 0, @"Nessun corriere necessario");
    }
    float corriereParzialmenteVuoto;
    float percentualeOccupazioneCorriere;
    
    NSLog(@"Corrieri necessari: %li", (long)[self corrieriMaxRichiesti:corrieriRichiestiPerPeso andCorrieriPerVolume:corriereRichiestiPerVolume]);
}

-(NSInteger)corrieriMaxRichiesti:(NSInteger)corrieriPerPeso andCorrieriPerVolume:(NSInteger)corrieriPerVolume{
    // if(corrPerPeso > corrPerVol){ return corrPerPeso}else{ return corrPerVolume}
    return corrieriPerPeso > corrieriPerVolume ? corrieriPerPeso : corrieriPerVolume;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
