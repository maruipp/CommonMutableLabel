//
//  CommonMutableLabel.m
//  Mis
//
//  Created by 瑞鹏 马 on 12-2-29.
//  Copyright (c) 2012年 BJTU. All rights reserved.
//

#import "CommonMutableLabel.h"

@implementation CommonMutableLabel
- (id) initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (id)init
{
    if (self = [super init]) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setup
{
    self.lineBreakMode = NSLineBreakByWordWrapping;
    self.numberOfLines = 0;
}

//调用此函数前要设置label字体
-(void) setText:(NSString *)text
{
    text = [NSString stringWithFormat:@"%@",text];
    [super setText:text];
    if ([text isEqualToString:@""] ||  nil == text) {
        return;
    }
    //根据设置的文字的高度调整文字所在label的高度
    CGSize maximumLabelSize = self.frame.size;
    NSLog(@"%@,%@",text,NSStringFromCGSize(maximumLabelSize));
    maximumLabelSize.height =   9480;
    CGSize expectedLabelSize = CGSizeZero;
    CGPoint pos = self.frame.origin;
    expectedLabelSize = [text sizeWithFont:self.font 
                         constrainedToSize:maximumLabelSize 
                             lineBreakMode:NSLineBreakByWordWrapping];
    expectedLabelSize = [text boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:nil context:nil].size;

    self.frame     =   CGRectMake(pos.x, pos.y, self.frame.size.width, expectedLabelSize.height + 1);

    [self sizeToFit];
}
@end
