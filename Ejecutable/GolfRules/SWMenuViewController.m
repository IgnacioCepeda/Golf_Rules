//
//  SWMenuViewController.m
//  Golf Rules
//
//  Created by Pablo on 6/22/15.
//  Copyright (c) 2015 DaCodes. All rights reserved.
//

#import "SWMenuViewController.h"
#import "SWRevealViewController.h"
#import "UIImage+deviceSpecificMedia.h"
#import "MenuTableViewCell.h"

@interface SWMenuViewController () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *opciones;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageViewFondo;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthImage;

@end

@implementation SWMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    opciones = @[@"Inicio",@"Contacto"];
    self.imageViewFondo.image = [UIImage imageForDeviceWithName:@"fondogolf"];
    self.widthImage.constant = self.view.frame.size.width;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource & Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [opciones count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    CALayer *imageLayer = cell.backImage.layer;
    [imageLayer setBorderColor:[UIColor clearColor].CGColor];
    [cell.backImage.layer setCornerRadius:30/2];
    
    cell.titulo.text = opciones[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.titulo.font=[UIFont fontWithName:@".SFUIText-Medium" size:16.0f];
    cell.titulo.textColor = [UIColor whiteColor];
    if (indexPath.row==0) {
        cell.logo.image = [UIImage imageNamed:@"inicio-04.png"];
    }else{
        cell.logo.image = [UIImage imageNamed:@"acerca de -04.png"];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        switch(indexPath.row) {
            case 0:
                [self performSegueWithIdentifier:@"Inicio" sender:self];
            break;
            case 1:
                [self performSegueWithIdentifier:@"Contacto" sender:self];
            break;
            default:
            break;
        }
    }
    
}

@end
