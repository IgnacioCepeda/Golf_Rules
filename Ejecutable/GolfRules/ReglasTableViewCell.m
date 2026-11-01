//
//  ReglasTableViewCell.m
//  GolfRules
//
//  Created by Dacodes on 25/09/15.
//  Copyright © 2015 Dacodes. All rights reserved.
//

#import "ReglasTableViewCell.h"

@implementation ReglasTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellOnTableView:(UITableView *)tableView didScrollOnView:(UIView *)view{
    CGRect rectInSuperview = [tableView convertRect:self.frame toView:view];
    
    float distanceFromCenter = CGRectGetHeight(view.frame)/2 - CGRectGetMinY(rectInSuperview);
    float difference = CGRectGetHeight(self.imageCell.frame) - CGRectGetHeight(self.frame);
    float move = (distanceFromCenter / CGRectGetHeight(view.frame)) * difference;
    
    CGRect imageRect = self.imageCell.frame;
    imageRect.origin.y = -(difference/2)+move;
    self.imageCell.frame = imageRect;
}

@end
