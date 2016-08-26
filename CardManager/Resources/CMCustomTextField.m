//
//  CMCustomTextField.m
//  CardManager
//
//  Created by Italo Chesley on 8/23/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//


#import "CMCustomTextField.h"

@implementation CMCustomTextField
@synthesize limit,limitLabel,delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        limit=10;// -- Default limit
        [super setDelegate:(id<UITextFieldLimitDelegate,UITextFieldDelegate>)self];
        UIColor *color = [UIColor whiteColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color}];
        self.font = [UIFont fontWithName:@"SanFranciscoText-Medium.otf" size:20.f];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)inCoder {
    self = [super initWithCoder:inCoder];
    if (self) {
        limit=10;// -- Default limit
        [super setDelegate:(id<UITextFieldLimitDelegate,UITextFieldDelegate>)self];
        UIColor *color = [UIColor whiteColor];
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: color}];
    }
    return self;
}

-(long)limit {
    return limit;
}



-(void)setLimit:(long)theLimit {
    limit=theLimit;
    [self textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
}

-(void)initializeLimitLabelWithFont:(UIFont *)font andTextColor:(UIColor *)textColor {
    limitLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-([[NSNumber numberWithFloat:font.pointSize] doubleValue]*(2.285714)), 8, 30, self.bounds.size.height)];
    
    [limitLabel setTextColor:textColor];
    [limitLabel setFont:font];
    
    [limitLabel setBackgroundColor:[UIColor clearColor]];
    [limitLabel setTextAlignment:NSTextAlignmentLeft];
    [limitLabel setNumberOfLines:1];
    [limitLabel setText:@""];
    [self setRightView:limitLabel];
    [self setRightViewMode:UITextFieldViewModeWhileEditing];
    [self textField:self shouldChangeCharactersInRange:NSMakeRange(0, 0) replacementString:@""];
    
    limitLabel.hidden=YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    long MAXLENGTH=limit;
    NSString *newText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(newText.length==MAXLENGTH) {//Did reach limit
        if([self.delegate respondsToSelector:@selector(textFieldLimit:didReachLimitWithLastEnteredText:inRange:)]) {
            [self.delegate textFieldLimit:self didReachLimitWithLastEnteredText:string inRange:NSMakeRange(range.location, string.length)];
        }
    }
    if(newText.length>MAXLENGTH) {
        if([self.delegate respondsToSelector:@selector(textFieldLimit:didWentOverLimitWithDisallowedText:inDisallowedRange:)]) {
            [self.delegate textFieldLimit:self didWentOverLimitWithDisallowedText:string inDisallowedRange:NSMakeRange(range.location, string.length)];
        }
        if([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
            return [self.delegate textField:self shouldChangeCharactersInRange:range replacementString:string];
        }
        return NO;
    }
    [limitLabel setText:[NSString stringWithFormat:@"%lu",MAXLENGTH-newText.length]];
    
    if([self.delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [self.delegate textField:self shouldChangeCharactersInRange:range replacementString:string];
    }
    
    return YES;
}


//UITextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if([self.delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [self.delegate textFieldShouldBeginEditing:self];
    }
    return YES;
}
-(BOOL)textFieldShouldClear:(UITextField *)textField {
    if([self.delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [self.delegate textFieldShouldClear:self];
    }
    return YES;
}
-(BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    if([self.delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [self.delegate textFieldShouldEndEditing:self];
    }
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if([self.delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [self.delegate textFieldShouldReturn:self];
    }
    return YES;
}

@end
