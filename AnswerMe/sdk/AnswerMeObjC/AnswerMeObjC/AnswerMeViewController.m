/*
 * Copyright (C) 2015 RoboVM AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import <AnswerMeSDK/AnswerMeSDK.h>
#import "AnswerMeViewController.h"

@interface AnswerMeViewController ()


@end

@implementation AnswerMeViewController {
  AMAnswerMeSDK* sdk;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self->sdk = [AMAnswerMeSDK instance];
    
    Class counterClass = NSClassFromString(@"AMCounterImpl");
    
    self.counter = [[counterClass alloc] init];
    
    self.currentCountLabel.text = @"Current Count";
    self.currentCount.text = @"0";
}

- (void) updateLabel {
    int value = [self.counter value];
    self.currentCount.text = [NSString stringWithFormat:@"%d", value];
}

- (IBAction)addPressed:(id)sender {
    [self.counter addValue:1];
    [self updateLabel];
}
- (IBAction)minusPressed:(id)sender{
    [self.counter minusValue:1];
    [self updateLabel];
}

@end
