//
//  DeleteViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "DeleteViewController.h"
#import "NewTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _similarArray = [[NSMutableArray alloc] init];
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sureButton setTitle:@"删除" forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
    _sureButton.frame = CGRectMake(100, 700, 60, 40);
    [_sureButton.layer setBorderWidth:2];
    [_sureButton.layer setBorderColor:color];
    _sureButton.titleLabel.tintColor = [UIColor whiteColor];
    _sureButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_sureButton.layer setMasksToBounds:YES];
    [_sureButton.layer setCornerRadius:5];
    [self.view addSubview:_sureButton];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    _backButton.frame = CGRectMake(250, 700, 60, 40);
    [_backButton.layer setBorderWidth:2];
    [_backButton.layer setBorderColor:color];
    _backButton.titleLabel.tintColor = [UIColor whiteColor];
    _backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_backButton.layer setMasksToBounds:YES];
    [_backButton.layer setCornerRadius:5.0];
    [self.view addSubview:_backButton];
    
    UIImageView *nameView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xingming.png"]];
    nameView.frame = CGRectMake(50, 540, 32, 32);
    [_backImageView addSubview:nameView];
    
    UIImageView *classView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji.png"]];
    classView.frame = CGRectMake(50, 610, 32, 32);
    [_backImageView addSubview:classView];
    
    _nameText = [[UITextField alloc] init];
    _nameText.frame = CGRectMake(100, 530, 250, 50);
    _nameText.keyboardType = UIKeyboardTypeDefault;
    _nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText.delegate = self;
    _nameText.placeholder = @"请输入要删除的学生姓名";
    [self.view addSubview:_nameText];
    
    _classText = [[UITextField alloc] init];
    _classText.frame = CGRectMake(100, 600, 250, 50);
    _classText.keyboardType = UIKeyboardTypeDefault;
    _classText.borderStyle = UITextBorderStyleRoundedRect;
    _classText.delegate = self;
    _classText.placeholder = @"请输入要删除的学生班级";
    [self.view addSubview:_classText];
    
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 150, 50)];
    name.font = [UIFont systemFontOfSize:24];
    name.textAlignment = NSTextAlignmentCenter;
    name.textColor = [UIColor whiteColor];
    name.text = @"姓名";
    [_backImageView addSubview:name];
    
    UILabel *aclass = [[UILabel alloc] initWithFrame:CGRectMake(150, 45, 150, 50)];
    aclass.font = [UIFont systemFontOfSize:24];
    aclass.textAlignment = NSTextAlignmentCenter;
    aclass.textColor = [UIColor whiteColor];
    aclass.text = @"班级";
    [_backImageView addSubview:aclass];
    
    UILabel *grade = [[UILabel alloc] initWithFrame:CGRectMake(300, 45, 150, 50)];
    grade.font = [UIFont systemFontOfSize:24];
    grade.textAlignment = NSTextAlignmentCenter;
    grade.textColor = [UIColor whiteColor];
    grade.text = @"成绩";
    [_backImageView addSubview:grade];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, width, 400) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[NewTableViewCell class] forCellReuseIdentifier:@"show"];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"show" forIndexPath:indexPath];
    cell.nameLabel.text = _nameArray[indexPath.row];
    cell.classLabel.text = _classArray[indexPath.row];
    cell.gradeLabel.text = _gradeArray[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.userInteractionEnabled = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _nameArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)sure:(UIButton*)button {
    if ([_nameText.text isEqualToString:@""] || [_classText.text isEqualToString:@""]) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"请输入您要删除的学生的姓名和班级" preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:warning animated:YES completion:nil];
        return;
    }
    
    for (int i = 0; i < _nameArray.count; i++) {
        if ([_nameArray[i] isEqualToString:_nameText.text]) {
            NSString *str = [[NSString alloc] initWithFormat:@"%d", i];
            [_similarArray addObject:str];
        }
    }
    
    for (int i = 0; i < _similarArray.count; i++) {
        _indexNumber = [_similarArray[i] intValue];
        if ([_classArray[_indexNumber] isEqualToString:_classText.text]) {
            UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"提示" message:@"您确定要删除该学生吗" preferredStyle:UIAlertControllerStyleAlert];
            [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                //KVO
                self.index = _indexNumber;
                //协议传值
//                [self->_delegate deleteInformation:self->_indexNumber];
                [self dismissViewControllerAnimated:YES completion:nil];
            }]];
            [warning addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                return;
            }]];
            [self presentViewController:warning animated:YES completion:nil];
            return;
        }
    }
    
    UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有找到该学生，请确认后重新输入" preferredStyle:UIAlertControllerStyleAlert];
    [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:warning animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameText resignFirstResponder];
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

- (void)back:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
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
