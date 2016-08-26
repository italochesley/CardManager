//
//  CMCustomTextField.h
//  CardManager
//
//  Created by Italo Chesley on 8/23/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMCustomTextField;

@protocol UITextFieldLimitDelegate<UITextFieldDelegate>

@optional
-(void)textFieldLimit:(CMCustomTextField *)textFieldLimit didWentOverLimitWithDisallowedText:(NSString *)text inDisallowedRange:(NSRange)range;
-(void)textFieldLimit:(CMCustomTextField *)textFieldLimit didReachLimitWithLastEnteredText:(NSString *)text inRange:(NSRange)range;
@end

@interface CMCustomTextField : UITextField<UITextFieldDelegate> {
    long limit;
    UILabel *limitLabel;
}
@property (nonatomic, assign) id<UITextFieldLimitDelegate> delegate;

@property (readwrite, nonatomic) long limit;
@property (retain, nonatomic) UILabel *limitLabel;

@end
