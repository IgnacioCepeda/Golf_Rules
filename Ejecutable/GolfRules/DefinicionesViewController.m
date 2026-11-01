//
//  DefinicionesViewController.m
//  GolfRules
//
//  Created by Dacodes on 02/09/15.
//  Copyright (c) 2015 Dacodes. All rights reserved.
//

#import "DefinicionesViewController.h"
#import "UIImage+deviceSpecificMedia.h"
#import "TextoDefinicionViewController.h"

@interface DefinicionesViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSArray*opciones;
    NSArray*definiciones;
}

@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation DefinicionesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Definiciones";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.backImage.image = [UIImage imageForDeviceWithName:@"fondogolf"];
    
    self.myTableView.delegate=self;
    self.myTableView.dataSource=self;
        
    opciones=@[@"Agua accidental",@"Hoyo",@"Animal de Madriguera",@"Juez de Reglas",@"Bandera",@"Equipo",@"Bola en juego",@"Bola equivocada",@"Bola perdida",@"Trampa de arena",@"Caddie",@"Campo",@"Causa ajena",@"Posición (Stance)",@"Comité",@"Compañero",@"Competidor",@"Condiciones anormales",@"Consejo",@"Embocada",@"Equipo",@"Eventualidad del juego",@"Forecaddie",@"Fuera de límites",@"Golpe",@"Golpe de penalidad",@"Green",@"Green equivocado",@"Honor",@"Impedimentos Sueltos",@"Líneas de juego",@"Línea de putt",@"Mesa de Salida",@"Marcador",@"Observador",@"Obstáculos",@"Obstáculos de agua",@"Obstáculo de agua lateral",@"Obstrucciones",@"Grupos",@"Punto más cercano de alivio",@"Fairway",@"Regla o Reglas",@"Tee (Soporte)",@"Terreno en Reparación",@"Ronda estipulada"];
    definiciones=@[@"Es cualquier acumulación temporal de agua en el campo que es visible antes o después de que el jugador se coloque y que no esté en un obstáculo de agua. La nieve y el hielo natural, que no sea escarcha, son agua accidental o impedimentos sueltos, a elección del jugador. El hielo manufacturado es una obstrucción.\n\nEl rocio y la escarcha no son agua accidental. Una bola está en agua accidental cuando reposa en o cualquier parte de ella toca el agua accidental.",
                   @"Tendrá 108 mm. de diámetro (4 1/4 pulgadas) y por lo menos 101,6 mm (4 pulgadas) de profundidad. Si se utiliza un forro, estará hundido por lo menos 25,4 mm (1 pulgada) por debajo de la superficie del green, salvo que la naturaleza del suelo lo haga impracticable; su diámetro exterior no excederá de 108 mm (4 1/4 pulgadas).",
                   @"Es un animal que hace un hoyo para su habitabilidad o cobijo, como un conejo, un topo, una marmota, una ardilla de tierra o una salamandra.\n\nNota: Un hoyo hecho por un animal que no sea de madriguera, como un perro, no es una condición anormal del terreno, salvo que esté marcado o declarado como terreno en reparación.",
                   @"Es la persona designada por el Comité para acompañar a los jugadores a fin de dicidir cuestiones de hecho y aplicar las Reglas. Actuará ante cualquier infracción de una Regla que pueda observar o que pueda serle comunicada. Un Juez de Reglas no debería atender la bandera, ni permanecer junto al agujero o marcar la posición del agujero, ni levantar la bola o marcar su posición.",
                   @"Es un indicador derecho movible, que puede tener tela u otro material incorporado, colocada en el centro del agujero para indicar su posición. Será circular en su sección transversal. Están prohibidos los materiales acolchados o absorbentes de golpes que puedan influir indebidamente en el movimiento de la bola.",
                   @"Es un jugador, o dos o más jugadores que son compañeros.",
                   @"Una bola está en juego tan pronto como el jugador ha ejecutado un golpe en la mesa de Salida. Continua en juego hasta ser embocada, salvo cuando está perdida, fuera de límites, o levantada, o ha sido sustituida por otra bola, esté o no esté permitida la sustitución; una bola que así sustituye a la anterior se convierte en la bola en juego.\n\nSi una bola es jugada desde fuera de la mesa de salida cuando el jugador está empezando a jugar un hoyo, o cuando está intentando corregir este error, la bola no está en juego y se aplica la regla 11-4 u 11-5. De otra manera, bola en juego incluye una bola jugada desde fuera de la mesa de salida cuando el jugador elige o es requerido a jugar su próximo golpe desde el lugar desalida.\n\nExcepción en el juego por Hoyos: Bola en juego incluye una bola jugada por el jugador desde fuera de la mesa de salida cuando inicia el juego de un hoyo y si el contrario no ha requerido que el golpe sea cancelado de acuerdo con la Regla 11-4a.",
                   @"Una bola equivocada es cualquier bola que no sea:\n\n- La bola en juego del jugador.\n\n- La bola provisional del jugador.\n\n- En el juego por golpes, una segunda bola jugada por el jugador bajo la Regla 3-3 o con la Regla 20-7c; e incluye:\n\n- La bola de otro jugador.\n\n- Una bola abandonada.\n\n- La bola original del jugador cuando ya no está en juego.\n\nNota: Bola en juego incluye una bola que ha sustituido a la bola en juego, esté o no permitida dicha sustitución.",
                   @"Una bola se considera perdida, si:\n\na. No es encontrada ni identificada como suya por el jugador, dentro de los cinco minutos contados desde que el bando del jugador o su o sus caddies hayan comenzado la busqueda.\n\nb. El jugador ha ejecutado un golpe a una bola sustituta.\n\nc. El jugador ha ejecutado un golpe a una bola provisional desde el sitio donde se supone que está la bola original o desde el punto más cercano al agujero que ese sitio.\n\nEl tiempo empleado en jugar una bola equivocada no cuenta en el periodo de los cinco minutos permitidos para su búsqueda.\n\nBola sustituta: Es una bola puesta en juego en lugar de la bola original que estaba ya sea, en juego, perdida, fuera de límites o levantada.",
                   @"Es un obstáculo consistente en un área de terreno preparada, frecuentemente una depresión, en la cual el césped o el terreno han sido quitados y sustituidos por arena o similar. El terreno cubierto de hierba que bordea o está dentro de los límites de una Trampa de Arena, incluyendo las paredes formadas con tepes (esté cubierta de hierba o de tierra), no es parte del bunker.\n\nUna pared o borde de una trampa de arena que no estén cubiertos de hierba, son parte de la trampa de arena. El margen de una trampa de arena se extiende verticalmente hacia abajo pero no hacia arriba. Una bola está en una trampa de arena cuando reposa en, o cualquier parte de ella toca, el la trampa de arena.",
                   @"Es quien ayuda al jugador con arreglo a las Reglas, que puede incluir llevar o manejar los palos del jugador durante el juego. Cuando un caddie es empleado por más de un jugador, se considera siempre que es el caddie del jugador cuya bola se haya implicada, y el equipo que transporta se considera que es el equipo de ese jugador, excepto cuando el caddie actúa bajo órdenes específicas de otro jugador en cuyo caso se le considera el caddie de ese otro jugador.",
                   @"Es toda el área dentro de cualquiera de los límites establecidos por el Comité. (ver la Regla 33-2).",
                   @"Es aquella que no forma parte del partido o en el juego por golpes no forma parte del bando del competidor, e incluye un árbitro, un marcador, un observador, y un forecaddie. Ni el viento o el agua son causa ajena.",
                   @"Consiste en que un jugador situa sus pies en posición al prepararse para efectuar el golpe.",
                   @"Es el comité encargado de a competencia o torneo o, si la cuestión no se suscita en una competición , el comité responsable del campo.",
                   @"Es un jugador asociado a otro jugador en el mismo bando. En un partido threesome, foursome, mejor bola (best ball), o cuatro bolas (four ball), donde el contexto así lo admita, el término jugador incluye a su compañero o compañeros.",
                   @"Es un jugador en una competición por golpes. Un compañero competidor, es cualquier persona con la cual el competidor juega. Ninguno es compañero del otro. En el juego por golpes las competiciones foursome y cuatro bolas (four ball), donde el contexto así lo admita, la palabra competidor o compañero-competidor incluye a su compañero.",
                   @"Es cualquier agua accidental, terreno en reparación u hoyo, deshecho o senda hechos en el campo por un animal de madriguera, un reptil o un pájaro.",
                   @"Es cualquier parecer o sugerencia que pueda influir en un jugador para determinar su juego, elección de palo o el método para ejecutar un golpe. La información relacionada con las Reglas o sobre cuestiones de dominio público, tales como las posiciones de los obstáculos o de la bandera en el green, no es consejo.",
                   @"Una bola está embocada cuando reposa dentro de la circunsferencia del agujero y toda ella se encuentra por debajo del nivel del borde del agujero.",
                   @"Es cualquier cosa usada, puesta o llevada por o para el jugador, excepto cualquier bola que haya jugado en el hoyo que se está jugando y cualquier objeto pequeño tal como una moneda o un soporte de bola (tee) cuando son usados para marcar la posición de una bola o la extensión del área en la que una bola ha de ser dropeada. El equipo incluye un carro de golf, motorizado o no. Si el carro es compartido por dos o más jugadores, el carro y todo lo que se encuentra en él se considera equipo de dicho jugador.\n\nNota: Una bola jugada en el hoyo que se está jugando es equipo cuando ha sido levantada y no se ha puesto nuevamente en juego.",
                   @"Ocurre cuando una bola en movimiento es accidentalmente desviada o detenida por una causa ajena (ver la Regla 19-1).",
                   @"Es alguien contratado por el Comité para indicar a los jugadores la posición de las bolas durante el juego. Él es una causa ajena.",
                   @"Es el terreno que está más allá de los límites del campo o cualquier parte del campo marcada como tal por el Comité. Cuando el fuera de límites está definido por estacas o una valla, la línea de fuera de límites viene determinada por los puntos más cercanos al campo de las estacas o postes de la valla a nivel del suelo, excluyendo los soportes en ángulo.\n\nLos objetos que definen el fuera de límites como muros, vallas, estacas y verjas no son obstrucciones y se consideran fijos. Cuando el fuera de límites está señalado por una línea en el suelo, la línea en sí está fuera de límites. La línea que define el fuera de límites, se extiende verticalmente hacia arriba y hacia abajo.\n\nUna bola está fuera de límites, cuando toda ella reposa fuera de límites. Un jugador puede situarse fuera de límites para jugar una bola que está dentro de los límites.",
                   @"Es el movimiento del palo hacia la bola con intención de golpearla y moverla, pero si un jugador detiene voluntariamente la bajada del palo antes de que la cabeza del palo alcance la bola él no ha ejecutado un golpe.",
                   @"Es el que bajo la aplicación de las Reglas se añade al resultado de un jugador o bando. En los threesome o foursome, los golpes de penalidad no afectan al orden de juego.",
                   @"Es todo el terreno del hoyo que se está jugando preparado especialmente para el putt, o de otra manera definido como tal por el Comité. Una bola está en el green cuando cualquier parte de la misma toca el green.",
                   @"Es cualquier green que no sea el del hoyo que se está jugando. Salvo que el Comité lo establezca de otra forma, este término incluye un green de prácticas o un green para practicar golpes cortos (chips) en el campo.",
                   @"Se dice que tiene el honor el jugador que ha de jugar primero en la mesa de salida.",
                   @"Son objetos naturales, incluyendo: piedras, hojas, leña menuda, ramas y similares, excremento, y gusanos e insectos y deshechos o montoncitos formados por éstos, siempre que no estén: fijos o en crecimiento, o adheridos a la bola.\n\nLa arena y la tierra suelta son impedimentos sueltos en el green, pero no en cualquier otro lugar. La nieve y el hielo natural, que no sea escarcha, son agua accidental o impedimentos sueltos, a elección del jugador. El rocío y la escarcha no son impedimentos sueltos.",
                   @"Es la dirección que el jugador desea que tome su bola después de un golpe, más una distancia razonable a ambos lados de la dirección deseada. La línea de juego se extiende verticalmente hacia arriba desde el suelo, pero no se prolonga más allá del agujero.",
                   @"Es la línea que el jugador desea que tome su bola despues de un golpe en el green. Excepto en lo relativo a la Regla 16-1e, la línea de putt incluye una distancia razonable a ambos lados de la línea deseada. La línea de put no se prolonga más allá del agujero.",
                   @"Es el sitio desde el que se inicia el juego en el hoyo a jugar. Es un área rectangular con una profundidad de dos palos y cuyo frente y costados están definidos por la parte externa de dos marcas. Una bola está fuera de la mesa de salida cuando toda ella reposa fuera de esta área.",
                   @"Es la persona designada por el Comité para anotar el resultado de un competidor en el juego por golpes. Puede ser un compañero-competidor. No es un árbitro.",
                   @"Es la persona designada por el Comité para ayudar al árbitro a decidir cuestiones de hecho e informarle de cualquier infracción de una Regla. Un observador no debería atender la bandera, permanecer junto al agujero o marcar la posición del agujero, ni levantar la bola o marcar su posición.",
                   @"Es cualquier bunker o cualquier obstáculo de agua.",
                   @"Es cualquier mar, lago, estanque, rio, zanja, drenaje superficial u otros cauces abiertos de agua (contengan agua o no) y cualquier otra cosa de naturaleza similar en el campo. Todo el suelo o agua dentro del margen de un obstáculo de agua es parte del obstáculo de agua. Los márgenes de un obstáculo de agua se extienden verticalmente hacia arriba y hacia abajo.\n\nLas estacas y líneas que definen los márgenes de un obstáculo de agua están dentro del obstáculo. Dichas estacas son obstrucciones. Una bola está en un obstáculo de agua cuando reposa en, o cualquier parte de ella toca, el obstáculo de agua.\n\nNota 1: Las estacas o líneas usadas para definir un obstáculo de agua deben ser amarillas. Cuando ambas estacas y líneas son usadas para definir los obstáculos de agua, las estacas identifican el obstáculo y las líneas definen el margen del obstáculo.\n\nNota 2: El Comité puede establecer una Regla Local prohibiendo el juego desde una zona medioambientalmente sensible que ha sido definida como obstáculo de agua.",
                   @"Es un obstáculo de agua, o aquella parte de un obstáculo de agua, situada de tal forma que no es posible o que a juicio del Comité resulta impracticable dropar una bola detrás del obstáculo de agua de acuerdo con la Regla 26-1b. La parte de un obstáculo de agua que ha de jugarse como obstáculo de agua lateral debería de ser marcada diferenciadamente.\n\nUna bola está en un obstáculo de agua lateral cuando reposa en, o cualquier parte de ella toca, el obstáculo de agua lateral.\n\nNota 1: Las estacas o líneas usadas para definir un obstaculo de agua lateral deben ser rojas. Cuando ambas estacas y líneas son usadas para definir obstáculos de agua lateral, las estacas identifican el obstáculo y las líneas definen el margen del obstáculo.\n\nNota 2: El Comité puede establecer una Regla Local prohibiendo el juego desde una zona medioambientalmente sensible que ha sido definida como obstáculo de agua lateral.\n\nNota 3: El Comité puede definir un obstáculo de agua lateral como obstáculo de agua.",
                   @"Son cualquier cosa artificial , incluidas las superficies y bordes artificiales de carreteras y caminos, y hielo manufacturado, excepto:\n\na: Los objetos que definen el fuera de límites, tales como muros, cercas, estacas y verjas.\n\nb: Cualquier parte de un objeto artificial inamovible que está fuera de límites.\n\nc: Cualquier construcción declarada por el Comité como parte integrante del campo. Una obstrucción es una obstrucción movible si se puede mover sin un esfuerzo poco razonable, sin demorar indebidamente el juego y sin causar daño alguno. De otra manera es una obstrucción inamovible.\n\nNota: El Comité puede establecer una Regla Local para declarar una obstrucción movible como obstrucción inamovible.",
                   @"Individual: Un partido en el que un jugador juega contra otro.\n\nThreesome: Un partido en el que uno juega contra dos y cada bando juega una bola.\n\nFoursome: Un partido en el que dos juegan contra dos y cada bando juega una bola.\n\nTres Bolas: (Three-ball): Una competición por hoyos en la que tres juegan cada uno contra cada uno de los otros y cada uno juega su propia bola. Cada jugador está jugando dos partidos distintos.\n\nMejor Bola: (Best Ball): Un partido en el que uno juega contra la mejor bola de dos o la mejor bola de tres jugadores.\n\nCuatro Bolas: (Four Ball): Un partido en el que dos juegan su mejor bola contra la mejor bola de otros dos jugadores.\n\nPreparar el golpe: Un jugador a preparado el golpe cuando se ha colocado y además ha apoyado el palo en el suelo, excepto en un obstáculo en cuyo caso el jugador ha preparado el golpe con sólo colocarse.",
                   @"Es el punto de referencia para aliviarse sin penalidad por interferencia de una obstrucción inamovible (Regla 24-2), una condición anormal del terreno (Regla 25-1) o un green equivocado (Regla 25-3).\n\nEs el punto en el campo más cercano al lugar en que reposa la bola: (I) que no este más cerca del agujero, y (II) donde, si la bola estuviera así situada, no existiría interferencia de la condición en la que el jugador quiere aliviarse para el golpe que el jugador podria haber ejecutado desde la posición original si la condición no estuviese ahí.\n\nNota: Con el fin de determinar con precisión el punto más cercano de alivio, el jugador debería usar el palo con el que habría ejecutado su siguiente golpe si la condición no estuviera ahí, para simular la posición de preparar el golpe, la dirección de juego y swing para dicho golpe.",
                   @"Es toda área del campo, excepto: a. En la mesa de salida y el green del hoyo que se está jugando; y b. Todos los obstáculos del campo.",
                   @"El término Regla incluye:\n\na. Las Reglas del golf y sus interpretaciones contenidas en las Decisiones sobre las Reglas del Golf.\n\nb. Cualquier Condición de la Competición establecida por el Comité bajo la Regla 33-1 y el Apéndice I.\n\nc. Cualquier Regla Local establecida por el Comité bajo la Regla 33-8a y el Apéndice I.\n\nd. Las especificaciones sobre palos y la bola en los Apéndices II y III.",
                   @"Es un utensilio diseñado para elevar la bola sobre el terreno. No debe ser más largo de 101,6 mm (4 pulgadas) y no debe ser diseñado ni manufacturado de tal forma que pueda indicar la línea de juego o influir en el movimiento de la bola.",
                   @"Es cualquier parte del campo marcada como tal por orden del Comité o así declarada por su representante autorizado. Incluye material apilado para ser retirado y cualquier hoyo hecho por un cuidador del campo, incluso si no está marcado como tal. Todo el terreno y cualquier hierba, arbusto, árbol u otra cosa en crecimiento dentro del terreno en reparación es parte del terreno en reparación.\n\nEl margen del terreno en reparación se extiende verticalmente hacia abajo, pero no hacia arriba. Las estacas y líneas que definen el terreno en reparaciónestán dentro de dicho terreno. Estas estacas son obstrucciones. Una bola está en terreno en reparacióncuando reposa en, o cualquier parte de ella toca, el terreno en reparación.\n\nNota 1: La hierba cortada y otros materiales dejados en el campo que han sido abandonados, y que no se tenga intención de retirar, no son terreno en reparación si no están marcados como tal.\n\nNota 2: El Comité puede establecer una Regla Local prohibiendo el juego dentro de un terreno en reparación, o desde una zona medioambientalmente sensible que ha sido definida como terreno en reparación.",
                   @"Consiste en jugar los hoyos del campo en su secuencia correcta, salvo que el Comité autorice hacerlo de otra forma. El número de hoyos de una vuelta estipulada es de 18, salvo que el Comité autorice un número menor. En cuanto a la ampliación de la vuelta estipulada en el juego por hoyos, ver la Regla 2-3."];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = opciones[indexPath.row];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.font=[UIFont fontWithName:@".SFUIText-Medium" size:16.0f];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"explicacion" sender:nil];
    });
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    TextoDefinicionViewController*destinationController=segue.destinationViewController;
    NSIndexPath*indexPath=[self.myTableView indexPathForSelectedRow];
    destinationController.nombreDefinicion=opciones[indexPath.row];
    destinationController.definicion=definiciones[indexPath.row];
}

@end
