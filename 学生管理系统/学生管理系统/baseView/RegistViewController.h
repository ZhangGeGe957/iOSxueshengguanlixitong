//
//  RegistViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import <UIKit/UIKit.h>

@protocol AccountDelegate <NSObject>

- (void)tranAccount:(NSString*)account andPassword:(NSString*)password;

@end

NS_ASSUME_NONNULL_BEGIN

@interface RegistViewController : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UIImageView *accountPhoto;
@property (nonatomic, strong) UIImageView *passwordPhoto;
@property (nonatomic, strong) UIImageView *againPhoto;
@property (nonatomic, strong) UITextField *accountText;
@property (nonatomic, strong) UITextField *passwordText;
@property (nonatomic, strong) UITextField *againText;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, weak) id<AccountDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
