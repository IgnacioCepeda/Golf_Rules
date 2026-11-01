//
//  SWMenuViewController.h
//  Golf Rules
//
//  Created by Pablo on 6/22/15.
//  Copyright (c) 2015 DaCodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SWMenuViewControllerDelegate <NSObject>

-(void)cerrarSesionButtonPressed;

@end

@interface SWMenuViewController : UIViewController

@property (strong, nonatomic) id <SWMenuViewControllerDelegate> delegate;


@end
