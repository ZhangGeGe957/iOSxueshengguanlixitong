//
//  ViewController.m
//  学生管理系统
//
//  Created by 张佳乔 on 2021/8/1.
//

#import "ViewController.h"
#import "LoadViewController.h"

#define width [UIScreen mainScreen].bounds.size.width
#define heigth [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _backImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"load.jpeg"]];
    _backImageView.frame = CGRectMake(0, 0, width, heigth);
    [self.view addSubview:_backImageView];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(load:) userInfo:self repeats:YES];
    
}

- (void)load:(NSTimer*)timer {
    [_timer invalidate];
    _timer = nil;
    
    LoadViewController *loadView = [[LoadViewController alloc] init];
    loadView.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:loadView animated:YES completion:nil];
    
}

@end
