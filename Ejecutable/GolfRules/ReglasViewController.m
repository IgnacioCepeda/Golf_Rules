//
//  ReglasViewController.m
//  GolfRules
//
//  Created by Dacodes on 25/09/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import "ReglasViewController.h"
#import "ReglasTableViewCell.h"
#import "UIImage+deviceSpecificMedia.h"
#import "EspecificacionesViewController.h"

@interface ReglasViewController ()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>{
    NSArray*reglas;
    NSArray*secciones;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;

@end

@implementation ReglasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.ruleTitle;
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    self.myTableView.backgroundColor=[UIColor clearColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    self.backImage.image = [UIImage imageForDeviceWithName:@"fondogolf"];
    self.myTableView.hidden=YES;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(NSEC_PER_SEC/8)), dispatch_get_main_queue(), ^{
        self.myTableView.hidden=NO;
        self.myTableView.alpha=0.0f;
        [UIView animateWithDuration:.5 animations:^{
            self.myTableView.alpha=1.0f;
        }];
    });
    
    secciones=@[@[@"Reglas básicas",@"Dropear"],@[@"Antes de tirar",@"Poniendo la bola y tirando",@"Después de tirar"],@[@"Antes de tirar",@"Al tirar",@"Situaciones malas/alivio"],@[@"Situaciones malas/alivio",@"Antes de tirar",@"Al tirar"],@[@"Conceptos Básicos",@"Situaciones malas/alivio",@"Antes de tirar",@"Al tirar"],@[@"Conceptos Básicos",@"Bola provisional"],@[@"Situaciones malas/alivio",@"Antes del putt",@"Después del putt"],@[@"... causa ajena",@"... el jugador o su equipo",@"Una eventualidad del juego"],@[@"... la bandera o a quien la atiende",@"Diversos"]];
    
    reglas=@[@{@"Reglas básicas":@[@{@"nombre":@"Jugar la bola como reposa",
                                     @"imagen":@"0.png"},
                                   @{@"nombre":@"En caso de duda",
                                     @"imagen":@"1.png"},
                                   @{@"nombre":@"Siempre embocar la bola y no cambiarla",
                                     @"imagen":@"2.png"},
                                   @{@"nombre":@"Bola dañada",
                                     @"imagen":@"3.png"},
                                   @{@"nombre":@"Consejo y línea de juego",
                                     @"imagen":@"13.png"},
                                   @{@"nombre":@"Caddie",
                                     @"imagen":@"5.png"},
                                   @{@"nombre":@"Practicar en el campo",
                                     @"imagen":@"6.png"},
                                   @{@"nombre":@"Interrupción del juego/tormenta",
                                     @"imagen":@"7.png"}],
               @"Dropear":@[@{@"nombre":@"Dropear correctamente",
                              @"imagen":@"8.png"},
                           @{@"nombre":@"¿Cuándo volver a dropear?",
                             @"imagen":@"9.png",
                             @"video":@"0"},
                           @{@"nombre":@"Dropear en lugar equivocado",
                             @"imagen":@"11.png"},
                           @{@"nombre":@"Dropear de manera incorrecta",
                             @"imagen":@"12.png"}]},
             @{@"Antes de tirar":@[@{@"nombre":@"Preparativos/retraso",
                                                               @"imagen":@"14.png"},
                                                             @{@"nombre":@"Máximo 14 palos",
                                                               @"imagen":@"15.png"},
                                                             @{@"nombre":@"Honor/orden de juego",
                                                               @"imagen":@"16.png"},
                                                             @{@"nombre":@"Consejo y línea de juego",
                                                               @"imagen":@"17.png"},
                                                             @{@"nombre":@"Practique el chip y el putt",
                                                               @"imagen":@"18.png"}],
               @"Poniendo la bola y tirando":@[@{@"nombre":@"La mesa de salida",
                                                 @"imagen":@"19.png"},
                                               @{@"nombre":@"Marcas de la mesa de salida",
                                                 @"imagen":@"20.png"},
                                               @{@"nombre":@"Aliviarse",
                                                 @"imagen":@"21.png"},
                                               @{@"nombre":@"Bola que se cae del tee",
                                                 @"imagen":@"22.png"},
                                               @{@"nombre":@"Golpe al aire - \"Paloma\"",
                                                 @"imagen":@"23.png"}],
               @"Después de tirar":@[@{@"nombre":@"Jugar fuera de turno",
                                        @"imagen":@"24.png"},
                                      @{@"nombre":@"Jugar fuera de la mesa de salida",
                                        @"imagen":@"25.png"},
                                      @{@"nombre":@"Jugar desde una mesa de salida equivocada",
                                        @"imagen":@"26.png"},
                                      @{@"nombre":@"Bola que puede estar perdida/bola provisional",
                                        @"imagen":@"27.png"}]},
             @{@"Antes de tirar":@[@{@"nombre":@"¿Qué es \"recorrido\"?",
                                      @"imagen":@"28.png"},
                                    @{@"nombre":@"Orden de juego",
                                      @"imagen":@"24.png"},
                                    @{@"nombre":@"No romper ni doblar",
                                      @"imagen":@"29.png"},
                                    @{@"nombre":@"Buscando la bola/bola perdida",
                                      @"imagen":@"30.png"},
                                    @{@"nombre":@"Identificación de la bola",
                                      @"imagen":@"31.png"},
                                    @{@"nombre":@"Bola movida durante la búsqueda",
                                      @"imagen":@"32.png"},
                                    @{@"nombre":@"Bola movida a consecuencia de un swing de práctica",
                                      @"imagen":@"33.png"},
                                    @{@"nombre":@"Bola movida al preparar el tiro",
                                      @"imagen":@"34.png"},
                                    @{@"nombre":@"Causa ajena que mueve o se lleva la bola",
                                      @"imagen":@"35.png"},
                                    @{@"nombre":@"Consejo y línea de juego",
                                      @"imagen":@"17.png"}],
               @"Situaciones malas/alivio":@[@{@"nombre":@"Impedimentos sueltos",
                                               @"imagen":@"36.png"},
                                             @{@"nombre":@"Obstrucciones movibles",
                                               @"imagen":@"37.png"},
                                             @{@"nombre":@"Obstrucciones inamovibles",
                                               @"imagen":@"38.png",
                                               @"video":@"1"},
                                             @{@"nombre":@"Condiciones anormales del terreno",
                                               @"imagen":@"39.png",
                                               @"video":@"2"},
                                             @{@"nombre":@"Bola perdida en una condición anormal del terreno",
                                               @"imagen":@"40.png",
                                               @"video":@"3"},
                                             @{@"nombre":@"Green equivocado",
                                               @"imagen":@"41.png"},
                                             @{@"nombre":@"Bola empotrada",
                                               @"imagen":@"42.png"},
                                             @{@"nombre":@"Bola junto a otra bola",
                                               @"imagen":@"43.png"},
                                             @{@"nombre":@"Divots, zonas sin pasto, etc",
                                               @"imagen":@"44.png"},
                                             @{@"nombre":@"Bola injugable",
                                               @"imagen":@"45.png",
                                               @"video":@"4"}],
               @"Al tirar":@[@{@"nombre":@"Orden de juego equivocado",
                                        @"imagen":@"24.png"},
                                      @{@"nombre":@"Bola equivocada/confundir la bola",
                                        @"imagen":@"46.png",
                                        @"video":@"5"},
                                      @{@"nombre":@"Bola que golpea una causa ajena",
                                        @"imagen":@"47.png"},
                                      @{@"nombre":@"Bola que golpea al jugador o a su equipo",
                                        @"imagen":@"48.png"},
                                      @{@"nombre":@"Golpe múltiple",
                                        @"imagen":@"49.png"},
                                      @{@"nombre":@"Bola puede estar perdida/bola provisional",
                                        @"imagen":@"50.png"}]},
             @{@"Antes de tirar":@[@{@"nombre":@"Delimitación",
                                      @"imagen":@"51.png"},
                                    @{@"nombre":@"No tocar o probar la arena",
                                      @"imagen":@"52.png"},
                                    @{@"nombre":@"Bola perdida en la arena",
                                      @"imagen":@"53.png"},
                                    @{@"nombre":@"Identificación de la bola",
                                      @"imagen":@"54.png"},
                                    @{@"nombre":@"Consejo y línea de juego",
                                      @"imagen":@"55.png"}],
               @"Situaciones malas/alivio":@[@{@"nombre":@"Impedimentos sueltos",
                                               @"imagen":@"56.png"},
                                             @{@"nombre":@"Obstrucciones movibles",
                                               @"imagen":@"57.png"},
                                             @{@"nombre":@"Condiciones anormales del terreno",
                                               @"imagen":@"58.png",
                                               @"video":@"6"},
                                             @{@"nombre":@"Arena completamente inundada",
                                               @"imagen":@"59.png"},
                                             @{@"nombre":@"Bola junto a otra bola",
                                               @"imagen":@"60.png"},
                                             @{@"nombre":@"Antiguas huellas, bola empotrada, etc.",
                                               @"imagen":@"61.png"},
                                             @{@"nombre":@"Bola injugable",
                                               @"imagen":@"62.png",
                                               @"video":@"7"}],
               @"Al tirar":@[@{@"nombre":@"Bola equivocada/confundir la bola",
                                        @"imagen":@"63.png"},
                                      @{@"nombre":@"Bola que golpea una causa ajena",
                                        @"imagen":@"64.png"},
                                      @{@"nombre":@"Bola que golpea al jugador o a su equipo",
                                        @"imagen":@"65.png"},
                                      @{@"nombre":@"Bola que no sale de la arena y queda en las huellas de sus propios pies",
                                        @"imagen":@"66.png"},
                                      @{@"nombre":@"Bola que no sale de la arena y queda en otro lugar dentro del mismo bunker",
                                        @"imagen":@"67.png"},
                                      @{@"nombre":@"Golpe múltiple",
                                        @"imagen":@"68.png"},
                                      @{@"nombre":@"Bola fuera de límites/bola perdida",
                                        @"imagen":@"69.png"}]},
             @{@"Conceptos Básicos":@[@{@"nombre":@"Delimitación",
                               @"imagen":@"70.png"},
                             @{@"nombre":@"Buscando la bola/bola movida durante la búsqueda",
                               @"imagen":@"71.png"},
                             @{@"nombre":@"Identificación de la bola",
                               @"imagen":@"72.png"},
                             @{@"nombre":@"No encontrar la bola",
                               @"imagen":@"73.png"},
                             @{@"nombre":@"Bola en un obstáculo de agua - opciones",
                               @"imagen":@"74.png"},
                             @{@"nombre":@"Regla de obstáculo de agua \"frontal\" (amarillo)",
                               @"imagen":@"74.png",
                               @"video":@"8"},
                             @{@"nombre":@"Regla de obstáculo de agua lateral (roja)",
                               @"imagen":@"75.png",
                               @"video":@"9"}],
               @"Situaciones malas/alivio":@[@{@"nombre":@"Impedimentos sueltos",
                                               @"imagen":@"78.png"},
                                             @{@"nombre":@"Obstrucciones movibles",
                                               @"imagen":@"79.png"},
                                             @{@"nombre":@"Obstrucciones inamovibles",
                                               @"imagen":@"80.png"},
                                             @{@"nombre":@"Condiciones anormales del terreno",
                                               @"imagen":@"81.png"},
                                             @{@"nombre":@"Bola junto a otra bola",
                                               @"imagen":@"60.png"},
                                             @{@"nombre":@"Bola injugable",
                                               @"imagen":@"82.png"}],
               @"Antes de tirar":@[@{@"nombre":@"No apoyar el bastón",
                                     @"imagen":@"76.png"},
                                   @{@"nombre":@"Consejo y línea de juego",
                                     @"imagen":@"77.png"}],
               @"Al tirar":@[@{@"nombre":@"Bola equivocada jugada desde el agua",
                                        @"imagen":@"83.png"},
                                                         @{@"nombre":@"Bola jugada desde el agua y que cae otra vez al agua",
                                                           @"imagen":@"84.png"},
                                                         @{@"nombre":@"Bola jugada desde el agua y que golpea causa ajena",
                                                           @"imagen":@"85.png"},
                                                         @{@"nombre":@"Bola jugada desde el agua y que golpea al jugador o a su equipo",
                                                           @"imagen":@"86.png"},
                                                         @{@"nombre":@"Golpe múltiple",
                                                           @"imagen":@"87.png"}]},
             @{@"Conceptos Básicos":@[@{@"nombre":@"Delimitación",
                                       @"imagen":@"88.png"},
                                     @{@"nombre":@"Bola fuera de límites",
                                       @"imagen":@"89.png",
                                       @"video":@"11"},
                                     @{@"nombre":@"Jugador fuera de límites pero bola dentro del campo",
                                       @"imagen":@"90.png"}],
               @"Bola provisional":@[@{@"nombre":@"Jugar una bola provisional",
                                       @"imagen":@"91.png"},
                                     @{@"nombre":@"Bola provisional no \"anunciada\"",
                                       @"imagen":@"92.png"},
                                     @{@"nombre":@"Bola provisional en perfecta situación",
                                       @"imagen":@"93.png"},
                                     @{@"nombre":@"Bola provisional jugada más cerca del hoyo que el supuesto lugar de la bola original",
                                       @"imagen":@"94.png",
                                       @"video":@"10"},
                                     @{@"nombre":@"Bola original encontrada ... dentro de límites",
                                       @"imagen":@"95.png"},
                                     @{@"nombre":@"Bola original encontrada ... pero injugable",
                                       @"imagen":@"96.png"},
                                     @{@"nombre":@"Bola original fuera de límites o imposible de encontrar",
                                       @"imagen":@"97.png"}]},
             @{@"Situaciones malas/alivio":@[@{@"nombre":@"Impactos y marcas de spikes",
                                               @"imagen":@"128.png"},
                                             @{@"nombre":@"Bola empotrada",
                                               @"imagen":@"129.png"},
                                             @{@"nombre":@"Impedimentos sueltos",
                                               @"imagen":@"130.png"},
                                             @{@"nombre":@"Obstrucciones movibles",
                                               @"imagen":@"131.png"},
                                             @{@"nombre":@"Aspersor",
                                               @"imagen":@"132.png"},
                                             @{@"nombre":@"Charcos y otras condiciones anormales de terreno",
                                               @"imagen":@"133.png"},
                                             @{@"nombre":@"Green doble",
                                               @"imagen":@"134.png"}],
               @"Antes del putt":@[@{@"nombre":@"Green y barbas de green",
                                     @"imagen":@"111.png"},
                                   @{@"nombre":@"Green equivocado",
                                     @"imagen":@"112.png"},
                                   @{@"nombre":@"Bola atascada entre la bandera y el borde del hoyo",
                                     @"imagen":@"113.png"},
                                   @{@"nombre":@"Orden de juego",
                                     @"imagen":@"114.png"},
                                   @{@"nombre":@"No probar el green",
                                     @"imagen":@"115.png"},
                                   @{@"nombre":@"No mejorar la línea de putt",
                                     @"imagen":@"116.png"},
                                   @{@"nombre":@"Marcar y levantar la bola",
                                     @"imagen":@"117.png"},
                                   @{@"nombre":@"Bola movida al marcarla",
                                     @"imagen":@"118.png"},
                                   @{@"nombre":@"Desplazar el marcador de bola",
                                     @"imagen":@"119.png"},
                                   @{@"nombre":@"Bola marcada por otra persona",
                                     @"imagen":@"120.png"},
                                   @{@"nombre":@"Bola equivocada/confundir la bola",
                                     @"imagen":@"121.png"},
                                   @{@"nombre":@"Bola dañada",
                                     @"imagen":@"122.png"},
                                   @{@"nombre":@"Bola movida al hacer un swing de práctica",
                                     @"imagen":@"123.png"},
                                   @{@"nombre":@"Bola en reposo movida por una causa ajena",
                                     @"imagen":@"124.png"},
                                   @{@"nombre":@"Consejo y línea de juego",
                                     @"imagen":@"125.png"},
                                   @{@"nombre":@"Putt mal ejecutado",
                                     @"imagen":@"126.png"},
                                   @{@"nombre":@"Protección contra el viento y la lluvia",
                                     @"imagen":@"127.png"}],
               @"Después del putt":@[@{@"nombre":@"Jugar fuera de turno",
                                     @"imagen":@"135.png"},
                                   @{@"nombre":@"Jugar bola equivocada en green",
                                     @"imagen":@"136.png"},
                                   @{@"nombre":@"Puttear desde un lugar equivocado",
                                     @"imagen":@"137.png"},
                                   @{@"nombre":@"Bola que golpea otra bola",
                                     @"imagen":@"107.png.png"},
                                   @{@"nombre":@"Bola que golpea la bandera o a quien la atiende",
                                     @"imagen":@"138.png"},
                                   @{@"nombre":@"Bola desviada por un marcador de bola",
                                     @"imagen":@"139.png"},
                                   @{@"nombre":@"Bola que golpea a un animal o a una causa ajena",
                                     @"imagen":@"140.png"},
                                   @{@"nombre":@"Bola que golpea a otro jugador",
                                     @"imagen":@"141.png"},
                                   @{@"nombre":@"Bola en el borde del hoyo",
                                     @"imagen":@"142.png"},
                                   @{@"nombre":@"Bola que se sale del hoyo",
                                     @"imagen":@"143.png"},
                                   @{@"nombre":@"Putt \"dado\"/bola no embocada",
                                     @"imagen":@"144.png"},
                                   @{@"nombre":@"Repetir el putt y el chipp",
                                     @"imagen":@"145.png"}]},
             @{@"... el jugador o su equipo":@[@{@"nombre":@"Accidentalmente por el jugador al hacer un swing de práctica",
                                       @"imagen":@"98.png"},
                                               @{@"nombre":@"Accidentalmente por el jugador durante la búsqueda",
                                                 @"imagen":@"99.png"},
                                               @{@"nombre":@"Por el jugador al quitar impedimentos sueltos",
                                                 @"imagen":@"100.png"},
                                               @{@"nombre":@"Por el jugador al quitar obstrucciones movibles",
                                                 @"imagen":@"101.png"},
                                               @{@"nombre":@"Por el jugador al marcar su bola en el green",
                                                 @"imagen":@"102.png"}],
               @"... causa ajena":@[@{@"nombre":@"Por un espectador, un animal, etc.",
                                       @"imagen":@"35.png"},
                                     @{@"nombre":@"Por otro jugador",
                                       @"imagen":@"103.png"},
                                     @{@"nombre":@"Por otra bola",
                                       @"imagen":@"104.png"}],
               @"Una eventualidad del juego":@[@{@"nombre":@"Por el viento",
                                                 @"imagen":@"105.png"}]},
             @{@"Diversos":@[@{@"nombre":@"Una causa ajena",
                                                 @"imagen":@"47.png"},
                                               @{@"nombre":@"A otro jugador",
                                                 @"imagen":@"106.png"},
                                               @{@"nombre":@"Al jugador o a su equipo",
                                                 @"imagen":@"48.png"},
                                               @{@"nombre":@"Otra bola",
                                                 @"imagen":@"107.png"}],
               @"... la bandera o a quien la atiende":@[@{@"nombre":@"La bandera no atendida",
                                      @"imagen":@"108.png"},
                                    @{@"nombre":@"La bandera atendida o quitada",
                                      @"imagen":@"109.png"},
                                    @{@"nombre":@"La persona que atiende la bandera",
                                      @"imagen":@"110.png"}]}];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self scrollViewDidScroll:self.myTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ScrollView

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Get visible cells on table view.
//    NSArray *visibleCells = [self.myTableView visibleCells];
//    for (ReglasTableViewCell *cell in visibleCells) {
//        //[cell cellOnTableView:self.myTableView didScrollOnView:self.view];
//    }
}

#pragma mark TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [[[reglas objectAtIndex:self.index] allKeys] count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //return [[[reglas objectAtIndex:self.index] valueForKey:[[[[reglas objectAtIndex:self.index] allKeys] sortedArrayUsingSelector:@selector(compare:)] objectAtIndex:section]] count];
    //return [[secciones objectAtIndex:self.index] count];
    return [[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:section]] count];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView*view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    view.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:.3];
    
    UILabel*label = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, self.view.frame.size.width-16, 30)];
    //label.text = [[[[[reglas objectAtIndex:self.index] allKeys] sortedArrayUsingSelector:@selector(compare:)] objectAtIndex:section] uppercaseString];
    //NSLog(@"%@",[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:section]]);
    label.text = [[[secciones objectAtIndex:self.index] objectAtIndex:section] uppercaseString];
    label.font=[UIFont fontWithName:@".SFUIText-Semibold" size:15.0f];
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];
    
    return view;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *imagen = [[[[reglas objectAtIndex:self.index] valueForKey:[[[[reglas objectAtIndex:self.index] allKeys] sortedArrayUsingSelector:@selector(compare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"imagen"];
    NSString *imagen = [[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"imagen"];

    UIImage*image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagen]];
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    CGFloat proportion = height/width;

    return self.view.frame.size.width*proportion+30;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellIdentifier = @"Cell";
    
    ReglasTableViewCell*cell=[self.myTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
//    NSString *regla = [[[[reglas objectAtIndex:self.index] valueForKey:[[[[reglas objectAtIndex:self.index] allKeys] sortedArrayUsingSelector:@selector(compare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"nombre"];
//    
//    NSString *imagen = [[[[reglas objectAtIndex:self.index] valueForKey:[[[[reglas objectAtIndex:self.index] allKeys] sortedArrayUsingSelector:@selector(compare:)] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"imagen"];
    
    NSString *regla = [[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"nombre"];
    
    NSString *imagen = [[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"imagen"];
    
    cell.textCell.text=regla;
    cell.textCell.font=[UIFont fontWithName:@".SFUIText-Semibold" size:15.0f];
    cell.imageCell.image=[UIImage imageNamed:imagen];
    cell.backgroundColor=[UIColor clearColor];
    
    cell.imageCell.layer.cornerRadius = 10.0;
    cell.imageCell.layer.borderColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.7] CGColor];
    cell.imageCell.layer.borderWidth = 1.0;
    cell.imageCell.layer.masksToBounds = YES;
    cell.imageCell.clipsToBounds = YES;
    
    cell.backCell.layer.cornerRadius = 10.0;
    cell.backCell.layer.borderColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.7] CGColor];
    cell.backCell.layer.borderWidth = 1.0;
    cell.backCell.layer.masksToBounds = YES;
    cell.backCell.clipsToBounds = YES;
    
    if ([[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"video"]) {
        cell.videoImage.hidden=NO;
    }else{
        cell.videoImage.hidden=YES;
    }
    
    [cell layoutIfNeeded];
    [cell setNeedsLayout];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"Especificaciones" sender:self];
    });
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Especificaciones"]) {
        NSIndexPath*indexPath = [self.myTableView indexPathForSelectedRow];
        EspecificacionesViewController*destinationController = segue.destinationViewController;
        destinationController.regla = [[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"nombre"];
        destinationController.indexPathChoice = indexPath;
        destinationController.index = self.index;
        if ([[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"video"]) {
            destinationController.indexVideo = [[[[[reglas objectAtIndex:self.index] valueForKey:[[secciones objectAtIndex:self.index] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row] objectForKey:@"video"] integerValue];
        }
    }
}


@end
