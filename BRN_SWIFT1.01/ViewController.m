//
//  ViewController.m
//  BRN_SWIFT1.01
//
//  Created by vinu subhash on 9/12/17.
//  Copyright © 2017 vinu subhash. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createComponents];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)createComponents
{
    self.URLSession=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)login:(UIButton *)sender {
    
    self.URLRequest = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:@"http://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php"]];
    
    NSMutableString *myDataString=[NSMutableString stringWithFormat:@"funcName=%@&registeredEmail=%@&registeredPassword=%@",@"verifyLogin",self.usernameTF.text,self.pssTF.text];
    
    NSData *myData=[myDataString dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    
    self.URLRequest.HTTPMethod=@"POST";
    
    NSString *stringLength=[NSString stringWithFormat:@"%lu",(unsigned long)[myDataString length]];
    
    [self.URLRequest setValue:stringLength forHTTPHeaderField:@"Content-Length"];
    
    [self.URLRequest setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [self.URLRequest setHTTPBody:myData];
    
     [self.dataTask resume];
    
    self.dataTask=[self.URLSession dataTaskWithRequest:self.URLRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"Got response from server");
        self.serverData=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",self.serverData);
    }];
   
}
@end
