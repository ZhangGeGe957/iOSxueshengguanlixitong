//
//  IncreaseViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "IncreaseViewController.h"
#import "NewTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface IncreaseViewController ()

@end

@implementation IncreaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _returnArray = [[NSMutableArray alloc] init];
    _similarArray = [[NSMutableArray alloc] init];
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sureButton setTitle:@"增加" forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(sure:) forControlEvents:UIControlEventTouchUpInside];
    _sureButton.frame = CGRectMake(100, 800, 60, 40);
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
    _backButton.frame = CGRectMake(250, 800, 60, 40);
    [_backButton.layer setBorderWidth:2];
    [_backButton.layer setBorderColor:color];
    _backButton.titleLabel.tintColor = [UIColor whiteColor];
    _backButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_backButton.layer setMasksToBounds:YES];
    [_backButton.layer setCornerRadius:5.0];
    [self.view addSubview:_backButton];
    
    _nameText = [[UITextField alloc] init];
    _nameText.delegate = self;
    _nameText.keyboardType = UIKeyboardTypeDefault;
    _nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText.frame = CGRectMake(100, 500, 250, 50);
    _nameText.placeholder = @"姓名";
    [self.view addSubview:_nameText];
    
    _classText = [[UITextField alloc] init];
    _classText.delegate = self;
    _classText.keyboardType = UIKeyboardTypeDefault;
    _classText.borderStyle = UITextBorderStyleRoundedRect;
    _classText.frame = CGRectMake(100, 570, 250, 50);
    _classText.placeholder = @"班级";
    [self.view addSubview:_classText];
    
    _gradeText = [[UITextField alloc] init];
    _gradeText.delegate = self;
    _gradeText.keyboardType = UIKeyboardTypeDefault;
    _gradeText.borderStyle = UITextBorderStyleRoundedRect;
    _gradeText.frame = CGRectMake(100, 640, 250, 50);
    _gradeText.placeholder = @"成绩";
    [self.view addSubview:_gradeText];
    
    UIImageView *nameView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xingming.png"]];
    nameView.frame = CGRectMake(50, 510, 32, 32);
    [_backImageView addSubview:nameView];
    
    UIImageView *classView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"banji.png"]];
    classView.frame = CGRectMake(50, 580, 32, 32);
    [_backImageView addSubview:classView];
    
    UIImageView *gradeView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"chengji.png"]];
    gradeView.frame = CGRectMake(50, 650, 32, 32);
    [_backImageView addSubview:gradeView];
    
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
    [self judge];
}

- (void)judge {
    if ([_nameText.text isEqualToString:@""] || [_classText.text isEqualToString:@""] || [_gradeText.text isEqualToString:@""]) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的信息有误" preferredStyle:UIAlertControllerStyleAlert];
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
            UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"提示" message:@"该学生已存在，请重新输入学生姓名" preferredStyle:UIAlertControllerStyleAlert];
            [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [self presentViewController:warning animated:YES completion:nil];
            return;
        }
    }
    NSString *firstString  = [_classText.text substringToIndex:1];
    NSInteger firstNumber = 0;
    NSString *lastString = [_classText.text substringFromIndex:_classText.text.length - 1];
    NSInteger grade = [_gradeText.text intValue];
    NSInteger leng = _classText.text.length;
    if ([firstString isEqualToString:@"一"] || [firstString isEqualToString:@"二"] ||
        [firstString isEqualToString:@"三"] || [firstString isEqualToString:@"四"] ||
        [firstString isEqualToString:@"五"] || [firstString isEqualToString:@"六"] ||
        [firstString isEqualToString:@"七"] || [firstString isEqualToString:@"八"] ||
        [firstString isEqualToString:@"九"] || [firstString isEqualToString:@"十"]) {
        firstNumber = 66;
    }
    if (![lastString isEqualToString:@"班"] || leng != 2 || firstNumber == 0) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的班级有误,请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:warning animated:YES completion:nil];
        return;
    } else if (![self isPureNumandCharacters:_gradeText.text] || grade < 0 || grade > 100) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"您输入的成绩有误,请重新输入" preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
        [self presentViewController:warning animated:YES completion:nil];
        return;
    } else {
        [_returnArray addObject:_nameText.text];
        [_returnArray addObject:_classText.text];
        [_returnArray addObject:_gradeText.text];
        [_delegate increaseInformation:_returnArray];
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"添加成功" message:nil preferredStyle:UIAlertControllerStyleAlert];
        [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
            [self->_tableView reloadData];
        }]];
        [self presentViewController:warning animated:YES completion:nil];
    }
}

- (BOOL)isPureNumandCharacters:(NSString *)string {
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
       return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameText resignFirstResponder];
    [_classText resignFirstResponder];
    [_gradeText resignFirstResponder];
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
