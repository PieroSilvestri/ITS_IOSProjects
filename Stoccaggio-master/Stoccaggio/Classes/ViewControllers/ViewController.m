//
//  ViewController.m
//  Stoccaggio
//
//  Created by Daniele Angeli on 08/02/17.
//  Copyright © 2017 MOLO17 Srl. All rights reserved.
//

#import "ViewController.h"
#import "DetailController.h"

#import "Pacco.h"
#import "Corriere.h"

#define NumeroCorrieri 10
#define NumeroPacchiEsercizio1 10

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSInteger score;
    NSObject *date;
    
    NSInteger _volumeTotalePacchi;
    NSInteger _pesoTotalePacchi;
    
    Corriere *_corriere;
    NSMutableArray *_corriereArray;
    NSMutableArray *arrayDiPacchi;
}

//@property (nonatomic, strong) 

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _corriereArray = @[].mutableCopy;
    arrayDiPacchi = @[].mutableCopy;
    // Do any additional setup after loading the view, typically from a nib.
    
//    Pacco *pacco = [[Pacco alloc] initWithCodice:@"000001"
//                                        mittente:@"Matteo"
//                                    destinatario:@"Daniele"
//                                       lunghezza:100
//                                         altezza:100
//                                      profondita:100
//                                    andMateriale:MaterialePlastica];
    
//    NSLog(@"descrizione del pacco: %@", pacco);
    
    // genero i pacchi necessari per l'esercizio 1
    [self generaPacchi];
    
    // avvio esercizio numero 2
    [self esercizio2];
    
    // avvio esercizio numero 3-4-5
    [self esercizio345];
    
    [self corrieriArraySetup];
    
    [[self tableView] reloadData];
    
}


#pragma mark - Esercizio 1

-(NSInteger)getRandomNumberBetween:(NSInteger)from to:(NSInteger)to {
    return from + arc4random() % (to - from+1);
}

-(void)generaPacchi {
    
    for (int i = 0; i < NumeroPacchiEsercizio1; i++) {
        NSString *codiceRandom = [NSString stringWithFormat:@"%li",
                                  [self getRandomNumberBetween:111111 to:999999]];
        NSInteger lunghezzaRandom = [self getRandomNumberBetween:10 to:50];
        NSInteger altezzaRandom = [self getRandomNumberBetween:10 to:50];
        NSInteger profonditaRandom = [self getRandomNumberBetween:10 to:50];
        NSInteger materialeRandom = [self getRandomNumberBetween:0 to:2];
        
        Pacco *pacco = [[Pacco alloc] initWithCodice:codiceRandom
                                            mittente:@"Daniele"
                                        destinatario:@"Maurizio"
                                           lunghezza:lunghezzaRandom
                                             altezza:altezzaRandom
                                          profondita:profonditaRandom
                                        andMateriale:materialeRandom];
        
        NSAssert(pacco.peso > 0, @"Pacco con peso non possibile");
        
        [arrayDiPacchi addObject:pacco];
        
        _volumeTotalePacchi += pacco.volume;
        _pesoTotalePacchi += pacco.peso;
    }
    
    NSLog(@"Numero pacchi generati: %lu", (unsigned long)arrayDiPacchi.count);
    
    NSAssert((arrayDiPacchi.count == NumeroPacchiEsercizio1), @"numero pacchi errato");
}

#pragma mark - Esercizio 2

-(Corriere *)esercizio2 {
    // targa del corriere
    NSString *codiceRandom = [NSString stringWithFormat:@"%li",
                              [self getRandomNumberBetween:111111 to:999999]];
    // volume del corriere
    NSInteger volumeCorriere = [self getRandomNumberBetween:10000 to:100000];
    
    // carico massimo del corriere
    NSInteger caricoCorriere = [self getRandomNumberBetween:10000 to:100000];
    
    _corriere = [[Corriere alloc] initWithTarga:codiceRandom
                                         volume:volumeCorriere
                                      carico:caricoCorriere
                                        andPacchi:arrayDiPacchi];
    
    // valido se il corriere esiste
    NSAssert(_corriere != nil, @"Corriere inestistente");
    
    // volume maggiore di 0
    NSAssert(_corriere.volume > 0, @"Volume impossibile");
    
    // carico maggiore di 0
    NSAssert(_corriere.carico > 0, @"Carico impossibile");
    
    // targa esistente e con almeno 1 carattere
    NSAssert((_corriere.targa != nil) && (_corriere.targa.length > 1), @"Targa inesistente o non valida");
    
    //NSLog(@"Corriere generato: %@", _corriere);
    
    return _corriere;
}

#pragma mark - Esercizio 3 + 4 + 5

-(void)esercizio345 {
    //NSLog(@"volume totale pacchi: %li", _volumeTotalePacchi);
    //NSLog(@"peso totale pacchi: %li", _pesoTotalePacchi);
    
    NSInteger corrieriRichiestiPerVolume = _volumeTotalePacchi / _corriere.volume;
    NSInteger corrieriRichiestiPerPeso = _pesoTotalePacchi / _corriere.carico;
    
    NSInteger sum = corrieriRichiestiPerVolume + corrieriRichiestiPerPeso;
    NSAssert(sum > 0, @"Nessun corriere necessario?!");
    
    float corriereParzialmenteVuoto;
    float percentualeOccupazioneCorriere;
    
    if (corrieriRichiestiPerPeso > corrieriRichiestiPerVolume) {
        corriereParzialmenteVuoto = _pesoTotalePacchi / _corriere.carico;
        percentualeOccupazioneCorriere = (corriereParzialmenteVuoto-corrieriRichiestiPerPeso) *100;
    } else {
        corriereParzialmenteVuoto = _volumeTotalePacchi / _corriere.volume;
        percentualeOccupazioneCorriere = (corriereParzialmenteVuoto-corrieriRichiestiPerVolume) *100;
    }
    
    NSLog(@"corrieri necessari: %li", (long)[self corrieriMaxRichiesti:corrieriRichiestiPerPeso andCorrieriPerVolume:corrieriRichiestiPerVolume]);
}

-(NSInteger)corrieriMaxRichiesti:(NSInteger)corrieriPerPeso andCorrieriPerVolume:(NSInteger)corrieriPerVolume {
    return (corrieriPerPeso > corrieriPerVolume) ? corrieriPerPeso : corrieriPerVolume;
}

#pragma mark - Esercizio table

-(void)corrieriArraySetup{
    for(int i = 0; i < NumeroCorrieri; i++){
        Corriere *mycorriere = [self esercizio2];
        //NSLog(@"Corriere: \n%@", mycorriere);
        [_corriereArray addObject:mycorriere];
    }
}

#pragma mark - UITableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _corriereArray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    Corriere *mycorriere = _corriereArray[indexPath.row];
    NSString *textLabel = [NSString stringWithFormat:@"Corriere: %@", mycorriere.targa];
    
    [cell.textLabel setText:textLabel];
    return cell;
}

-(void)tableView:(UITableView *)tableView canEditRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Deseleziono la row quando la premo
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    //where indexPath.row is the selected cell
    Corriere *mycorriere = _corriereArray[indexPath.row];
    NSLog(@"Hai premuto: %@", mycorriere.pacchi);
    
    DetailController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"pacchiViewController"];
    [viewController setCorriere:mycorriere];
    [self.navigationController pushViewController:viewController animated:true];
}

@end
