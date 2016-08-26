//
//  ViewController.m
//  CardManager
//
//  Created by Italo Chesley on 8/22/16.
//  Copyright © 2016 Italo Chesley. All rights reserved.
//

#import "CMLoginViewController.h"
#import "CMLoginUIView.h"
#import "CMNetworkProvider.h"
#import "CMLoginManager.h"
#import "AFNetworking.h"

@interface CMLoginViewController ()
@property (readonly, nonatomic)CMLoginUIView *viewLogin;
@property (strong, nonatomic)CMLoginManager *managerLogin;
@end

@implementation CMLoginViewController

#pragma overrides
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Getter/Setter

- (CMLoginUIView *)viewLogin
{
    return (CMLoginUIView *)self.view;
}

- (CMLoginManager *)managerLogin
{
    if (_managerLogin) {
        return _managerLogin;
    }
    return [[CMLoginManager alloc]init];
}

#pragma Actions
- (IBAction)executeLogin:(UIButton *)sender {
    [self login];
}


#pragma Authentication

- (void)login
{
    //blocks
    void (^success)(BOOL *logged, NSString *errorMessage);
    success = ^(BOOL *logged, NSString *errorMessage)
    {
        if (logged) {
            //redirecionar o usuário para a página principal
        }else
        {
            [self showErrorMessage:@"Erro" message:errorMessage];
        }
        
    };
    
    void (^failure)(id responseObject);
    failure = ^(NSString *error)
    {
        [self showErrorMessage:@"Erro" message:error];
    };
    
    NSString *emailText = [self.viewLogin emailText];
    NSString *passwordText = [self.viewLogin passwordText];
    
    BOOL validEmail = emailText.length != 0 && [self validEmail:emailText];
    BOOL validPassaword = passwordText.length != 0;
    
    if (!validEmail || !validPassaword) {
        [self showErrorMessage:@"Verifique" message:@"Campos inválidos, verifique e tente novamente!"];
        
    }else
    {
        if (![self isNetworkAvailable]) {
            [self showErrorMessage:@"Verifique" message:@"Não há conexão com a internet. Por favor tente mais tarde!"];
        }else
        {
            [self.viewLogin startAnimation];
            [CMLoginManager postLogin:emailText withPassword:passwordText onSuccess:success onFailure:failure];
        }
       
        //colocar load pra rodar
        //rodar em paralelo a chamada ao serviço de validacao
    }
    
}

- (bool)isNetworkAvailable
{
    return [CMNetworkProvider CheckNetworkStatus];
}

- (void) showErrorMessage:(NSString *)title message:(NSString *)message
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                         }];
    
    [alert addAction:ok];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (BOOL) validEmail:(NSString*) emailString {
    
    if([emailString length]==0){
        return NO;
    }
    
    NSString *regExPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    
    NSRegularExpression *regEx = [[NSRegularExpression alloc] initWithPattern:regExPattern options:NSRegularExpressionCaseInsensitive error:nil];
    NSUInteger regExMatches = [regEx numberOfMatchesInString:emailString options:0 range:NSMakeRange(0, [emailString length])];
    
    NSLog(@"%i", regExMatches);
    if (regExMatches == 0) {
        return NO;
    } else {
        return YES;
    }
}

@end
