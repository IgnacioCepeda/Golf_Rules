//
//  EtiquetaViewController.m
//  GolfRules
//
//  Created by Dacodes on 24/09/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import "EtiquetaViewController.h"
#import "UIImage+deviceSpecificMedia.h"
#import "EtiquetaTableViewCell.h"

@interface EtiquetaViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray*opciones;
}

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation EtiquetaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Etiqueta";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.backImage.image = [UIImage imageForDeviceWithName:@"fondogolf"];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
    
    self.myTableView.estimatedRowHeight = 60;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    
    opciones=@[@"Saludar a los compañeros de juego, desearles suerte.",@"Identificar la bola  a jugar antes de iniciar la ronda.",@"No tirar si ello implica la posibilidad de golpear a un compañero de juego. Ante la duda, es mejor esperar antes de hacer un tiro.",@"Gritar “fore” después de un tiro abierto o que se dirige hacia alguien más.",@"Reparar los divots con arena o reponiendo la parte de pasto en su caso.",@"Después de cada tiro, avanzar a la siguiente posición lo más rápido que sea posible para mantener el ritmo de juego.",@"Prepararse a tiempo para cada tiro (guante, Tee, etc.).",@"No hacer demasiados swings de práctica.",@"Dar paso al grupo de atrás si se ha dejado un hoyo libre entre el nuestro grupo y el grupo de adelante.",@"Respetar la concentración de los compañeros evitando hablar o hacer ruidos mientras ejecutan sus tiros.",@"Ayudar al compañero en la búsqueda si su bola no aparece.",@"Reparar las trampas de arena después de hacer un tiro para dejarla en las mejores condiciones posibles para los demás jugadores.",@"En el Green, situar la bolsa de palos en el camino de salida al siguiente hoyo para aligerar el ritmo de juego.",@"Al quitar la bandera evitar azotarla sobre el Green.",@"No apoyarse en el Putt cuando se espera jugar en el Green para evitar dejar marcas sobre el mismo.",@"En el Green evitar el arrastre de los pies para no dejar marcas sobre la superficie.",@"En el Green revisar la posición de las bolas de los compañeros para evitar pisar su línea. De ser necesario, hacer un rodeo para pasar detrás de cada jugador.",@"Reparar las marcas de divots que se encuentren en el Green, no solo el propio Divot.",@"Tratar con cortesía y respeto a los Caddies y en general a todo el personal del Campo.",@"No acercar los carros de Golf al Greeen ni más allá de las marcas que indican el límite para los mismos.",@"Respetar la regla de 90º en el uso de los carros de golf.",@"Al embocar, sacar la bola del hoyo con la mano evitando dañar el contorno del hoyo.",@"No hacer anotaciones en el Green. El Green se abandona en cuanto termina el último jugador.",@"Al terminar la ronda, quitarse la gorra y despedirse de mano de los demás jugadores agradeciendo la compañia y agradecer a los Caddies por su trabajo."];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [opciones count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString*cellIdentifier = @"Cell";
    
    EtiquetaTableViewCell*cell=[self.myTableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    cell.textCell.text = opciones[indexPath.row];
    cell.textCell.textColor = [UIColor whiteColor];
    cell.textCell.numberOfLines=0;
    cell.textCell.font=[UIFont fontWithName:@".SFUIText-Medium" size:16.0f];

    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
