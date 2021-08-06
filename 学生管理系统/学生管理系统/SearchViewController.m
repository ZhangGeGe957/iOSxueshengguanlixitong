//
//  SearchViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "SearchViewController.h"
#import "NewTableViewCell.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _similarArray = [[NSMutableArray alloc] init];
    _findClassArray = [[NSMutableArray alloc] init];
    _findGradeArray = [[NSMutableArray alloc] init];
    _findNameArray = [[NSMutableArray alloc] init];
    
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpaceRef, (CGFloat[]){1,1,1,1});
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"show.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_sureButton setTitle:@"查找" forState:UIControlStateNormal];
    [_sureButton addTarget:self action:@selector(find:) forControlEvents:UIControlEventTouchUpInside];
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
    nameView.frame = CGRectMake(50, 610, 32, 32);
    [_backImageView addSubview:nameView];
    
    _nameText = [[UITextField alloc] init];
    _nameText.frame = CGRectMake(100, 600, 250, 50);
    _nameText.keyboardType = UIKeyboardTypeDefault;
    _nameText.borderStyle = UITextBorderStyleRoundedRect;
    _nameText.delegate = self;
    _nameText.placeholder = @"请输入要查找的学生姓名";
    [self.view addSubview:_nameText];
    
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
    
    _indexNumber = 0;
    _arrayCount = _nameArray.count;
    
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
    if (_indexNumber == 0) {
        cell.nameLabel.text = _nameArray[indexPath.row];
        cell.classLabel.text = _classArray[indexPath.row];
        cell.gradeLabel.text = _gradeArray[indexPath.row];
    } else if (_indexNumber == 1) {
        cell.nameLabel.text = _findNameArray[indexPath.row];
        cell.classLabel.text = _findClassArray[indexPath.row];
        cell.gradeLabel.text = _findGradeArray[indexPath.row];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.userInteractionEnabled = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arrayCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (void)find:(UIButton*)button {
    _indexNumber = 0;
    if ([_nameText.text isEqualToString:@""]) {
        UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"警告" message:@"请输入您要查找的学生的姓名" preferredStyle:UIAlertControllerStyleAlert];
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
    if (_similarArray.count) {
        for (int i = 0; i < _similarArray.count; i++) {
            _indexNumber = [_similarArray[i] intValue];
            [_findNameArray addObject:_nameArray[_indexNumber]];
            [_findClassArray addObject:_classArray[_indexNumber]];
            [_findGradeArray addObject:_gradeArray[_indexNumber]];
        }
        _arrayCount = _similarArray.count;
        _indexNumber = 1;
        [_tableView reloadData];
        return;
    }
    UIAlertController *warning = [UIAlertController alertControllerWithTitle:@"提示" message:@"没有找到该学生，请确认后重新输入" preferredStyle:UIAlertControllerStyleAlert];
    [warning addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:warning animated:YES completion:nil];
}

- (void)back:(UIButton*)button {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_nameText endEditing:YES];    
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
