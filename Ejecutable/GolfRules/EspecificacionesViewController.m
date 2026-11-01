//
//  EspecificacionesViewController.m
//  GolfRules
//
//  Created by Dacodes on 03/09/15.
//  Copyright (c) 2015 Dacodes. All rights reserved.
//

#import "EspecificacionesViewController.h"
#import "UIImage+deviceSpecificMedia.h"
#import <AVFoundation/AVFoundation.h>

@interface EspecificacionesViewController ()<AVSpeechSynthesizerDelegate,UIScrollViewDelegate>{
    NSArray*definiciones;
    NSArray*videoImagenes;
    NSArray*imagenes;
    BOOL play;
}

@property (weak, nonatomic) IBOutlet UITextView *texto;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *playButton;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControl;

@end

@implementation EspecificacionesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=self.regla;
    self.backImage.image = [UIImage imageForDeviceWithName:@"fondogolf"];
    imagenes=@[@[@[@[@"jugar la bola como reposa1",@"jugar la bola como reposa2",@"jugar la bola como reposa3"],@[@"en caso de duda.png"],@[@"siempre embocar la bola y no cambiaria.png"],@[@"bola dañada.png"],@[@"consejo y linea de juego.png",@"consejo y linea de juego2.png"],@[@"caddie.png"],@[@"practicar en el campo.png"],@[@"tormenta.png",@"tormenta2.png"]],@[@[@"dropar correctamente.png",@"dropar correctamente2.png"],@[@"cuando volver a dropar.png"],@[@"dropar lugar equivocado.png"],@[@"dropar de manera incorrecta.png"]]],@[@[@[@"preparativos y retraso3.png",@"preparativos y retraso2.png",@"preparativos y retraso.png"],@[@"palos.png",@"palos2.png"],@[@"orden.png"],@[@"consejo.png",@"consejo2.png"],@[@"chip-putt.png"]],@[@[@"lugar.png",@"lugar2.png"],@[@"marcas.png"],@[@"aliviarse.png"],@[@"bola-tee.png"],@[@"golpe-aire.png"]],@[@[@"fueradeturno.png"],@[@"jugar-salida.png"],@[@"jugar-equivocado.png"],@[@"bolaprov1.png",@"bolaprov2.png"]]],@[@[@[@"recorrido.png"],@[@"fueradeturno.png"],@[@"jugar la bola como reposa2.png",@"jugar la bola como reposa3.png",@"romperdoblar.png"],@[@"bolaperdida.png"],@[@"idbola.png",@"idbola2.png"],@[@"bolabus.png"],@[@"bolaensayo.png"],@[@"bolagolpe.png"],@[@"causaajena.png"],@[@"consejo y linea de juego2.png"]],@[@[@"fueradeturno.png"],@[@"bolaequi.png"],@[@"bolagolpeacausa.png"],@[@"bolaequipogolpea.png"],@[@"golmul.png"],@[@"bolaperdidaprov.png"]],@[@[@"impsueltos.png"],@[@"obsmov.png"],@[@"obsina.png",@"obsina2.png",@"obsina3.png"],@[@"condicion.png",@"condicion2.png",@"condicion3.png"],@[@"bolaperdidacondi.png"],@[@"greenequivocado.png"],@[@"bolaempotrada.png"],@[@"bolajuntobola.png"],@[@"chuletas.png"],@[@"bolainj.png"]]],@[@[@[@"impedisueltos.png"],@[@"obstrumov.png"],@[@"conditerreno.png"],@[@"bunkerinundado.png"],@[@"bolajunto.png"],@[@"huellas.png"],@[@"bola injugable.png"]],@[@[@"delimitación.png"],@[@"ni tocar.png",@"ni tocar2.png"],@[@"bola desaparecida.png"],@[@"identificacionbola.png",@"identificacionbola2.png"],@[@"conesjolinea.png"]],@[@[@"confundirbola.png"],@[@"bolaajena.png"],@[@"bolaequipo.png"],@[@"bolahuellas.png"],@[@"bolabunker.png"],@[@"golpemultiple.png"],@[@"bolaperdidabunker.png",@"bolaperdidabunker2.png"]]],@[@[@[@"deliagua.png"],@[@"bolamovbus.png"],@[@"idenbola.png",@"idenbola2.png"],@[@"noencontrar.png"],@[@"bolaobsagua.png",@"bolaobsagua2.png"],@[@"reglaamarillo.png"],@[@"reglalateral.png"]],@[@[@"impsueltosagua.png"],@[@"obstrumovagua.png"],@[@"obstruinamagua.png"],@[@"condianoagua.png"],@[@"bolabolaagua.png"],@[@"bolainjugagua.png"]],@[@[@"palo.png",@"palox.png"],@[@"consejolinagua.png"]],@[@[@"bolajuequiv.png"],@[@"bolajugobs.png"],@[@"bolajucausa.png"],@[@"bolajuequipo.png"],@[@"golmulagua.png"],@[@"golmulagua.png"]]],@[@[@[@"delimitacion.png"],@[@"bolafueralimites.png"],@[@"jugadorfueralimites.png",@"jugadorfueralimites2.png"]],@[@[@"bolaprov2.png",@"jugarbolaprov.png"],@[@"bolaprovanun.png"],@[@"bolaprovperf.png"],@[@"bolaprovjug.png"],@[@"bolaoriglim.png"],@[@"bolainj.png"],@[@"bolaoriginalimposible.png"]]],@[@[@[@"nomejorarlinea.png"],@[@"bolaempotradagreen.png"],@[@"impedisueltosgreen.png"],@[@"obstrumovgreen.png"],@[@"aspersor1.png",@"aspersor2.png"],@[@"charcosgreen.png"],@[@"greendoble.png"]],@[@[@"greenantegreen.png"],@[@"greenequivocado.png"],@[@"bolaatascada.png"],@[@"ordenjuegogreen.png"],@[@"noprobargreen.png"],@[@"nomejorarlinea.png"],@[@"marcarlevantar.png"],@[@"bolamovidamarcada.png"],@[@"desplazadorbola.png"],@[@"bolamarcadapersona.png"],@[@"confundirlabola.png"],@[@"bolaestadañada.png"],@[@"bolamovidapreparar.png"],@[@"bolareposodes.png"],@[@"consejogreen.png",@"consejo y linea de juego.png"],@[@"puttmal.png"],@[@"protelluvia.png"]],@[@[@"fueraturnogreen.png"],@[@"jugarbolaequivocadagreen.png"],@[@"patearlugarequiv.png"],@[@"bolagolpeaotrabola.png"],@[@"bolabanderagreen.png"],@[@"boladesviadamarcador.png"],@[@"bolagolpeaanimal.png"],@[@"bolagolpeaotrojugador.png"],@[@"bolabordeagujero.png"],@[@"bolasaleagujero.png"],@[@"puttdadoempotrada.png"],@[@"repetirputtchip.png"]]],@[@[@[@"poranimalespec.png"],@[@"porotrojugador.png"],@[@"bolagolpeaotrabola.png"]],@[@[@"accidenteensayo.png"],@[@"accibusqueda.png"],@[@"jugadorsueltos.png"],@[@"jugadormovible.png"],@[@"accibusqueda.png"]],@[@[@"viento.png"]]],@[@[@[@"banderanoatendida.png"],@[@"banderaquitada.png",@"banderaquitada2.png"],@[@"personabandera.png"]],@[@[@"bolagolpeacausa.png"],@[@"golpeaotrojugador.png"],@[@"bolaequipogolpea.png"],@[@"bolagolpeaotrabola.png"]]]];
    
    videoImagenes=@[@[[UIImage imageNamed:@":cuando volver a dropear? 2-01"],[UIImage imageNamed:@":cuando volver a dropear? 3-01"],[UIImage imageNamed:@":cuando volver a dropear? 4-01"],[UIImage imageNamed:@":cuando volver a dropear? 5-01"],[UIImage imageNamed:@":cuando volver a dropear? 6-01"],[UIImage imageNamed:@":cuando volver a dropear? 7-01"],[UIImage imageNamed:@":cuando volver a dropear? 8-01"],[UIImage imageNamed:@":cuando volver a dropear? 9-01"]],
  @[[UIImage imageNamed:@"vidobsmov.png"],[UIImage imageNamed:@"vidobsmov2.png"],[UIImage imageNamed:@"vidobsmov3.png"]],@[[UIImage imageNamed:@"videocondi.png"],[UIImage imageNamed:@"videocondi2.png"],[UIImage imageNamed:@"videocondi3.png"]],@[[UIImage imageNamed:@"videobolaper.png"],[UIImage imageNamed:@"videobolaper2.png"],[UIImage imageNamed:@"videobolaper3.png"],[UIImage imageNamed:@"videobolaper4.png"]],@[[UIImage imageNamed:@"videobolainjugable.png"],[UIImage imageNamed:@"videobolainjugable2.png"],[UIImage imageNamed:@"videobolainjugable3.png"]],@[[UIImage imageNamed:@"videobolaeq.png"],[UIImage imageNamed:@"videobolaeq2.png"],[UIImage imageNamed:@"videobolaeq3.png"],[UIImage imageNamed:@"videobolaeq4.png"]],@[[UIImage imageNamed:@"videocondianormal.png"],[UIImage imageNamed:@"videocondianormal2.png"]],@[[UIImage imageNamed:@"videobolain.png"],[UIImage imageNamed:@"videobolain2.png"],[UIImage imageNamed:@"videobolain3.png"]],@[[UIImage imageNamed:@"videoreglaamarilla.png"],[UIImage imageNamed:@"videoreglaamarilla2.png"]],@[[UIImage imageNamed:@"videoreglaroja.png"],[UIImage imageNamed:@"videoreglaroja2.png"],[UIImage imageNamed:@"videoreglaroja3.png"],[UIImage imageNamed:@"videoreglaroja4.png"]],@[[UIImage imageNamed:@"videobolaprov.png"],[UIImage imageNamed:@"videobolaprov2.png"],[UIImage imageNamed:@"videobolaprov3.png"],[UIImage imageNamed:@"videobolaprov4.png"]],@[[UIImage imageNamed:@"videobolafuera.png"],[UIImage imageNamed:@"videobolafuera2.png"],[UIImage imageNamed:@"videobolafuera3.png"]]];
    
    definiciones=@[@[@[@"Los fundamentos del Golf establecen que, excepto que una regla lo indique de manera específica, no se deberá:\n\n•Tocar la bola entre el tee de salida y el green.\n•Se jugará la bola como reposa (o, si ha dejado su posición, como reposaba cuando se detuvo).\n•Se deberá jugar el campo como se le encuentre al llegar.\n\nSi se juega la bola como reposa, es prácticamente imposible cometer errores, a no ser que la bola esté fuera de límites, en un green equivocado o en una zona donde esté prohibido el juego según una Regla Local (por ej. terreno en reparación, zona prohibida)(Regla 13).",
                     @"Ante la duda de que hacer, lo recomendable es jugar dos bolas. En ese caso se deberá anunciar cual de las dos se desea que cuente en el caso de que las dos estuvieran de acuerdo con las reglas y se deberá jugar las dos bolas hasta terminar el hoyo. Se debe anotar el número de golpes de las dos bolas y al acabar la ronda se tendrá la obligación de informar al Comité antes de firmar y entregar la tarjeta de resultados.(Regla 3)",
                     @"Como regla básica, la bola debe ser jugada hasta meterla en el hoyo. De lo contrario, el jugador puede ser descalificado. Sin embargo, ciertas modalidades, como el Stableford, permiten “levantarse“ y abandonar el hoyo sin meter la bola.\nComo regla básica, el jugador sólo puede cambiar de bola entre hoyos (a no ser que esté perdida, en un obstáculo de agua, etc.). De no hacerlo así, tendrá 2 golpes de castigo.(Reglas 3 y 32).",
                     @"Si la bola queda cortada, deformada o seriamente dañada (una ligera grieta no es suficiente) durante el juego del hoyo, podrá sustituirla por otra, sin castigo. Sin embargo, antes de cambiar la bola, se debe anunciar la intención al co-competidor y darle la oportunidad de examinar la bola. Si esto no se hace, se tendrá 1 golpe de castigo.(Regla 5)",
                     @"Está permitido preguntar acerca de las distancias, la situación de los obstáculos o del fuera de límites y la posición de la bandera.\n\nTambién se puede igualmente hacer preguntas acerca de las reglas y otras generalidades. Si el jugador no alcanza a ver la bandera, otra persona le puede indicar la línea de juego (no obstante, la persona o la señal que indica la posición debe retirarse antes de ejecutar el tiro).\n\nSin embargo, está prohibido pedir consejo o darlo (“¿Qué bastón usaste?“, “¿Qué fierro me recomiendas?“, “Usa mejor la madera.“, etc.), en tal caso incurrirá en 2 golpes de castigo. (Excepción: está permitido pedir consejo al caddie así como al compañero en un Torneo por equipos.).\n\nSi el jugador recibe consejo sin haberlo solicitado no tendrá castigo alguno.(Regla 8)",
    @"Es importante tener en cuenta que el jugador es responsable de las acciones de su caddie. Si el caddie viola las reglas, el jugador  recibirá el castigo respectivo.(Regla 6)",
    @"Está prohibido practicar en el campo el día de torneo, ni antes ni durante la ronda. En torneos de varias rondas, tampoco se puede practicar el campo entre las rondas.(Regla 7)",
    @"Si el juego se suspende mediante una señal de peligro (p. ej. Una sirena, un escopetazo), es obligatorio interrumpir el juego: se deberá marcar la bola, levantarla y posteriormente reponerla.\n\nTambién se puede terminar el hoyo que se esté jugando siempre que la situación no sea peligrosa (que no haya truenos).\n\nSi se considera que la situación es peligrosa no es necesario esperar a que el juego sea suspendido oficialmente.\n\nSi los jugadores interrumpen su vuelta sin una razón válida, p. ej. por el simple hecho de que llueve mucho, estarán descalificados."],
                     @[@"Dropear significa mantener la bola con el brazo extendido horizontalmente a la altura del hombro y dejarla caer. El lugar donde va a efectuar el dropeo nunca debe estar más cerca del hoyo. Una bola que ha de ser dropeada siempre puede limpiarse previamente (Reglas 20 y 21).",
                       @"Se debe volver a dropear sin castigo si la bola rueda y queda:\n\n1.- Dentro de un obstáculo (la posición original era afuera). \n2.- Fuera de un obstáculo (la posición original era adentro).\n3.- En el Green (la posición original era afuera).\n4.- Fuera de límites (la posición original era adentro).\n5.- En la interferencia inicial después de un alivio sin castigo.\n6.- A más de dos bastones.\n7.- Más cerca del hoyo que la posición original.\n8.- Toca a un jugador o a su equipo.\n\nSi al dropear por segunda vez se produjera uno de los casos mencionados en las situaciones del 1 al 7, la bola se colocará en el lugar donde tocó el suelo cuando fue dropeada por segunda vez.\n\nSi la bola no permanece estable en este lugar, se colocará en el lugar más cercano donde pueda quedar en reposo.\n\nSi ocurriese lo mencionado en el supuesto 8, se dropeara la bola tantas veces como sea necesario hasta que no toque a un jugador o a su equipo.\n•Resumen: dropear dos veces, a la tercera colocar salvo cuando la bola toca  a un jugador o a su equipo.",
                       @"Si se dropea la bola en un lugar equivocado y aún no se ha jugado, se tiene derecho a levantarla y dropearla correctamente, sin castigo. Si la bola ya ha sido jugada, el jugador tendrá 2 golpes de castigo por haber jugado desde un lugar equivocado (posible descalificación si el lugar equivocado le da al jugador una mejora significativa o se gana distancia).",
                       @"Si se dropea una bola de manera incorrecta (p. ej. hacerlo desde más arriba o más abajo del hombro o sin extender el brazo) y aún no se ha jugado, el jugador tiene derecho a levantarla y dropearla correctamente, sin castigo. Si el jugador ya ha jugado la bola, tendrá 1 golpe de castigo por dropear de forma incorrecta."],],
                   @[@[@"El jugador debe llegar con tiempo suficiente a su salida. Por regla general, si el jugador llega a su salida dentro de los 5 minutos siguientes a su hora, tendrá 2 golpes de castigo. Si el retraso es mayor a 5 minutos el jugador quedará descalificado.\nEl jugador deberá marcar su bola con un plumón indeleble para poder identificarla de forma indiscutible.\nEl jugador deberá revisar su handicap en la tarjeta de resultados e intercambiarla con su co-competidor.\nEl jugador deberá leer las Reglas Locales y/o Avisos a los Jugadores(Reglas 6 y 12).",
                         @"Está permitido llevar un máximo de 14 bastones. Si el jugador lleva más de 14 bastones, tendrá que quitar de su bolsa los bastones sobrantes antes de comenzar la ronda. En el peor de los casos, los podrá dejar en la mesa de salida.\n\nSi el jugador se da cuenta del exceso de bastones durante la ronda, deberá declararlos fuera de juego inmediatamente y no podrá utilizarlos durante el resto de la vuelta (de lo contrario será descalificado).\n\nTendrá  dos golpes de castigo por cada hoyo que haya jugado con bastones de más pero con un máximo de 4 golpes por ronda.\n\nNo está permitido pedir prestado un bastón para ejecutar un tiro a otro jugador que esté jugando en el campo.(Regla 4)",
                         @"En el primer hoyo de salida, el orden de juego viene marcado por el horario de salidas. En los siguientes hoyos, tendrá el honor de salir primero el jugador que ha obtenido el resultado más bajo en el hoyo inmediato anterior.(Regla 10)",
                         @"Está permitido preguntar acerca de las distancias, la situación de los obstáculos o del fuera de límites y la posición de la bandera.\n\nTambién se puede igualmente hacer preguntas acerca de las reglas y otras generalidades. Si el jugador no alcanza a ver la bandera, otra persona le puede indicar la línea de juego (no obstante, la persona o la señal que indica la posición debe retirarse antes de ejecutar el tiro).\n\nSin embargo, está prohibido pedir consejo o darlo (“¿Qué bastón usaste?“, “¿Qué fierro me recomiendas?“, “Usa mejor la madera“, etc.), en tal caso incurrirá en 2 golpes de castigo. (Excepción: está permitido pedir consejo al caddie así como al compañero en un Torneo por equipos.) Si el jugador recibe consejo sin haberlo solicitado no tendrá castigo alguno.(Regla 8)",
                         @"En la mesa de salida y mientras el jugador espera que sea posible jugar, está permitido practicar el putt o pequeños golpes de approach.(Regla 7)"],
                     @[@"La mesa de salida tiene una profundidad de dos bastones desde las dos marcas. La bola tiene que acomodarse dentro de esta área mientras que el jugador puede colocarse fuera de esta zona. Una bola está fuera del lugar de salida cuando toda ella reposa fuera de esta área.(Regla 11 y definición “Mesa de Salida“)",
                       @"Antes del golpe, las marcas se consideran que están fijas y no podrán desplazarse para aliviarse de ellas (2 golpes de castigo). Sin embargo, después del golpe, se considerarán obstrucciones movibles y podrán quitarse sin castigo.(Regla 11)",
                       @"En la mesa de salida, se pueden quitar irregularidades como hojas, hierbas, basuritas naturales, etc. Se pueden quitar todos los objetos naturales y artificiales sin castigo excepto las marcas de la mesa de salida que se consideran objetos fijos y no se pueden quitar.",
                       @"Si el jugador hace caer involuntariamente la bola del tee antes de ejecutar el golpe de salida (por ej. al colocarse a la bola o al hacer el swing de práctica) no cuenta como golpe y la puede reponer sin castigo.",
                       @"Cada golpe cuenta, incluso si no ha golpeado la bola.\nDespués de un “golpe al aire ó paloma“ la bola está en juego y ya no está permitido tocarla.(Regla 11 y definición “Golpe“)"],
                     @[@"Si un jugador juega su bola cuando no es su turno, cuenta el golpe y no hay castigo. Sin embargo, si los jugadores se han puesto de acuerdo para jugar fuera de turno para dar a uno de ellos una ventaja táctica, quedarán descalificados.(Regla 10)",
                       @"Si un jugador juega una bola desde fuera de la mesa de salida, no contará el golpe pero tendrá 2 golpes de castigo. El jugador deberá corregir su infracción repitiendo el tiro desde dentro de la mesa de salida (3er golpe).\nSi no corrige el error, quedará descalificado.(Regla 11)",
                       @"Si un jugador juega una bola desde una mesa de salida equivocada, incluso si ésta está más alejada y le perjudica, no contará el tiro, pero tendrá 2 golpes de castigo.\n\nEl jugador deberá corregir su infracción repitiendo el tiro desde la mesa de salida correcta (3er golpe).\n\nSi no corrige el error quedará descalificado.",
                       @"Si el jugador teme que sea imposible encontrar su bola o que pueda estar fuera de límites, podrá jugar una bola provisional.\n\nEl jugador deberá anunciar dicha bola como “provisional“. Para jugar la bola provisional se puede usar Tee  y se deberá jugar esa bola hasta llegar al lugar donde se supone que podría estar la bola original. (Ver “Fuera de límites / bola provisional“).\n\nSi el jugador no anuncia explícitamente que su segunda bola es una “bola provisional“, ésta se convertirá en la nueva bola en juego con 1 golpe de castigo.\n\nSi la bola cae dentro de un obstáculo de agua, no se tendrá la opción de jugar una bola provisional.(Regla 27)"]],
                   @[@[@"El término “recorrido“ incluye todos los fairways y todas las áreas de semi rough, rough y barbas de green así como todos las demás mesas de salida y todos los greenes menos el del hoyo que está jugando.\n\nSi se encuentra en otro lugar (tee, trampa de arena, obstáculo de agua, fuera de límites, green), consulte por favor la sección correspondiente.",
                       @"Siempre juega primero el que tiene la bola más alejada del hoyo. Si un jugador golpea la bola cuando no es su turno, cuenta el golpe y no hay castigo.\n\nExcepto: ponerse de acuerdo para jugar fuera de turno por razones tácticas implicaría una descalificación.",
                       @"El jugador debe aceptar la posición en la que se encuentran él y su bola. Antes del tiro,  no se puede mover, doblar o romper cualquier cosa fija o en crecimiento (plantas, ramas, etc.) para mejorar la posición de la bola, el stance o efectuar el swing o la línea de juego (2 golpes de castigo).\n\nIncurrirá igualmente en 2 golpes de castigo si dobla o rompe cualquier cosa al hacer su swing de práctica y pudiera de este modo obtener ventaja antes de realizar su tiro.(Regla 13)",
                       @"El jugador dispone de un máximo de 5 minutos para encontrar su bola. Transcurrido este tiempo, se considerará su bola como perdida y deberá volver al lugar donde hizo su tiro anterior y dropear una bola, con 1 golpe de castigo (en caso de regresar a la Mesa de Salida, podrá volver a usar Tee).",
                       @"Si el jugador no está seguro de que la bola encontrada sea la suya, puede marcar la posición y levantarla para identificarla. Antes de levantarla, se debe anunciar la intención al co-competidor, dándole la oportunidad de observar el proceso. Si no se cumple con este procedimiento, el jugador tendrá 1 golpe de castigo.\n\nSi la bola está sucia y no se puede, por consiguiente, ver si es la bola del jugador, éste podrá limpiarla ligeramente pero sólo lo estrictamente necesario para permitir su identificación. Seguidamente, deberá volver a colocar la bola exactamente en el mismo lugar.\n\nSi el jugador es incapaz de identificar indiscutiblemente la bola como suya (el jugador encuentra por ejemplo dos bolas de la misma marca y con el mismo número o el jugador no recuerda ni la marca ni el número de bola que jugaba), se considerará como “bola perdida“: dropear con 1 golpe de castigo en el lugar donde se realizó el último tiro (en caso de regresar a la Mesa de salida, se puede usar Tee de nuevo).",
                       @"Si el jugador mueve accidentalmente su bola mientras la esta buscando, deberá reponerla y tendrá 1 golpe de castigo (no hay castigo durante la búsqueda en una condición anormal del terreno como sería una zona de reparación o en una obstrucción). Si el jugador no repone su bola y la juega lo habrá hecho desde un lugar equivocado (2 golpes de castigo).\n\nSi otro jugador mueve la bola, deberá igualmente reponerla, pero en este caso, no hay castigo.",
                       @"Si el jugador ejecuta un swing de práctica y desplaza accidentalmente su bola, no le contará el tiro. El jugador deberá reponer su bola a la posición antes del swing de práctica con 1 golpe de castigo. Si no la repone y la juega, tendrá 2 golpes de castigo  por jugar desde un lugar equivocado.(Regla 18)",
                       @"Si como consecuencia de apoyar el bastón el jugador hace que la bola se mueva, deberá reponerla con 1 golpe de castigo. Si la juega sin reponerla, el castigo será de 2 golpes por jugar desde un lugar equivocado.(Regla 18)",
                       @"Si la bola en reposo es movida por una causa ajena (espectador, animal, otro jugador, otra bola), el jugador deberá reponerla sin castigo. Si alguien toma la bola y se la lleva, el jugador puede poner una nueva bola sin castigo en el lugar donde se encontraba.",
                       @"Está permitido preguntar acerca de las distancias, la situación de los obstáculos o del fuera de límites y la posición de la bandera.\n\nTambién se puede igualmente hacer preguntas acerca de las reglas y otras generalidades. Si el jugador no alcanza a ver la bandera, otra persona le puede indicar la línea de juego (no obstante, la persona o la señal que indica la posición debe retirarse antes de ejecutar el tiro).\n\nSin embargo, está prohibido pedir consejo o darlo (“¿Qué bastón usaste?“, “¿Qué fierro me recomiendas?“, “Usa mejor la madera.“, etc.), en tal caso incurrirá en 2 golpes de castigo.\n\n(Excepción: está permitido pedir consejo al caddie así como al compañero en un Torneo por equipos.) Si el jugador recibe consejo sin haberlo solicitado no tendrá castigo alguno.(Regla 8)"],
                     @[@"Siempre juega primero el que tiene la bola más lejos del hoyo. Si un jugador golpea juega cuando no es su turno, cuenta el golpe y no hay castigo. Sin embargo, si los jugadores se han puesto de acuerdo para jugar fuera de turno para dar a uno de ellos una ventaja táctica, quedarán descalificados.(Regla 10)",
                       @"Si el jugador juega una bola que no era la suya no le contará el tiro pero incurrirá en 2 golpes de castigo. El jugador deberá volver al lugar donde se confundió  de bola y jugar la bola correcta (reponer la bola equivocada).\n\nSi el jugador no encuentra su bola original, deberá volver al lugar donde efectuó su último tiro con esta bola y dropear una bola con 1 golpe de castigo adicional (en la Mesa de Salida, se puede acomodar la bola sobre un tee).\n\nSi el jugador acaba el hoyo con la bola equivocada y no corrige el error, quedará descalificado.\n\nResumen del procedimiento:\n\n1.- 1er Golpe\n2.- Jugador se da cuenta que tiró la  bola equivocada\n3.- Los tiros no con bola equivocada no cuenta y el jugador regresa a la bola correcta\n4.- Tira el segundo golpe y se le suman dos más de castigo",
                       @"Si la bola golpea un poste, un árbol, una persona de la galería, un animal, otra bola o cualquier “causa ajena“ que no forma parte del juego, se considerará una eventualidad del juego. No hay castigo y el jugador deberá jugar la bola como quede.(Regla 19)",
                       @"Si la bola golpea al jugador o a su equipo, incurrirá en 1 golpe de castigo y deberá jugar la bola como quede.(Regla 19)",
                       @"Si el bastón rebota y le pega accidentalmente a la bola más de una vez, se deberá añadir 1 golpe de castigo al tiro.(Regla 14)",
                       @"Si el jugador teme que sea imposible encontrar su bola o que pueda estar fuera de límites, porá jugar una bola provisional. Es importante que el jugador anuncie su bola como “provisional“ a los demás co-competidores.\n\nPara jugarla bola provisional se puede usar Tee si el tiro se hizo desde la Mesa de Salida  y se deberá jugar esa bola hasta llegar al lugar donde se supone que podría estar la bola original. (Ver “Fuera de límites / bola provisional“).\n\nSi el jugador no anuncia explícitamente que su segunda bola es una “bola provisional“, ésta se convertirá en la nueva bola en juego con 1 golpe de castigo.\n\nSi la bola cae dentro de un obstáculo de agua, no se tendrá la opción de jugar una bola provisional.(Regla 27)"],
                     @[@"Hojas, ramas, piedras, pasto cortado y otros objetos naturales se pueden quitar sin castigo. Si al hacerlo la bola se mueve, repóngala con 1 golpe de castigo.\n\nAtención: la arena y la tierra suelta sólo se pueden quitar en el Green y no en el resto del campo (2 golpes de castigo).(Regla 23)",
                       @"Botellas, latas, letreros, estacas (amarillas, rojas, azules) y otros objetos artificiales se pueden quitar sin castigo. Si al hacerlo la bola se mueve, se puede reponer sin castigo.\nSi la bola reposa en o sobre una obstrucción movible, podrá igualmente quitarse. Luego, se deberá dropear la bola en el lugar original.\n\nAtención: El jugador nunca podrá quitar las estacas blancas que marcan el límite del campo (2 golpes de castigo).",
                       @"Las superficies artificiales de caminos y carreteras u otras instalaciones permiten un alivio sin castigo si interfieren con la posición de la bola, con el stance o con el área del swing (interferencia con la línea de juego no da lugar).\n\nPara aliviarse, el jugador deberá buscar el punto más cercano donde no exista interferencia con la obstrucción al ejecutar el movimiento. La bola deberá ser dropeada dentro de la distancia de un bastón.",
                       @"Importante: el punto más cercano puede encontrarse dentro de un matorral, en el rough o en una pendiente - en tal caso, a veces es preferible jugar la bola como esta.\n\nNo hay alivio de los objetos que definen el fuera de límites como lo son las estacas blancas, bardas y rejas, etc.\n\nAdemás, las Reglas Locales pueden declarar ciertas instalaciones como parte integrante del campo, lo que prohíbe  cualquier alivio.\n\nProcedimiento para elegir el punto de alivio:\n\n1.- El punto A es el más cercano a donde reposaba la bola.\n2.- El punto B también es de alivio pero no se debe elegir ese pues está más alejado de donde se encontraba la bola\n3.- La bola de dropea dentro del la distancia definida por un bastón y sin acercarse a la bola\n\nEste apartado incluye los terrenos en reparación (generalmente definidos en azul o con pintura blanca enumerados en las Reglas Locales), el agua ocasional (charcos visibles) y los hoyos, desechos o sendas hechos por un animal de madriguera (sobre todo topos, agujeros de ratones y madrigueras de conejos).",
                       @"Si el jugador no encuentra su bola pero está seguro de que está perdida en una condición anormal del terreno y no en otra parte, tendrá igualmente derecho a aliviarse sin castigo.\n\nProcedimiento para el alivio:\n\n1.- Es este caso el punto de referencia será el punto por donde la bola entró a la condición anormal del terreno.\n2.- A partir de ese punto se define el punto de alivio buscando que no haya intereferencia para la bola ni para el jugador. Este punto se puede marcar con un tee.\n3.- Se define el área de dropeo sin acercarse a la bandera.\n4.- Se dropea la bola sin castigo dentro de dicha área.",
                       @"Si la bola cae en un green que no corresponde al hoyo que se está jugando, no se podrá desde esta posición y deberá aliviarse sin castigo. El jugador deberá ubicar un punto en el borde más cercano del green, sin acercarse al hoyo, y dropear su bola dentro de la distancia de un bastón. Generalmente esto será en las barbas del green. Está permitido colocarse en el green para jugar una bola que no reposa en el green.(Regla 25).",
                       @"Si la bola queda enterrada por su propio impacto en cualquier área cortada a ras (fairway, barbas de green, green pero no semi rough o rough), el jugador puede levantarla, limpiarla y dropearla sin castigo tan cerca como sea posible del punto donde estaba.",
                       @"Si dos bolas quedan tan cerca una de otra que interfieren mutuamente el juego, se puede marcar una de ellas, levantarla y reponerla una vez se haya jugado la otra.(Regla 22)",
                       @"Si la bola queda en una situación lamentable que no está especialmente identificada en las reglas, es cuestión de mala suerte. La bola deberá jugarse como reposa También se puede, si el jugador así lo desea, declararla injugable (con 1 golpe de castigo).(Regla 13)",
                       @"Si la bola está en muy mala situación, es aconsejable que el jugador la declare injugable. Es una decisión exclusiva del jugador y no necesita la aprobación de su anotador. Después el jugador puede escoger entre tres opciones, todas con 1 golpe de castigo:\n\n1.- Dropear la bola con un golpe de castigo dentro de un área definida por dos bastones y sin acercarse a la bandera.\n2.- Dropear la bola con un golpe de castigo en la prolongación hacia atrás de una línea recta  entre la bandera y la bola.\n3.- Dropear la bola con un golpe de castigo regresando al punto en donde se hizo el tiro anterior. (en caso de regresar a la Mesa de Salida se puede volver a usar Tee).\n\nSi después de dropear la bola vuelve a la misma situación de injugable o queda simplemente mal colocada, es pura mala suerte. Deberá jugarse como reposa o puede declararse de nuevo injugable, con 1 nuevo golpe de castigo."]],
                     @[@[@"Ramas, hojas y piedras* y demás objetos naturales no se pueden tocar ni quitar en bunker antes del tiro (2 golpes de castigo).\n\nConsulte las Reglas Locales - a menudo permiten, excepcionalmente, quitar las piedras sin castigo.",
                         @"Objetos artificiales se pueden quitar sin castigo. Si al hacerlo se toca la arena, no hay castigo. Si al hacerlo se mueve la bola: se puede reponer, sin castigo.(Regla 24)",
                         @"Si la bola queda en una condición anormal del terreno (por ejemplo, un charco, terreno en reparación) o si su colocación estuviera en una de ellas, tiene derecho a aliviarse bajo el siguiente procedimiento:\n\n1.- Dropearse sin castigo dentro de la arena  a una distancia máxima de un bastón medido a partir del punto que permita el alivio.\n2.- Dropearse fuera de la arena pero con un golpe de castigo en la prolongación hacia atrás de la línea bandera-bola.",
                         @"Si la trampa de arena está llena de agua, el jugador sólo tendrá la opción de jugar la bola como reposa o dropar con 1 golpe de castigo fuera de la trampa de arena en la prolongación hacia atrás de la línea bandera-bola.(Regla 25)",
                         @"Si dos bolas quedan tan cerca una de otra que se interfieren mutuamente el juego, se puede marcar una de ellas y levantarla. Luego, al reponerla, es necesario recrear lo mejor posible su posición inicial (rastrillar la arena, hundir la bola si fuera el caso, etc.).",
                         @"Si la bola queda en una situación lamentable que no está expresamente contemplada en las reglas, es pura mala suerte. Se deberá jugarla como reposa o se podrá declarar la bola injugable (con 1 golpe de castigo).(Regla 13)",
                         @"Si el jugador declara injugable una bola que quedó dentro de la trampa de arena, puede escoger entre las tres posibilidades siguientes, todas con 1 golpe de castigo:\n\n1.- Dentro de la arena, dropear la bola con un golpe de castigo en un área  definida por hasta dos bastones y sin acercarse a la bandera.\n\n2.- Dentro de la misma arena, dropear la bola con un golpe de castigo en la prolongación hacia atrás de la línea bandera-bola\n\n3.- Dropear la bola en el punto desde donde se realizó el tiro anterior (si fue en la Mesa de Salida, se puede volver a usar Tee).\n\n- Si después de dropear la bola vuelve a la misma situación de injugable o queda simplemente mal colocada, es pura mala suerte. Deberá jugarse como haya quedado también se puede declarar de nuevo injugable, con 1 nuevo golpe de castigo.(Reglas 13 y 27)\n1. Dentro de la arena, dropear dentro de la distancia de dos palos, con 1 golpe de penalidad.\n2. Dentro de la arena, dropear en la prolongación hacia atrás de la línea hoyo-bola, con 1 golpe de penalidad.\n3. Dropear en el lugar del último golpe, con 1 golpe de penalidad (en el tee, acomodar)."],
                       @[@"Una bola está en la trampa de arena si toca la arena de éste. Los islotes o las paredes de pasto situados dentro de una trampa de arena no forman parte de la misma.(Definición, Trampa de Arena)",
                         @"No se pueden probar las condiciones de la trampa de arena antes de ejecutar el tiro(tocar la arena o rastrillarla, hacer swings de práctica tocando la arena, apoyar el bastón al preparar el tiro o tocar la arena en el backswing) - si lo hace, incurrirá en 2 golpes de castigo.\n\nSin embargo, está permitido apoyar el rastrillo o un bastón dentro de la trampa de arena. Además está permitido reparar huellas con el único propósito de cuidar el campo siempre que no estén en la línea de juego y que esto no implique ninguna ventaja para el siguiente tiro.",
                         @"Si el jugador no encuentra su bola aunque la haya visto entrar en una trampa de arena, es posible que esté hundida en la arena. Para localizar su bola, el jugador tiene derecho a rastrillar o tantear quitando arena.\n\nSi la bola se mueve: se puede reponer sin castigo tratando de recrear la situación inicial. Se tienen tiene hasta 5 minutos para encontrar la bola.(Regla 12)",
                         @"Si el jugador no está seguro de que la bola encontrada sea la suya, puede marcar su posición y levantar la bola para identificarla. Antes de levantarla, debe anunciar su intención a su co-competidor dándole la oportunidad de observar todo el proceso.\n\nSi no se cumple con este procedimiento el jugador tendrá 1 golpe de castigo. Si la bola está sucia y por ende no se puede identificar, el jugador podrá limpiarla ligeramente pero sólo lo estrictamente necesario para permitir su identificación.\n\nSeguidamente, deberá reponer la bola exactamente en el mismo lugar recreando la posición inicial (rastrillando la arena, eventualmente hundiendo la bola, etc.).(Regla 12)",
                         @"Está permitido informarse acerca de distancias, obstáculos y fuera de límites. Si desde la trampa de arena no se puede ver la bandera, el jugador puede pedir a otra persona que le indique la línea de juego (no obstante, la persona o la señal que indica la posición debe retirarse antes del tiro).\n\nSin embargo, están prohibidas las preguntas y los consejos acerca de la elección de bastón o del modo de dar un golpe (2 golpes de castigo).\n\nUn jugador que recibe consejo sin haberlo solicitado no incurrirá en castigo alguno."],
                       @[@"Si el jugador pega una bola que no era la suya, no le contará el golpe pero tendrá 2 golpes de castigo. Deberá volver al lugar donde se confundió de bola y jugar la bola original (reponer la bola equivocada recreando su posición original).(Regla 15)",
                         @"Si la bola golpea el rastrillo, un poste, un árbol, un espectador, un animal, otra bola o cualquier “causa ajena“ que no forma parte del juego, se considerará una eventualidad del juego. No hay castigo y se deberá jugar la bola como haya quedado.(Regla 19)",
                         @"Si la bola golpea al jugador o a su equipo, se tendrá en 1 golpe de castigoy se deberá jugar la bola como haya quedado.(Regla 19)",
                         @"Si el jugador no logra sacar la bola de la trampa de arena y ésta vuelve a quedar en las huellas de sus pies, es cuestión de mala suerte. Jugará la bola como reposa o podrá declararla injugable con 1 golpe de castigo.(Regla 13)",
                         @"Si el jugador no saca la bola de la trampa de arena y ésta queda en otro lugar dentro de la misma trampa de arena, puede rastrillar las huellas del primer tiro antes de ejecutar el siguiente tiro pero sigue estando vigente la prohibición de apoyar el bastón en la arena.(Regla 13)",
                         @"Si al golpear la bola el bastón accidentalmente lo hace más de una vez, deberá añadir 1 golpe de castigo a su golpe.(Regla 14)",
                         @"Si al tirar desde la trampa de arena el jugador manda la bola fuera de límites o a un lugar donde no la puede encontrar, deberá dropear una bola donde efectuó el último golpe - en este caso de nuevo dentro de la trampa de arena - con 1 golpe de castigo. Sin embargo, tiene derecho a rastrillar la trampa de arena antes de dropear la bola. "]],
                   @[@[@"Una bola está en un obstáculo de agua en cuanto lo toca. Las estacas que definen el límite están dentro del obstáculo (es decir, el límite se toma a partir de la parte exterior de las estacas).(Definición, Obstáculo de Agua y Obstáculo de Agua Lateral)",
                       @"Si el jugador mueve accidentalmente su bola durante su búsqueda, deberá reponerla e incurrirá en 1 golpe de castigo.\n\nSi otro jugador mueve su bola, deberá igualmente reponerla pero en este caso, no hay castigo.(Regla 18)",
                       @"Si el jugador no está seguro de que la bola encontrada sea la suya, puede marcar su posición y levantarla para identificarla. Antes de levantarla, debe anunciar su intención a su co-competidor dándole la oportunidad de observar todo el proceso.\n\nSi no cumple con este procedimiento incurrirá en 1 golpe de castigo. Si la bola está sucia, podrá limpiarla lo indispensable para su identificación. Seguidamente, deberá colocarla en el mismo lugar.(Regla 12)",
                       @"Si una bola sale en dirección a un obstáculo de agua pero el jugador no la ha visto caer en el agua, no podrá aplicar la regla de obstáculo de agua.\n\nSólo podrá aplicar la regla de obstáculo de agua “frontal“ u obstáculo de agua lateral si sabe o es prácticamente seguro que su bola ha ido a parar al mencionado obstáculo. De lo contrario, tendrá que considerar su bola como normalmente “perdida“ y por consiguiente deberá dropear una nueva bola en el lugar de su último golpe con un golpe de castigo (en la Mesa de Salida puede volver a usar Tee). (Reglas 26 y 27).",
                       @"Si una bola queda en un obstáculo de agua, el jugador tiene básicamente dos opciones:\n\n1.- Sin castigo, jugar la bola como reposa.\n2.- Con 1 golpe de castigo, dropear una bola fuera del obstáculo de agua siguiendo el procedimiento definido en la regla de obstáculo de agua frontal (estacas amarillas) y obstáculo de agua lateral(estacas rojas).\n\n- Si el obstáculo de agua es un lugar medioambientalmente protegido al cual está prohibido el acceso, sólo le quedará la segunda opción. (Reglas 13 y 26)",
                       @"Si una bola queda en, o está perdida dentro de un obstáculo de agua “frontal“ (estacas amarillas), el jugador podrá dropear una bola fuera de él de la siguiente manera:\n\n1.- Dropear con 1 golpe de castigo en la prolongación hacia atrás de la línea bandera-punto de entrada (X).\n2.- Dropear con 1 golpe de castigo en el lugar del último golpe (en la Mesa de Salida se puede usar de nuevo Tee).\n\nHay que tener en cuenta que las Reglas Locales: pueden ofrecer la opción  adicional de una “zona de dropeo“ para este efecto.",
                       @"Si una bola queda en, o está perdida dentro de un obstáculo de agua lateral (estacas rojas), el jugador podrá dropear una bola fuera de él de la siguiente manera:\n\n1.- Dropear con 1 golpe de castigo dentro de la distancia de dos palos del punto de entrada (X).\n2.- Dropear con 1 golpe de castigo dentro de la distancia de dos palos del punto de entrada en el lado opuesto (a la misma distancia del hoyo).\n3.- Dropear con 1 golpe de castigo dentro de la prolongación hacia atrás de la línea bandera – punto de entrada.\n4.- Dropear con 1 golpe de castigo en el lugar del último golpe (en la Mesa de Salida se puede volver a usar Tee)."],
                     @[@"Los objetos naturales tales como ramas, hojas, piedras, etc. no se pueden tocar ni quitar antes del tiro dentro de un obstáculo de agua (2 golpes de castigo).(Regla 23)",
                       @"Los letreros, estacas (amarillas, rojas) y demás objetos artificiales se pueden quitar sin castigo. Si al hacerlo usted toca el suelo o el agua no hay castigo. Si al hacerlo la bola se mueve, repóngala, sin castigo.(Regla 24)",
                       @"Si una bola queda en un obstáculo de agua no hay alivio de puentes, tuberías u otras instalaciones artificiales. Sin embargo, si el jugador juega su bola como haya quedado le está permitido tocar la obstrucción con el bastón (p. ej. apoyar el bastón sobre un puente al preparar el tiro).(Regla 24)",
                       @"No hay alivio de charcos, huellas de animales, etc., que estén dentro de un obstáculo de agua. La bola se jugará como haya quedado o se dropeara con 1 golpe de castigo según la regla de obstáculo de agua frontal o el obstáculo de agua lateral. (Regla 25)",
                       @"Si dos bolas quedan tan cerca una de otra que interfieren mutuamente el juego, se puede marcar una de ellas, levantarla y luego reponerla.(Regla 25)",
                       @"En un obstáculo de agua el jugador no puede declarar su bola injugable. Es necesario proceder según la regla de obstáculo de agua frontal u obstáculo de agua lateral.(Regla 28)"],
                     @[@"Las condiciones del obstáculo de agua no se pueden probar antes del golpe (no tocar el suelo o el agua con la mano o al hacer un swing de práctica, no apoyar el bastón al preparar el tiro - sin embargo, se pueden tocar las hierbas altas). De no respetar lo anterior, el jugador tendrá 2 golpes de castigo.(Regla 13)",
                       @"Está permitido informarse acerca de distancias, obstáculos y fuera de límites. Si el jugador no puede ver la bandera, otra persona puede indicarle la línea de juego (no obstante, la persona o la señal que indica la posición debe retirarse antes de ejecutar el tiro).\nSin embargo, están prohibidas las preguntas y los consejos acerca de la elección de bastón o del modo de dar un golpe (2 golpes de castigo).\nUn jugador que recibe consejo sin haberlo solicitado no incurrirá en castigo alguno."],
                     @[@"Si un jugador ejecuta un tiro dentro de un obstáculo de agua con una bola que no era la suya, no le contará el golpe pero tendrá 2 golpes de castigo. Deberá volver al lugar donde se confundió de bola y jugar la bola original (reponer la bola equivocada).(Regla 15)",
                       @"Si un jugador tira desde dentro de un obstáculo de agua y no ha logrado sacar la bola de él, contará el golpe pero tendrá siempre la posibilidad de proceder según la regla de obstáculo de agua frontal o obstáculo de agua lateral (1 golpe de castigo). Como lugar del último golpe se puede elegir el de dentro del obstáculo o el que se dio desde fuera del obstáculo.(Regla 26) ",
                       @"Si una bola golpea una estaca, un poste, un árbol, un espectador, un animal, otra bola o cualquier “causa ajena“ que no forma parte del juego, se considerará una eventualidad del juego. No hay castigo y el jugador deberá jugar la bola como quede.(Regla 19)",
                       @"Si la bola golpea al jugador o a su equipo, se tendrá 1 golpe de castigo y se deberá jugar la bola como haya quedado.(Regla 19)",
                       @"Si al golpear la bola el bastón accidentalmente lo hace más de una vez, deberá añadir 1 golpe de castigo a su golpe."]],
                   @[@[@"Una bola está fuera de límites cuando toda ella reposa fuera de límites. Las estacas que lo definen (blancas) están fuera de límites.\n\nLa mejor manera de determinar si una bola está fuera de límites es situarse detrás de una estaca y observar la línea con la siguiente estaca. Hay que prestar atención a los fuera de límites mencionados en las Reglas Locales que podrían no estar señalizados con estacas o pintura blanca.(Definición “Fuera de Límites“)",
                       @"Si una bola queda fuera de límites, el jugador sólo tiene una opción:\n\nDropear con 1 golpe de castigo en el lugar del último tiro (en el lugar de salida, acomodar la bola). El siguiente tiro ejecutado contará como 3er golpe.\n\nSin embargo, si el jugador ha jugado una bola provisional, ésta se convierte en la bola en juego con 1 golpe de castigo.(Regla 27)",
                       @"El jugador puede colocarse en stance fuera de límites para jugar una bola que no lo está. Si se diera el caso, el jugador puede quitar sin castigo impedimentos sueltos (hojas, piedras, etc.) y obstrucciones movibles (artificiales) que estuvieran fuera de límites.\n\nNo hay alivio sin castigo de obstrucciones inamovibles y condiciones anormales del terreno (charcos, terrenos en reparación, huellas de animales) que estuvieran fuera de límites.\n\nEl jugador nunca podrá aliviarse de los objetos que definen los fuera de límites tanto si son movibles o inamovibles.(Regla 13, 23, 24 y 25)"],
                     @[@"Si el jugador teme que sea imposible encontrar su bola o que pueda estar fuera de límites, puede jugar una bola provisional para ahorrar tiempo. Debe anunciarla como “provisional“ y dropearla en el lugar donde efectuó su último tiro (en la Mesa de Salida se puede volver a usar Tee).\n\nSe deberá jugar esta bola hasta que llegue a la zona donde se supone que está la bola original.\nSólo se puede jugar una bola provisional antes de adelantarse a buscar la original. Sin embargo, está permitido avanzar hasta unas 50 yardas.\n\nSi el jugador busca más adelante (más de 50 yardas) y luego vuelve hacia atrás para jugar una supuesta bola provisional, ésta no es una provisional sino la nueva bola en juego (con 1 golpe de castigo).\n\nSi la bola ha ido a parar a un obstáculo de agua, el jugador no tiene la opción de jugar una bola provisional.(Regla 27)",
                       @"Si el jugador juega una segunda bola sin anunciar que se trataba de una “provisional“, se convertirá en la nueva bola en juego con 1 golpe de castigo. En este caso, la bola original está “perdida“ y bajo ningún concepto puede ser jugada (esto equivaldría a jugar una bola equivocada).(Regla 27)",
                       @"Si el jugador efectúa el golpe de su vida con la bola provisional, quizás le convendría no encontrar su bola original. En este caso, se puede limitar a no buscar su bola original. No obstante, el jugador no puede dar por “perdida“ su bola original por declaración.\n\nSi a pesar de todo se encuentra la primera bola (dentro de los 5 minutos de búsqueda y no está fuera de límites), se deberá seguir jugando con esa bola.(Regla 27)",
                       @"El jugador puede jugar la bola provisional hasta que llegue al lugar donde se supone que está su bola original. Está permitido que la bola provisional sobrepase este punto pero no se puede ejecutar un tiro desde allí.\n\nSi el jugador lo hace antes de encontrar su bola original, la bola provisional se convierte automáticamente en la nueva bola en juego con 1 golpe de castigo.",
                       @"Si el jugador encuentra su bola original dentro de los 5 minutos de búsqueda y no está fuera de límites, deberá continuar el juego con esta bola. La bola provisional debe de ser recogida y los golpes dados con ésta no cuentan.",
                       @"Si el jugador encuentra su bola original dentro de los 5 minutos de búsqueda y no está fuera de límites, deberá continuar el juego con esta bola - incluso si está mal situada o injugable. Bajo ningún concepto podrá jugar la bola provisional (esto equivaldría a jugar una bola equivocada).\n\nSi el jugador declara su bola original injugable, debe proceder estrictamente según la regla de “bola injugable“ y, si se diera el caso, incluso volver al lugar donde ejecutó el último tiro.(Reglas 27 y 28)",
                       @"Si una bola original queda efectivamente fuera de límites o si no se le ha encontrado dentro de los 5 minutos de búsqueda, la bola provisional se convierte en la bola en juego con 1 golpe de castigo, es decir que contarán todos los golpes realizados tanto con la bola original como con la provisional, más 1 golpe de castigo.(Regla 27)"]],
                   @[@[@"En principio, el jugador no debe mejorar la línea de putt. En la línea de putt sólo se pueden reparar impactos de bola (divots) o viejas tapas de hoyos. Sobretodo las marcas de spikes deben dejarse tal como están pero deberían repararse después de haber terminado el hoyo.(Regla 16)",
                       @"Si a causa del impacto una bola ha quedado empotrada en el green, se deberá marcar su posición, levantar la bola y reparar el impacto. Luego, se puede reponer la bola sin castigo.(Regla 16)",
                       @"Objetos naturales tales como hojas, ramas, piedras, etc. pueden sacarse, sin castigo. En el green, también puede sacarse la arena y la tierra suelta (pero nunca de las barbas del Green o de cualquier otro lugar!). Al hacerlo, no se pueden allanar irregularidades en la línea de putt. Si la bola o el marcador de bola se mueven: reponerlos, sin castigo.(Regla 23)",
                       @"Guantes perdidos, tarjetas de score  y otros objetos artificiales pueden quitarse sin castigo. Si al hacerlo la bola se mueve, se puede reponer sin castigo.(Regla 24)",
                       @"Generalmente, los aspersores de riego se instalan fuera del green, p. ej. en las barbas del green. Según las reglas, esta zona se considera “recorrido“ y por consiguiente el jugador tiene derecho a aliviarse solamente si el aspersor interfiere en su stance o en su swing.\n\nSi el aspersor está situado simplemente en la línea de juego, la bola se jugará como reposa.\n\nSi una bola reposa en el green y el aspersor estuviera en su línea de putt, puede colocar su bola en el lugar más cercano que evite la interferencia pero no más cerca del hoyo, sin castigo. (Nota: este punto puede estar fuera del green).",
                       @"El jugador podrá aliviarse si su bola o sus pies están en dichas condiciones y también si éstas interfieren en su línea de putt. Coloque su bola en el lugar más cercano donde no exista la interferencia, sin acercarse al hoyo. (Nota: este punto puede estar fuera del green).(Regla 25)",
                       @"Si una bola está en un green doble (con dos hoyos) en el lado del hoyo inadecuado, debe jugar la bola como reposa. Si el hoyo impropio interfiere en su línea de putt, podrá colocar su bola en el punto más cercano donde este hoyo no esté en su línea de putt, sin castigo.(Regla 25)"],
                     @[@"Una bola está en el green cuando lo toca. Según las reglas, las barbas de green no forman parte del green, pero sí del recorrido (ver sección correspondiente: “En el recorrido (fairway, rough, etc.)“).(Definición “Green“)",
                       @"Si una bola aterriza en un green que no corresponde al hoyo que se está jugando, no podrá jugarse desde esta posición y deberá aliviarse sin castigo\n\nLa bola deberá situarse en el borde de green más cercano, sin acercarse al hoyo, y dropeando la bola dentro de la distancia de un bastón. Generalmente esto será en las barbas de green. Está permitido que el jugador haga su stance en el green para jugar una bola que no reposa en el green.(Regla 25)",
                       @"Si una bola queda suspendida entre el asta de la bandera y el borde del hoyo, el jugador puede mover o quitar la bandera para que la bola caiga dentro del hoyo. Se considerará que ha embocado con su último tiro.(Regla 17)",
                       @"Juega siempre primero el jugador cuya bola está más alejada del hoyo (independientemente de que una bola repose en el green y otra aún esté fuera de él).\n\nPara ahorrar tiempo, a menudo se pasa por alto este honor tanto en el green como alrededor lo cual no conlleva castigo.\nExcepción: ponerse de acuerdo para jugar fuera de turno por razones tácticas conllevaría una descalificación.(Regla 10)",
                       @"El jugador no debe probar el green haciendo rodar una bola o raspando la superficie (2 golpes de castigo).(Regla 16)",
                       @"El jugador no debe mejorar la línea de putt caminando sobre ella o tocándola (2 golpes de castigo). En la línea de putt sólo se pueden reparar impactos de bola (divots) o viejas tapas de hoyos. Sobretodo las marcas de spikes deben dejarse tal como están pero deberían repararse después de haber terminado el hoyo.(Regla 16)",
                       @"En el green, el jugador puede marcar la posición de su bola, levantarla y limpiarla. La bola debería marcarse con un marcador o una moneda. Aunque está permitido marcar la bola con un tee, un sacadivots o similar, no es muy recomendable.(Reglas 16 y 20)",
                       @"Si la bola o su marcador se mueven al marcar, levantar o reponer: se pueden volver a colocar, sin castigo.(Reglas 18 y 20)",
                       @"Si un marcador de bola se encuentra situado en la línea de putt de otro jugador, debería desplazarse una o dos cabezas de putt.\n\nEs importante acordarse después de volver a colocar la marca donde estaba inicialmente. Si no se hace y se juega la bola, contará el golpe y además se tendrán 2 golpes de castigo por haber jugado desde un lugar equivocado.\n\nSi una bola es desviada por un marcador de bola, es una eventualidad del juego. La bola debe jugarse como quede, sin castigo.",
                       @"El jugador puede pedir a otro jugador que marque y levante su bola. Repondrá la bola la persona que la levantó o el jugador.(Regla 20)",
                       @"Si el jugador se da cuenta de que la bola que acaba de jugar no es la suya, debe volver al lugar donde se confundió de bola y jugar la bola correcta. Los golpes jugados con la bola equivocada no cuentan pero se tendrán 2 golpes de castigo.\n\nSi el jugador no encuentra su bola original, deberá volver al lugar donde jugó el último tiro con esta bola y dropear una bola añadiendo 1 golpe de castigo adicional (en la Mesa de Salida se puede volver a usar Tee).\n\nSi el jugador acaba el hoyo con la bola equivocada y no corrige el error, está descalificado.(Regla 18)",
                       @"Si una bola ha quedado cortada, deformada o seriamente dañada (simplemente rayada no es suficiente) durante el juego del hoyo, podrá sustituirse  por otra, sin castigo.\n\nSin embargo, antes de hacerlo, debe anunciar su intención a su co-competidor y darle la oportunidad de examinar la bola. Si no lo hace, incurrirá en 1 golpe de castigo.(Regla 5)",
                       @"Si el jugador mueve su bola al preparar el golpe o al realizar un swing de práctica imprudente (no cuenta como golpe) deberá reponerla con 1 golpe de castigo. Si no la repone y la juega, incurrirá en 2 golpes de castigo por haberlo hecho desde un lugar equivocado.(Regla 18)",
                       @"Si una bola en reposo es movida por cualquier causa que no forma parte del juego (por ejemplo: espectador, animal, otro jugador, otra bola), el jugador deberá reponerla. Si han cogido su bola y se la han llevado, usted podrá poner una nueva bola en el lugar donde se encontraba, sin castigo.(Regla 18)",
                       @"No está permitido pedir o dar consejo, por ejemplo acerca de la línea de putt (“¿Hacia dónde cae el green, si hacia la derecha o hacia la izquierda?“, “Ten cuidado, cae mucho.“), de lo contrario incurrirá en 2 golpes de castigo.\n\nQuien recibe consejo sin haberlo pedido no incurre en castigo.\n\nEl jugador no puede hacer que alguien se sitúe en la prolongación de su línea de putt al ejecutar su tiro.(Reglas 8 y 14)",
                       @"La bola debe ser siempre golpeada y no debe ser empujada o arrastrada (2 golpes de castigo). Puede golpearse con cualquier parte de la cabeza del Putt (p. ej. La parte trasera del Putt).(Regla 14)",
                       @"Al ejecutar un tiro el jugador no debe aceptar de nadie protección contra los elementos (2 golpes de castigo).(Regla 14)"],
                     @[@"Si un jugador ejecuta su putt cuando no es su turno, cuenta el golpe y no hay castigo. Sin embargo, si los jugadores se han puesto de acuerdo para jugar fuera de turno para dar a uno de ellos una ventaja táctica, están descalificados.(Regla 10)",
                       @"Si el jugador se da cuenta de que la bola que acaba de jugar no es la suya, deberá volver al lugar donde se confundió de bola y jugar la bola correcta. Los golpes jugados con la bola equivocada no cuentan pero incurrirá en 2 golpes de castigo. Si el jugador acaba el hoyo con la bola equivocada y no corrige el error, está descalificado.\n\nSin embargo, si el jugador no ha jugado la bola de otro jugador si no que simplemente ha sustituido su bola por otra en el momento de reponerla, es decir el jugador ha marcado y levantado su bola y al reponerla, se ha sacado del bolsillo una bola que no era. Contará el golpe e incurrirá en dos golpes de castigo por haber sustituido la bola cuando no estaba permitido.(Regla 15)",
                       @"Si por descuido, después de haber levantado la bola la repone y la juega desde un lugar equivocado, contará el golpe e incurrirá en 2 golpes de castigo por haber jugado desde un lugar equivocado.(Regla 20)",
                       @"Si el jugador ejecuta un putt en el green y su bola toca otra bola en reposo, incurrirá en 2 golpes de castigo. El jugador deberá jugar su bola donde reposa y reponer la bola desplazada. Si le sucediera lo mismo habiendo jugado desde fuera de green, no incurrirá en castigo.(Regla 19)",
                       @"Si, jugando en el green, una bola golpea la bandera (no importa si está en el hoyo o quitada y apoyada en el suelo) o si golpea a la persona que la atiende, incurrirá en 2 golpes de castigo. La bola se jugará desde donde haya quedado.\n\nSi el jugador ha jugado desde fuera del green y la bola golpea la bandera no atendida: no hay castigo.(Regla 17)",
                       @"Si una bola es desviada por un marcador de bola, es una eventualidad del juego. La bola debe jugarse donde haya quedado, sin castigo.(Regla 19)",
                       @"Si después de un golpe en el green su bola golpea a un animal (excepto un insecto o u gusano) o cualquier “causa ajena“ que esté en movimiento o animada, el golpe deberá ser cancelado y repetido, sin penalidad (la bola se colocará).(Regla 19)",
                       @"Si después de un golpe en el green una bola golpea a otro jugador (excepto la persona que atiende la bandera), el golpe deberá ser cancelado y repetido, sin castigo colocando la bola en su posición original.(Regla 19)",
                       @"Si una bola queda colgando del agujero deberá acercarse inmediatamente al hoyo esperar 10 segundos. Si durante la espera la bola cae dentro del agujero, se considera embocada. Si lo hace después de los 10 segundos, se considerará igualmente embocada pero el jugador deberá añadir 1 golpe de castigo.(Regla 16)",
                       @"Si su bola bota en el interior del hoyo y vuelve a salir, no se considerará embocada puesto que la bola debe reposar en el fondo del hoyo. El jugador deberá embocarla de nuevo jugándola desde donde haya quedado.(Definición, Embocada)",
                       @"En stroke play, no está permitido concederse golpes. Si un jugador levanta su bola por equivocación, debe reponerla con 1 golpe de castigo y seguidamente embocarla, si no lo hace está descalificado.(Reglas 3 y 18)",
                       @"Una vez terminado el hoyo, el jugador puede entrenar repitiendo el putt si esto no supone demorar el juego (y no hay sido prohibido en las Condiciones de la Competencia).(Regla 7)"]],
                   @[@[@"Si la bola en reposo es movida por una causa ajena, por ejemplo un espectador, un animal, etc.:\n1.- Se deberá  la bola sin castigo.\n2.- Si no la repone y la juega, el jugador tendrá 2 golpes de castigo por haber tirado desde un lugar equivocado.\n3.- Si alguien coge una bola y se la lleva, el jugador puede poner una nueva bola sin castigo en el lugar donde se encontraba.(Regla 18)",
                       @"Si la bola en reposo es movida por otro jugador: reponer la bola, sin castigo.\nSi no la repone y la juega, el jugador tendrá 2 golpes de castigo por haber tirado desde un lugar equivocado.(Regla 18)",
                       @"Si una bola en reposo es golpeada por otra bola y resulta movida: reponer la bola, sin castigo (la otra bola se jugará como haya quedado).\n\nSi no se repone y se juega, el jugador tendrá 2 golpes de castigo por haber tirado desde un lugar equivocado.(Regla 18)"],
                     @[@"Si el jugador mueve su bola al preparar el golpe o al realizar un swing de práctica imprudente no cuenta como golpe y se deberá reponer la bola con 1 golpe de castigo.\nSi no se repone y se juega, el jugador tendrá 2 golpes de castigo por haberlo tirado desde un lugar equivocado.(Regla 18)",
                       @"Si el jugador mueve accidentalmente su bola durante su búsqueda: deberá reponer la bola, con 1 golpe de castigo (excepto: no hay castigo durante la búsqueda en una condición anormal del terreno, en una obstrucción o buscando una bola enterrada en la arena).\nSi no la repone y la juega, tendrá 2 golpes de castigo por haber tirado desde un lugar equivocado.(Regla 18)",
                       @"Si el jugador mueve accidentalmente su bola al quitar hojas, ramas, piedras, pasto cortado y otros objetos naturales: deberá reponer la bola, con 1 golpe de castigo (excepto en el green: sin castigo).\n\nSi no la repone y la juega, tendrá 2 golpes de castigo por haber tirado desde un lugar equivocado.(Regla 18)",
                       @"Si la bola se mueve al quitar objetos artificiales (por ejemplo el rastrillo): se deberá reponer la bola, sin castigo.\nSi no la repone y la juega, tendrá 2 golpes de castigo por tirado desde un lugar equivocado.(Regla 18)",
                       @"Si la bola o su marca se mueven al marcar, levantar o reponer en el green: reponer la bola sin castigo.\nSi no la repone y la juega, el jugador tendrá 2 golpes de castigo por haber tirado desde un lugar equivocado."],
                     @[@"Si una bola es desplazada por una ráfaga de viento o si ella sola se mueve: jugar la bola desde la nueva posición, sin castigo.(Regla 13 y definición “Causa ajena“)"]],
                   @[@[@"Si, después de un tiro desde fuera de green, la bola golpea la bandera en el hoyo, no atendida: jugar la bola como haya quedado, sin castigo.\n\nSi, después de un tiro jugando en el green, la bola golpea la bandera en el hoyo, no atendida: jugar la bola como haya quedado con 2 golpes de castigo.(Regla 17)",
                       @"Si una bola golpea la bandera atendida o quitada y apoyada en el suelo (no importa desde donde haya sido ejecutado el tiro): jugar la bola como haya quedado con 2 golpes de castigo.(Regla 17)",
                       @"Si una bola golpea a la persona que atiende la bandera: jugar la bola como haya quedado con 2 golpes de castigo.(Regla 17)"],
                     @[@"Si una bola golpea una causa ajena (espectador, animal, árbol, poste, etc.): se deberá jugar la bola como haya quedado, sin castigo. (Excepto en el green: si después de un golpe en el green, la bola toca una causa ajena en movimiento o animada: repetir el golpe, sin castigo).(Reglas 17 y 19)",
                       @"Si la bola golpea a otro jugador: jugar la bola como haya quedado, sin castigo. (Excepto en el green: si después de un golpe en el green, la bola toca a otro jugador: repetir el golpe, sin castigo).\n\nNota: Si este jugador atendía la bandera aplica la regla correspondiente.(Regla 19).",
                       @"Si una bola golpea al jugador o a su equipo: jugar la bola como haya quedado, con 1 golpe de castigo.(Regla 19)",
                       @"Si una bola golpea a otra bola en reposo: jugar la bola como haya quedado, sin castigo (excepto en el green: si las dos bolas están en el green antes del tiro: 2 golpes de castigo).\n\nLa bola desplazada debe ser recolocada.(Regla 19)"]]];
    self.texto.text=definiciones[self.index][self.indexPathChoice.section][self.indexPathChoice.row];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    [self.texto scrollRangeToVisible:NSMakeRange(0, 0)];
    
    [self createScroll];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.playButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(play:)];
    [self.playButton setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = self.playButton;
    [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    self.synthesizer=nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Scroll View

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = self.scrollView.frame.size.width; // you need to have a **iVar** with getter for scrollView
    float fractionalPage = self.scrollView.contentOffset.x / pageWidth;
    NSInteger page = lround(fractionalPage);
    self.pageControl.currentPage = page; // you need to have a **iVar** with getter for pageControl
}

-(void)createScroll{
    NSInteger count;
    if ((self.index==0 && self.indexPathChoice.section==1 && self.indexPathChoice.row==1)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==2)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==3)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==4)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==9)||(self.index==2 && self.indexPathChoice.section==1 && self.indexPathChoice.row==1)||(self.index==3 && self.indexPathChoice.section==0 && self.indexPathChoice.row==2)||(self.index==3 && self.indexPathChoice.section==0 && self.indexPathChoice.row==6)||(self.index==4 && self.indexPathChoice.section==0 && self.indexPathChoice.row==5)||(self.index==4 && self.indexPathChoice.section==0 && self.indexPathChoice.row==6)||(self.index==5 && self.indexPathChoice.section==0 && self.indexPathChoice.row==1)||(self.index==5 && self.indexPathChoice.section==1 && self.indexPathChoice.row==3)) {
        count = [imagenes[self.index][self.indexPathChoice.section][self.indexPathChoice.row] count]+1;
    }else{
        count = [imagenes[self.index][self.indexPathChoice.section][self.indexPathChoice.row] count];
    }
    
    self.scrollView.backgroundColor=[UIColor clearColor];
    self.scrollView.contentSize=CGSizeMake(self.view.frame.size.width*count, 220);
    self.scrollView.pagingEnabled=YES;
    self.scrollView.delegate=self;
    self.scrollView.showsHorizontalScrollIndicator=NO;
    for (int i=0; i<count; i++) {
        UIImageView*image;
        if ((self.index==0 && self.indexPathChoice.section==1 && self.indexPathChoice.row==1)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==2)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==3)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==4)||(self.index==2 && self.indexPathChoice.section==2 && self.indexPathChoice.row==9)||(self.index==2 && self.indexPathChoice.section==1 && self.indexPathChoice.row==1)||(self.index==3 && self.indexPathChoice.section==0 && self.indexPathChoice.row==2)||(self.index==3 && self.indexPathChoice.section==0 && self.indexPathChoice.row==6)||(self.index==4 && self.indexPathChoice.section==0 && self.indexPathChoice.row==5)||(self.index==4 && self.indexPathChoice.section==0 && self.indexPathChoice.row==6)||(self.index==5 && self.indexPathChoice.section==0 && self.indexPathChoice.row==1)||(self.index==5 && self.indexPathChoice.section==1 && self.indexPathChoice.row==3)) {
            if (i==count-1) {
                image=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width*i)+(self.view.frame.size.width/2)-((150*2.13)/2), 30, 150*2.13, 150)];
                image.contentMode=UIViewContentModeScaleAspectFit;
                
                image.layer.cornerRadius = 20.0;
                image.layer.borderColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.7] CGColor];
                image.layer.borderWidth = 3.0;
                image.layer.masksToBounds = YES;
                image.clipsToBounds = YES;
                image.animationImages = [NSArray arrayWithArray:[videoImagenes objectAtIndex:self.indexVideo]];
                [image setAnimationDuration:5];
                //[image setAnimationRepeatCount:1];
                [image startAnimating];
            }else{
                image=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width*i)+(self.view.frame.size.width/2)-105, 0, 210, 210)];
                image.contentMode=UIViewContentModeScaleAspectFit;
                
                image.layer.cornerRadius = 20.0;
                image.layer.borderColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.7] CGColor];
                image.layer.borderWidth = 3.0;
                image.layer.masksToBounds = YES;
                image.clipsToBounds = YES;
                image.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagenes[self.index][self.indexPathChoice.section][self.indexPathChoice.row][i]]];
            }
        }else{
            image=[[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width*i)+(self.view.frame.size.width/2)-105, 0, 210, 210)];
            image.contentMode=UIViewContentModeScaleAspectFit;
            
            image.layer.cornerRadius = 20.0;
            image.layer.borderColor = [[[UIColor whiteColor] colorWithAlphaComponent:0.7] CGColor];
            image.layer.borderWidth = 3.0;
            image.layer.masksToBounds = YES;
            image.clipsToBounds = YES;
            image.image=[UIImage imageNamed:[NSString stringWithFormat:@"%@",imagenes[self.index][self.indexPathChoice.section][self.indexPathChoice.row][i]]];
        }

        [self.scrollView addSubview:image];
    }
    
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPage = 0;
    [self.view addSubview:self.pageControl];
    self.pageControl.backgroundColor = [UIColor clearColor];
    self.pageControl.userInteractionEnabled=NO;
}

#pragma mark - Play Button

- (IBAction)play:(id)sender {
    if (play) {
        self.playButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(play:)];
        [self.playButton setTintColor:[UIColor whiteColor]];
        [self.synthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        play=NO;
    }else{
        self.playButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPause target:self action:@selector(play:)];
        [self.playButton setTintColor:[UIColor whiteColor]];
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:definiciones[self.index][self.indexPathChoice.section][self.indexPathChoice.row]];
        utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:BCP47LanguageCodeForString(utterance.speechString)];
        utterance.rate = .5;
        utterance.preUtteranceDelay = 0.05;
        [self.synthesizer speakUtterance:utterance];
        play=YES;
    }
    self.navigationItem.rightBarButtonItem = self.playButton;
}

#pragma mark - Language Recognizer

static NSString * BCP47LanguageCodeFromISO681LanguageCode(NSString *ISO681LanguageCode) {
    if ([ISO681LanguageCode isEqualToString:@"ar"]) {
        return @"ar-SA";
    } else if ([ISO681LanguageCode hasPrefix:@"cs"]) {
        return @"cs-CZ";
    } else if ([ISO681LanguageCode hasPrefix:@"da"]) {
        return @"da-DK";
    } else if ([ISO681LanguageCode hasPrefix:@"de"]) {
        return @"de-DE";
    } else if ([ISO681LanguageCode hasPrefix:@"el"]) {
        return @"el-GR";
    } else if ([ISO681LanguageCode hasPrefix:@"en"]) {
        return @"en-US"; // en-AU, en-GB, en-IE, en-ZA
    } else if ([ISO681LanguageCode hasPrefix:@"es"]) {
        return @"es-MX"; // es-MX
    } else if ([ISO681LanguageCode hasPrefix:@"fi"]) {
        return @"fi-FI";
    } else if ([ISO681LanguageCode hasPrefix:@"fr"]) {
        return @"fr-FR"; // fr-CA
    } else if ([ISO681LanguageCode hasPrefix:@"hi"]) {
        return @"hi-IN";
    } else if ([ISO681LanguageCode hasPrefix:@"hu"]) {
        return @"hu-HU";
    } else if ([ISO681LanguageCode hasPrefix:@"id"]) {
        return @"id-ID";
    } else if ([ISO681LanguageCode hasPrefix:@"it"]) {
        return @"it-IT";
    } else if ([ISO681LanguageCode hasPrefix:@"ja"]) {
        return @"ja-JP";
    } else if ([ISO681LanguageCode hasPrefix:@"ko"]) {
        return @"ko-KR";
    } else if ([ISO681LanguageCode hasPrefix:@"nl"]) {
        return @"nl-NL"; // nl-BE
    } else if ([ISO681LanguageCode hasPrefix:@"no"]) {
        return @"no-NO";
    } else if ([ISO681LanguageCode hasPrefix:@"pl"]) {
        return @"pl-PL";
    } else if ([ISO681LanguageCode hasPrefix:@"pt"]) {
        return @"pt-BR"; // pt-PT
    } else if ([ISO681LanguageCode hasPrefix:@"ro"]) {
        return @"ro-RO";
    } else if ([ISO681LanguageCode hasPrefix:@"ru"]) {
        return @"ru-RU";
    } else if ([ISO681LanguageCode hasPrefix:@"sk"]) {
        return @"sk-SK";
    } else if ([ISO681LanguageCode hasPrefix:@"sv"]) {
        return @"sv-SE";
    } else if ([ISO681LanguageCode hasPrefix:@"th"]) {
        return @"th-TH";
    } else if ([ISO681LanguageCode hasPrefix:@"tr"]) {
        return @"tr-TR";
    } else if ([ISO681LanguageCode hasPrefix:@"zh"]) {
        return @"zh-CN"; // zh-HK, zh-TW
    } else {
        return nil;
    }
}

static NSString * BCP47LanguageCodeForString(NSString *string) {
    NSString *ISO681LanguageCode = (__bridge NSString *)CFStringTokenizerCopyBestStringLanguage((__bridge CFStringRef)string, CFRangeMake(0, [string length]));
    return BCP47LanguageCodeFromISO681LanguageCode(ISO681LanguageCode);
}

#pragma mark - AVSpeechSynthesizerDelegate

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer
 didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithAttributedString:self.texto.attributedText];
    [text removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, [text length])];
    self.texto.attributedText = text;
    self.playButton=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(play:)];
    [self.playButton setTintColor:[UIColor whiteColor]];
    self.texto.textColor= [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = self.playButton;
    play=NO;
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
