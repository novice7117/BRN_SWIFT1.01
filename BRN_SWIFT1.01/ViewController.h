//
//  ViewController.h
//  BRN_SWIFT1.01
//
//  Created by vinu subhash on 9/12/17.
//  Copyright © 2017 vinu subhash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *pssTF;

@property NSString *hello;
@property (weak, nonatomic) IBOutlet UITextField *usernameTF;
@property (weak, nonatomic) IBOutlet UIImageView *passwordTF;
- (IBAction)login:(UIButton *)sender;

@property NSURLSession *URLSession;
@property NSMutableURLRequest *URLRequest;
@property NSURLSessionDataTask *dataTask;
@property NSDictionary *serverData;

@end

