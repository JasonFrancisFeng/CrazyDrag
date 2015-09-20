//
//  ViewController.m
//  CrazyDrag
//
//  Created by Cooper on 15/9/20.
//  Copyright (c) 2015年 Jason. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    int currentValue;
    int targetValue;
    int score;
    int round;
}
@property (strong, nonatomic) IBOutlet UILabel *targetNumber;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutlet UILabel *roundLabel;


@end

@implementation ViewController

@synthesize targetNumber;

- (void)startNewRound{
    round+=1;
    targetValue = 1 + (arc4random()%100);
    self.targetNumber.text = [NSString stringWithFormat:@"%d",targetValue];
}

- (void)updataLabels{
    self.targetNumber.text = [NSString stringWithFormat:@"%d",targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d",score];
    self.roundLabel.text = [NSString stringWithFormat:@"%d",round];
}

- (void)startNewGame{
    score = 0;
    round = 0;
    [self startNewRound];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self startNewRound];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlert:(id)sender {
    int difference = abs(currentValue - targetValue);
    int points = 100 - difference;
    score+=points;
    NSString *message = [NSString stringWithFormat:@"大神,您的得分是:%d",points];

    [[[UIAlertView alloc]initWithTitle:@"猪，你好!" message:message delegate:self cancelButtonTitle:@"朕知道了" otherButtonTitles:nil, nil]show];

}

- (IBAction)sliderMoved:(id)sender {
    UISlider *slider = sender;
    currentValue = lroundf(slider.value);
    NSLog(@"当前滑动条数值为:%d",currentValue);
    //self.sliderNumber.text = [NSString stringWithFormat:@"%d",currentValue];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    [self startNewRound];
    [self updataLabels];
}

- (IBAction)satrtOver:(id)sender {
    [self startNewGame];
    [self updataLabels];
}

@end
