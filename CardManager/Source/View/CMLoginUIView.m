//
//  CBLoginUIView.m
//  CardManager
//
//  Created by Italo Chesley on 8/23/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import "CMLoginUIView.h"
#import "CMCustomTextField.h"

@interface CMLoginUIView()

@property (weak, nonatomic) IBOutlet CMCustomTextField *emailTextField;
@property (weak, nonatomic) IBOutlet CMCustomTextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIImageView *loadingImageView;
@property (weak, nonatomic) IBOutlet UIButton *entrarButton;
@property (weak, nonatomic) IBOutlet UIButton *solicitarCadastroButton;

@end

@implementation CMLoginUIView
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (NSString *)emailText
{
    NSString *emailText = _emailTextField.text;
    return emailText;
}

-(NSString *) passwordText
{
    NSString *passwordText = _passwordTextField.text;
    return passwordText;
}

- (void)drawRect:(CGRect)rect {
    [_emailTextField setLimit:100];
    [_passwordTextField setLimit:6];
    
    }

- (void) setImageAnimation{
    self.loadingImageView.animationImages = [NSArray arrayWithObjects:
                                             [UIImage imageNamed:@"imagem-0.png"],
                                             [UIImage imageNamed:@"imagem-1.png"],
                                             [UIImage imageNamed:@"imagem-2.png"],
                                             [UIImage imageNamed:@"imagem-3.png"],
                                             [UIImage imageNamed:@"imagem-4.png"],
                                             [UIImage imageNamed:@"imagem-5.png"],
                                             [UIImage imageNamed:@"imagem-6.png"],
                                             [UIImage imageNamed:@"imagem-7.png"],
                                             [UIImage imageNamed:@"imagem-8.png"],
                                             [UIImage imageNamed:@"imagem-9.png"],
                                             [UIImage imageNamed:@"imagem-10.png"],
                                             [UIImage imageNamed:@"imagem-11.png"],
                                             [UIImage imageNamed:@"imagem-12.png"],
                                             [UIImage imageNamed:@"imagem-13.png"],
                                             [UIImage imageNamed:@"imagem-14.png"],
                                             [UIImage imageNamed:@"imagem-15.png"],
                                             [UIImage imageNamed:@"imagem-16.png"],
                                             [UIImage imageNamed:@"imagem-17.png"],
                                             [UIImage imageNamed:@"imagem-18.png"],
                                             [UIImage imageNamed:@"imagem-19.png"], nil];
    
    self.loadingImageView.animationDuration = 1;
    
    [self.loadingImageView startAnimating];
}


- (void) startAnimation {
    self.loadingImageView.hidden = NO;
    [self setImageAnimation];
}

- (void) stopAnimation
{
    self.loadingImageView.hidden = YES;
}

@end
