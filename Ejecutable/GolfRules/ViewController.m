//
//  ViewController.m
//  GolfRules
//
//  Created by Dacodes on 31/08/15.
//  Copyright (c) 2015 Dacodes. All rights reserved.
//

#import "ViewController.h"
#import "SWRevealViewController.h"
#import "ReglasViewController.h"
#import "MenuCollectionViewCell.h"
#import "UIImage+deviceSpecificMedia.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    NSArray*opciones;
    NSArray*imagenes;
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;
@property (weak, nonatomic) IBOutlet UIImageView *backImage;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Reglas";
    self.backImage.image = [UIImage imageForDeviceWithName:@"fondogolf"];

    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];

    opciones=@[@"Bases y dropear",@"En la Mesa de Salida",@"En el recorrido (fairway, rough, etc.)",@"En la arena",@"En el agua",@"Fuera de límites y bola provisional",@"En el green",@"Bola movida por causa ajena",@"Bola en movimiento golpea..."];
    self.myCollectionView.dataSource=self;
    self.myCollectionView.delegate=self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - CollectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [opciones count];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    double w = (self.view.frame.size.width -5) / 3;
    if(self.view.frame.size.width >= 375) {
        w = (self.view.frame.size.width - 6) / 3;
    }
    return CGSizeMake(self.view.frame.size.width/2, self.view.frame.size.width/2);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    
    MenuCollectionViewCell *cell = (MenuCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.texto.text=[opciones objectAtIndex:indexPath.row];
    cell.texto.font=[UIFont fontWithName:@".SFUIText-Medium" size:13.0f];

    
    CALayer *imageLayer = cell.circle.layer;
    [imageLayer setBorderColor:[UIColor clearColor].CGColor];
    [cell.circle.layer setCornerRadius:((self.view.frame.size.width/2)-60)/2];
    [cell layoutIfNeeded];
    [cell setNeedsLayout];
    
    if (indexPath.row==0) {
        cell.icon.image=[UIImage imageNamed:@"pantallas golf-07 3"];
    }else if(indexPath.row==1){
        cell.icon.image=[UIImage imageNamed:@"en el lugar de salida.png"];
    }else if(indexPath.row==2){
        cell.icon.image=[UIImage imageNamed:@"pantallas golf-07 2"];
    }else if(indexPath.row==3){
        cell.icon.image=[UIImage imageNamed:@"en el bunker.png"];
    }else if(indexPath.row==4){
        cell.icon.image=[UIImage imageNamed:@"en el obstaculo"];
    }else if(indexPath.row==5){
        cell.icon.image=[UIImage imageNamed:@"Fuera de límites y bola provisional-04"];
    }else if(indexPath.row==6){
        cell.icon.image=[UIImage imageNamed:@"en el green"];
    }else if(indexPath.row==7){
        cell.icon.image=[UIImage imageNamed:@"Bola en reposo movida por-04"];
    }else if(indexPath.row==8){
        cell.icon.image=[UIImage imageNamed:@"bola en movimiento golpea-04"];
    }
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"Submenu" sender:self];
    });
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if ([segue.identifier isEqualToString:@"Submenu"]) {
         NSArray*indexes=[self.myCollectionView indexPathsForSelectedItems];
         NSIndexPath*indexPath=[indexes objectAtIndex:0];
         ReglasViewController*destinationController = segue.destinationViewController;
         destinationController.ruleTitle=[opciones objectAtIndex:indexPath.row];
         destinationController.index=indexPath.row;
     }
 }

@end
