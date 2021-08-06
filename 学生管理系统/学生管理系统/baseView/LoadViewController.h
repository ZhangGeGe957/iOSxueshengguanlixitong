//
//  LoadViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoadViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIImageView *accountPhoto;
@property (nonatomic, strong) UIImageView *passwordPhoto;
@property (nonatomic, strong) UITextField *accountText;
@property (nonatomic, strong) UITextField *passwordText;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *resignButton;
@property (nonatomic, copy) NSString *accountString;
@property (nonatomic, copy) NSString *passwordString;

- (void)login;

@end

NS_ASSUME_NONNULL_END
