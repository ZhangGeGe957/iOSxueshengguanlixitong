//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import <UIKit/UIKit.h>

@protocol DeleteArray <NSObject>

- (void)deleteInformation:(NSInteger)indexNumber;

@end

NS_ASSUME_NONNULL_BEGIN

@interface DeleteViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *backImageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, weak) id<DeleteArray> delegate;
@property (nonatomic, strong) NSMutableArray *nameArray;
@property (nonatomic, strong) NSMutableArray *classArray;
@property (nonatomic, strong) NSMutableArray *gradeArray;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UIButton *sureButton;
@property (nonatomic, strong) UITextField *nameText;
@property (nonatomic, strong) UITextField *classText;
@property (nonatomic, assign) NSInteger indexNumber;
@property (nonatomic, strong) NSMutableArray *similarArray;
@property (nonatomic, assign) NSInteger index;

@end

NS_ASSUME_NONNULL_END
