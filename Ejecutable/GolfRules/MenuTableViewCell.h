//
//  MenuTableViewCell.h
//  GolfRules
//
//  Created by Dacodes on 28/09/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UIView *backImage;
@property (weak, nonatomic) IBOutlet UILabel *titulo;

@end
