//
//  Pacco.m
//  Es08022017_stoccaggio
//
//  Created by Piero Silvestri on 08/02/17.
//  Copyright © 2017 Piero Silvestri. All rights reserved.
//

#import "Pacco.h"
#import "Utils.h"


@implementation Pacco

-(id)initWithCodice:(NSString *)codice mittente:(NSString *)mittente destinatario:(NSString *)destinatario lunghezza:(NSInteger)lunghezza altezza:(NSInteger)altezza profondita:(NSInteger)profondita andMateriale:(Materiale)materiale{
    // Chiamo il costruttore del mio oggetto da cui eredito (in questo caso NSObject
    self = [super init];
    
    // Controllo se il costruttore padre ha allocato il mio oggetto
    if(self){
        // TODO
        // Se tutto è ok procedo con l'inizializzazione delle mie properties
        _codice = codice;
        _mittente = mittente;
        _lunghezza = lunghezza;
        _altezza = altezza;
        _profondita = profondita;
        _materiale = materiale;
    }
    
    
    return self;
}

-(NSInteger)volume{
    return 100;
}

-(NSInteger)peso {
    NSInteger pesoSpecifico = 0;
    
    switch(_materiale){
        case MaterialeFerro:
            pesoSpecifico = kPesoSpecificoFerro;
            break;
        case MaterialeCarta:
            pesoSpecifico = kPesoSpecificoCarta;
            break;
        case MaterialePlastica:
            pesoSpecifico = kPesoSpecificoPlastica;
            break;
    }
    
    return pesoSpecifico;
}

#pragma mark - Overrides

-(NSString *)description {
    NSString *newDescription = [NSString localizedStringWithFormat:@"%@\nCodice:%@\nMittente: %@\nDestinatario: %@\nLughezza: %li\nAltezza: %li\nProfondita: %li\nMateriale: %li",
                                [super description],
                                self.codice,
                                self.mittente,
                                self.destinatario,
                                self.lunghezza,
                                self.altezza,
                                self.profondita,
                                self.materiale];
    
    return newDescription;
}

@end
