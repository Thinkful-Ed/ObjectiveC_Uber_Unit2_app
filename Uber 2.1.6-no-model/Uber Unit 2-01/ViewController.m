//
//  ViewController.m
//  Uber Unit 2-01
//
//  Created by 262Hz on 7/2/15.
//  Copyright (c) 2015 Thinkful. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@property (weak, nonatomic) UISlider *celsiusSlider;
@property (weak, nonatomic) UILabel *celsiusLabel;
@property (weak, nonatomic) UILabel *fahrenheitLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithHue:0.6 saturation:1.0 brightness:0.18 alpha:1.0];
    
    UISlider *celsiusSlider = [UISlider new];
    UILabel *celsiusLabel = [UILabel new];
    UILabel *fahrenheitLabel = [UILabel new];
    [self.view addSubview:celsiusSlider];
    [self.view addSubview:celsiusLabel];
    [self.view addSubview:fahrenheitLabel];
    self.celsiusSlider = celsiusSlider;
    self.celsiusLabel = celsiusLabel;
    self.fahrenheitLabel = fahrenheitLabel;
    
    UIColor *color = [UIColor colorWithHue:0.22 saturation:1.0 brightness:0.9 alpha:1.0];
    self.celsiusSlider.tintColor = color;
    self.celsiusSlider.minimumValue = -100;
    self.celsiusSlider.maximumValue = 100;
    [self.celsiusSlider addTarget:self action:@selector(updateTemperatureLabels) forControlEvents:UIControlEventValueChanged];
    
    self.celsiusLabel.text = @"0°C";
    self.fahrenheitLabel.text = @"32°F";
    
    [self.celsiusLabel setFont:[UIFont boldSystemFontOfSize:60]];
    self.celsiusLabel.textColor = color;
    self.celsiusLabel.textAlignment = NSTextAlignmentRight;
    [self.fahrenheitLabel setFont:[UIFont boldSystemFontOfSize:60]];
    self.fahrenheitLabel.textColor = color;
    self.fahrenheitLabel.textAlignment = NSTextAlignmentRight;
    
    CGFloat leadingOffset = 20;
    CGFloat trailingOffset = -20;
    CGFloat verticalSpace = 20;
    
    [self.celsiusSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.celsiusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        UIView *topLayoutGuide = (id)self.topLayoutGuide;
        make.top.equalTo(topLayoutGuide.mas_bottom).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self.fahrenheitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.celsiusLabel.mas_bottom).offset(verticalSpace);
        make.leading.equalTo(self.view.mas_leading).offset(leadingOffset);
        make.trailing.equalTo(self.view.mas_trailing).offset(trailingOffset);
    }];
    
    [self updateTemperatureLabels];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)updateTemperatureLabels {
    float celsius = self.celsiusSlider.value;
    float fahrenheit = celsius * 1.8 + 32;
    
    self.celsiusLabel.text = [NSString stringWithFormat:@"%.02f°C", celsius];
    self.fahrenheitLabel.text = [NSString stringWithFormat:@"%.02f°F", fahrenheit];
}

@end
