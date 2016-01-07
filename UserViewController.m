//
//  UserViewController.m
//  BearNote
//
//  Created by Zhipeng Li on 15/11/22.
//  Copyright © 2015年 Shirokuma. All rights reserved.
//

#import "UserViewController.h"

@interface UserViewController ()

@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIImageView *background;
@property (strong, nonatomic) IBOutlet UIView *paddingView;
@property (strong, nonatomic) IBOutlet UIView *paddingView2;
@property (strong, nonatomic) IBOutlet UIButton *divideLine;

@property (strong, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) IBOutlet UIButton *signupButton;
@property (strong, nonatomic) IBOutlet UIButton *skipButton;


- (IBAction)signupButtonTouched:(id)sender;
- (IBAction)loginButtonTouched:(id)sender;
- (IBAction)skipButtonTouched:(id)sender;

@end

@implementation UserViewController


- (void)keyboardWillShow:(NSNotification *)noti

{
    float height = 300.0;
    CGRect frame = self.view.frame;
    frame.size = CGSizeMake(frame.size.width, frame.size.height - height);
    [UIView beginAnimations:@"Curl"context:nil];
    [UIView setAnimationDuration:0.30];
    [UIView setAnimationDelegate:self];
    [self.view setFrame:frame];
    [UIView commitAnimations];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField

{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
    [UIView commitAnimations];
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField

{
    CGRect frame = textField.frame;
    int offset = frame.origin.y + 32 - (self.view.frame.size.height - 300.0);
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;

    if(offset > 0)
    {
        CGRect rect = CGRectMake(0.0f, -offset,width,height);
        self.view.frame = rect;
    }
    [UIView commitAnimations];              

}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.view endEditing:YES];
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
    NSTimeInterval animationDuration = 0.30f;
    [UIView beginAnimations:@"ResizeForKeyboard" context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect rect = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    self.view.frame = rect;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];

    self.userName.delegate=self;
    self.password.delegate=self;
    
    UIColor *textFieldColor = [UIColor colorWithRed:238/255.0 green:238/255.0 blue:238/255.0 alpha:1];
   
   
    [_background setBackgroundColor:textFieldColor];
    [[_background layer] setCornerRadius:5];
    [[_background layer] setMasksToBounds:YES];
    [self.view addSubview:_background];
    
    [_paddingView setBackgroundColor:textFieldColor];
    [_paddingView2 setBackgroundColor:textFieldColor];
    
    _userName.backgroundColor = textFieldColor;
    _userName.placeholder = [NSString stringWithFormat:@"  Username"];
    _userName.layer.cornerRadius = 5.0;
    _userName.leftView = _paddingView;
    _userName.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_userName];

   
    _password.backgroundColor = textFieldColor;
    _password.placeholder = [NSString stringWithFormat:@"  Password"];
    _password.layer.cornerRadius=5.0;
    _password.leftView = _paddingView2;
    _password.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:_password];
    
    
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius=5.0;
    
    [self.view addSubview:_divideLine];

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signupButtonTouched:(id)sender {
}

- (IBAction)loginButtonTouched:(id)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result" message:@"Login Success" preferredStyle:  UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

    }]];

    [self presentViewController:alert animated:true completion:nil];
}

- (IBAction)skipButtonTouched:(id)sender {
    
}
@end
