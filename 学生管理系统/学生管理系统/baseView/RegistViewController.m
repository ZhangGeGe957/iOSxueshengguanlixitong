//
//  RegistViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "RegistViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface RegistViewController ()

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"resigin.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    _backButton.frame = CGRectMake(30, 70, 32, 32);
    [self.view addSubview:_backButton];
    
    _accountText = [[UITextField alloc] init];
    _accountText.frame = CGRectMake(100, 350, 250, 50);
    _accountText.keyboardType = UIKeyboardTypeDefault;
    _accountText.borderStyle = UITextBorderStyleRoundedRect;
    _accountText.delegate = self;
    _accountText.placeholder = @"请输入您要注册的账号";
    [self.view addSubview:_accountText];
    
    _passwordText = [[UITextField alloc] init];
    _passwordText.frame = CGRectMake(100, 420, 250, 50);
    _passwordText.keyboardType = UIKeyboardTypeDefault;
    _passwordText.borderStyle = UITextBorderStyleRoundedRect;
    _passwordText.delegate = self;
    _passwordText.secureTextEntry = YES;
    _passwordText.placeholder = @"请输入密码";
    [self.view addSubview:_passwordText];
    
    _againText = [[UITextField alloc] init];
    _againText.frame = CGRectMake(100, 490, 250, 50);
    _againText.keyboardType = UIKeyboardTypeDefault;
    _againText.borderStyle = UITextBorderStyleRoundedRect;
    _againText.delegate = self;
    _againText.placeholder = @"确认密码";
    _againText.secureTextEntry = YES;
    [self.view addSubview:_againText];
    
    _accountPhoto = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"zhanghao.png"]];
    _accountPhoto.frame = CGRectMake(50, 360, 32, 32);
    [_backImageView addSubview:_accountPhoto];
    
    _passwordPhoto = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mima.png"]];
    _passwordPhoto.frame = CGRectMake(50, 430, 32, 32);
    [_backImageView addSubview:_passwordPhoto];
    
    _againPhoto = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"confirmBlue.png"]];
    _againPhoto.frame = CGRectMake(50, 500, 32, 32);
    [_backImageView addSubview:_againPhoto];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sureButton setTitle:@"确认注册" forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
    _sureButton.frame = CGRectMake(180, 560, 100, 40);
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    [_sureButton.layer setBorderWidth:2];//设置边界的宽度
    [_sureButton.layer setBorderColor:color];//设置边界的颜色
    _sureButton.titleLabel.tintColor = [UIColor whiteColor];
    _sureButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_sureButton.layer setMasksToBounds:YES];
    [_sureButton.layer setCornerRadius:5.0];
    [self.view addSubview:_sureButton];
}

- (void)sure:(UIButton*)button {
    if ([_passwordText.text isEqualToString:_againText.text] && ![_accountText.text isEqualToString:@""] && ![_passwordText.text isEqualToString:@""]) {
        [_delegate tranAccount:_accountText.text andPassword:_passwordText.text];
        UIAlertController *tips = [UIAlertController alertControllerWithTitle:@"注册成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [tips addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:tips animated:YES completion:nil];
    } else {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"输入有误请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:warning animated:YES completion:nil];
    }
}

- (void)back:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_accountText resignFirstResponder];
    [_passwordText resignFirstResponder];
    [_againText resignFirstResponder];
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
