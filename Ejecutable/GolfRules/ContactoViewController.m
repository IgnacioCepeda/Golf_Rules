//
//  ContactoViewController.m
//  GolfRules
//
//  Created by Dacodes on 08/10/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import "ContactoViewController.h"
#import "SWRevealViewController.h"

@interface ContactoViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *revealButtonItem;

@end

@implementation ContactoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Contacto";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@".SFUIText-Bold" size:17.0f],NSForegroundColorAttributeName : [UIColor whiteColor]}];

    [self SWRevealViewControllerInitialSetup];
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
 Aplicacoçon desarollada por la Asociación de Golf del Sureste A.C. para fines educativos únicamente.
 Cualquier comenatrio dirigirlo a: infantiles@golfsureste.org
 http://www.golfsureste.org*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
