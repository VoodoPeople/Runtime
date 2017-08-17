//
//  InputTableViewCell.m
//  PageParser
//
//  Created by Ozzy on 27.07.17.
//  Copyright © 2017 Empty. All rights reserved.
//

#import "InputTableViewCell.h"

@implementation InputTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
- (IBAction)keyDidChanged:(id)sender {
    
}

- (IBAction)valueDidChanged:(id)sender {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void) setupWithPropertyItem:(NSDictionary*) item{
    
    self.keyTextField.text = item.allKeys.firstObject;
    self.valueTextField.text = item.allValues.firstObject;
    
}

@end
