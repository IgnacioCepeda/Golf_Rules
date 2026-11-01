//
//  FirstViewController.m
//  GolfRules
//
//  Created by Dacodes on 21/09/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import "FirstViewController.h"
#import "SWRevealViewController.h"
#import "UIImage+deviceSpecificMedia.h"

@interface FirstViewController (){
    BOOL firstTime;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (strong, nonatomic) UIButton *matchPlay;
@property (strong, nonatomic) UIButton *alivio;
@property (strong, nonatomic) UIButton *etiqueta;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Inicio";
    
    self.backImage.image = [UIImage imageForDeviceWithName:@"fondogolf"];
    
    UIButton*banner=[UIButton buttonWithType:UIButtonTypeSystem];
    banner.frame=CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height-50, self.view.frame.size.width/3, 50);
    [banner setImage:[UIImage imageNamed:@"logo golf-06"] forState:UIControlStateNormal];
    [banner setTintColor:[UIColor whiteColor]];
    banner.imageView.contentMode=UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication].keyWindow addSubview:banner];
    
    UIButton*banner2=[UIButton buttonWithType:UIButtonTypeSystem];
    banner2.frame=CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width/3, 50);
    [banner2 setImage:[UIImage imageNamed:@"logoAsercom"] forState:UIControlStateNormal];
    [banner2 setTintColor:[UIColor whiteColor]];
    banner2.imageView.contentMode=UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication].keyWindow addSubview:banner2];
    
    UIButton*banner3=[UIButton buttonWithType:UIButtonTypeSystem];
    banner3.frame=CGRectMake((self.view.frame.size.width*2)/3, self.view.frame.size.height-50, self.view.frame.size.width/3, 50);
    [banner3 setImage:[UIImage imageNamed:@"logoDacodes"] forState:UIControlStateNormal];
    [banner3 setTintColor:[UIColor whiteColor]];
    banner3.imageView.contentMode=UIViewContentModeScaleAspectFit;
    [[UIApplication sharedApplication].keyWindow addSubview:banner3];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@".SFUIText-Bold" size:17.0f],NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    [self SWRevealViewControllerInitialSetup];
    firstTime=YES;
}

-(void)viewDidLayoutSubviews{
    if (firstTime) {
        firstTime=NO;
        CALayer *imageLayer = self.view1.layer;
        [imageLayer setBorderColor:[UIColor clearColor].CGColor];
        [self.view1.layer setCornerRadius:self.view1.bounds.size.width/2.0];
        CALayer *imageLayer2 = self.view2.layer;
        [imageLayer2 setBorderColor:[UIColor clearColor].CGColor];
        [self.view2.layer setCornerRadius:self.view2.frame.size.width/2.0];
        CALayer *imageLayer3 = self.view3.layer;
        [imageLayer3 setBorderColor:[UIColor clearColor].CGColor];
        [self.view3.layer setCornerRadius:self.view3.frame.size.width/2.0];
        
        self.matchPlay=[UIButton buttonWithType:UIButtonTypeSystem];
        self.matchPlay.frame=CGRectMake(self.view1.frame.origin.x, self.view1.frame.origin.y+10, self.view1.frame.size.width, self.view1.frame.size.width*.65);
        self.matchPlay.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self.matchPlay setImage:[UIImage imageNamed:@"strokeplay.png"] forState:UIControlStateNormal];
        [self.matchPlay setTintColor:[UIColor whiteColor]];
        [self.matchPlay addTarget:self action:@selector(goRules) forControlEvents:UIControlEventTouchUpInside];
        self.matchPlay.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.view addSubview:self.matchPlay];
        
        UILabel*label1=[[UILabel alloc] initWithFrame:CGRectMake(self.matchPlay.frame.origin.x, self.matchPlay.frame.origin.y+self.matchPlay.frame.size.height-5, self.matchPlay.frame.size.width, self.view1.frame.size.height-self.matchPlay.frame.size.height)];
        label1.text=@"Reglas";
        label1.font=self.view.frame.size.height <= 568.0 ? [UIFont fontWithName:@".SFUIText-Medium" size:12.0f] : [UIFont fontWithName:@".SFUIText-Medium" size:14.0f];
        label1.textAlignment=NSTextAlignmentCenter;
        label1.textColor=[UIColor whiteColor];
        [self.view addSubview:label1];
        
        self.alivio=[UIButton buttonWithType:UIButtonTypeSystem];
        self.alivio.frame=CGRectMake(self.view2.frame.origin.x, self.view2.frame.origin.y+13, self.view2.frame.size.width, self.view2.frame.size.width*.57);
        [self.alivio setImage:[UIImage imageNamed:@"diccionario.png"] forState:UIControlStateNormal];
        self.alivio.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.alivio setTintColor:[UIColor whiteColor]];
        [self.alivio addTarget:self action:@selector(goDefiniciones) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.alivio];
        
        UILabel*label2=[[UILabel alloc] initWithFrame:CGRectMake(self.alivio.frame.origin.x, self.alivio.frame.origin.y+self.alivio.frame.size.height, self.alivio.frame.size.width, self.view2.frame.size.height-self.alivio.frame.size.height-20)];
        label2.text=@"Definiciones";
        label2.font=self.view.frame.size.height <= 568.0 ? [UIFont fontWithName:@".SFUIText-Medium" size:12.0f] : [UIFont fontWithName:@".SFUIText-Medium" size:14.0f];
        label2.textAlignment=NSTextAlignmentCenter;
        label2.textColor=[UIColor whiteColor];
        [self.view addSubview:label2];
        
        self.etiqueta=[UIButton buttonWithType:UIButtonTypeSystem];
        self.etiqueta.frame=CGRectMake(self.view3.frame.origin.x, self.view3.frame.origin.y+20, self.view3.frame.size.width, self.view1.frame.size.width*.6);
        [self.etiqueta setImage:[UIImage imageNamed:@"etiqueta.png"] forState:UIControlStateNormal];
        self.etiqueta.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.etiqueta setTintColor:[UIColor whiteColor]];
        [self.etiqueta addTarget:self action:@selector(goEtiqueta) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.etiqueta];
        
        UILabel*label3=[[UILabel alloc] initWithFrame:CGRectMake(self.etiqueta.frame.origin.x, self.etiqueta.frame.origin.y+self.etiqueta.frame.size.height-15, self.etiqueta.frame.size.width, self.view3.frame.size.height-self.etiqueta.frame.size.height)];
        label3.text=@"Etiqueta";
        label3.font=self.view.frame.size.height <= 568.0 ? [UIFont fontWithName:@".SFUIText-Medium" size:12.0f] : [UIFont fontWithName:@".SFUIText-Medium" size:14.0f];
        label3.textAlignment=NSTextAlignmentCenter;
        label3.textColor=[UIColor whiteColor];
        [self.view addSubview:label3];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Segues

-(void)goRules{
    [self performSegueWithIdentifier:@"reglas" sender:self];
}

-(void)goDefiniciones{
    [self performSegueWithIdentifier:@"definiciones" sender:self];
}

-(void)goEtiqueta{
    [self performSegueWithIdentifier:@"etiqueta" sender:self];
}

#pragma mark - SWRevealVC

- (void)SWRevealViewControllerInitialSetup
{
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.revealButtonItem setTarget:self];
        [self.revealButtonItem setAction:@selector(revealMenu)];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
        revealViewController.toggleAnimationType = SWRevealToggleAnimationTypeSpring;
    }
}

-(void)revealMenu {
    self.revealButtonItem.target = self.revealViewController;
    [self.revealViewController revealToggleAnimated:YES];
    self.revealButtonItem.target = self;
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
