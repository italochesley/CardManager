//
//  CBLoginUIView.h
//  CardManager
//
//  Created by Italo Chesley on 8/23/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMLoginUIView.h"

@interface CMLoginUIView<UITextFieldDelegate>: UIView

- (NSString *) emailText;
- (NSString *) passwordText;
- (void) startAnimation;
- (void) stopAnimation;
@end
