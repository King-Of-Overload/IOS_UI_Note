//
//  CatalogTableViewCell.m
//  P63
//
//  Created by Alan Lu on 13/11/2016.
//  Copyright © 2016年 Zjut. All rights reserved.
//

#import "CatalogTableViewCell.h"

@implementation CatalogTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        CGRect viewFrame=CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height);
        self.catalogProductView=[[CatalogProductView alloc] initWithFrame:viewFrame];
        [self.contentView addSubview:self.catalogProductView];
    }
    return self;
}

-(void)setProduct:(Product *)theProduct{
    [self.catalogProductView setProduct:theProduct];
}

@end
