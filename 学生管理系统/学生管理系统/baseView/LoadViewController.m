//
//  LoadViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "LoadViewController.h"
#import "RegistViewController.h"
#import "ShowViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface LoadViewController ()<AccountDelegate>

@end

@implementation LoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _accountString = [[NSString alloc] init];
    _passwordString = [[NSString alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"load.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _accountPhoto = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghao.png"]];
    _accountPhoto.frame = CGRectMake(50, 310, 32, 32);
    [_backImageView addSubview:_accountPhoto];
    
    _passwordPhoto = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mima.png"]];
    _passwordPhoto.frame = CGRectMake(50, 380, 32, 32);
    [_backImageView addSubview:_passwordPhoto];
    
    _accountText = [[UITextField alloc] init];
    _passwordText = [[UITextField alloc] init];
    _accountText.delegate = self;
    _passwordText.delegate = self;
    _accountText.frame = CGRectMake(100, 304, 250, 50);
    _passwordText.frame = CGRectMake(100, 374, 250, 50);
    _accountText.keyboardType = UIKeyboardTypeDefault;
    _passwordText.keyboardType = UIKeyboardTypeDefault;
    _accountText.borderStyle = UITextBorderStyleRoundedRect;
    _passwordText.borderStyle = UITextBorderStyleRoundedRect;
    _accountText.placeholder = @"请输入账号";
    _passwordText.placeholder = @"请输入密码";
    _passwordText.secureTextEntry = YES;
    [self.view addSubview:_accountText];
    [self.view addSubview:_passwordText];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _resignButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    [_resignButton setTitle:@"注册" forState:UIControlStateNormal];
    _loginButton.titleLabel.tintColor = [UIColor whiteColor];
    _resignButton.titleLabel.tintColor = [UIColor whiteColor];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:20];
    _resignButton.titleLabel.font = [UIFont systemFontOfSize:20];
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    [_loginButton.layer setBorderWidth:2];//设置边界的宽度
    [_loginButton.layer setBorderColor:color];//设置边界的颜色
    [_resignButton.layer setBorderWidth:2];//设置边界的宽度
    [_resignButton.layer setBorderColor:color];//设置边界的颜色
    [_loginButton.layer setMasksToBounds:YES];
    [_loginButton.layer setCornerRadius:5.0];
    [_resignButton.layer setMasksToBounds:YES];
    [_resignButton.layer setCornerRadius:5.0];
    _loginButton.frame = CGRectMake(100, 450, 80, 40);
    _resignButton.frame = CGRectMake(220, 450, 80, 40);
    [_loginButton addTarget:self action:@selector(pressLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    [_resignButton addTarget:self action:@selector(pressResignButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    [self.view addSubview:_resignButton];
}

- (void)pressLoginButton:(UIButton*)button {
    [self login];
//    if ([_accountText.text isEqualToString:@""] || [_passwordText.text isEqualToString:@""]) {
//        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的账号还未注册，请注册后重新登录" preferredStyle:UIAlertControllerStyleAlert];
//        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
//        [self presentViewController:warning animated:YES completion:nil];
//    } else if ([_accountText.text isEqualToString:_accountString] && [_passwordText.text isEqualToString:_passwordString]) {
//        [self login];
//    } else {
//        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的账号或密码有误，请重新输入" preferredStyle:UIAlertControllerStyleAlert];
//        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
//        [self presentViewController:warning animated:YES completion:nil];
//    }
}

- (void)login {
    ShowViewController *show = [[ShowViewController alloc] init];
    show.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:show animated:YES completion:nil];
}

- (void)pressResignButton:(UIButton*)button {
    RegistViewController *resign = [[RegistViewController alloc] init];
    resign.modalPresentationStyle = UIModalPresentationFullScreen;
    resign.delegate = self;
    [self presentViewController:resign animated:YES completion:nil];
}

- (void)tranAccount:(NSString *)account andPassword:(NSString *)password {
    _accountString = [account copy];
    _passwordString = [password copy];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accountText resignFirstResponder];
    [_passwordText resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, -50, width, heigth);
    }];
    [UIView setAnimationsEnabled:YES];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:0.5 animations:^{
        self.view.frame = CGRectMake(0, 0, width, heigth);
    }];
    [UIView setAnimationsEnabled:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
