//
//  ReglasTableViewCell.h
//  GolfRules
//
//  Created by Dacodes on 25/09/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReglasTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageCell;
@property (weak, nonatomic) IBOutlet UIView *backCell;
@property (weak, nonatomic) IBOutlet UILabel *textCell;
@property (weak, nonatomic) IBOutlet UIButton *videoImage;

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view;

@end
