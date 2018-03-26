//
//  ViewController.m
//  BundleUse
//
//  Created by lichanglai on 2018/3/26.
//  Copyright © 2018年 sankai. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:imageView];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    UIImage *image = [UIImage imageNamed:@"bundleDemo.bundle/Contents/Resources/jmx.jpg"];
    imageView.image = image;
    
    
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle].resourcePath
                                                 stringByAppendingPathComponent:@"bundleDemo.bundle"]];
    NSString *bundlePath = [bundle bundlePath];
//    NSString *imgPath = [bundlePath stringByAppendingPathComponent:@"Contents/Resources/jmx.jpg"];
//    UIImage *image = [UIImage imageWithContentsOfFile:imgPath];
//    imageView.image = image;
    
    NSString *preferredLanguage = [self isHan] ? @"zh-Hans" : @"en";
    NSString *path = [NSString stringWithFormat:@"%@/%@/%@/%@.%@", bundlePath, @"Contents/Resources", @"Localization", preferredLanguage, @"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:path];
    NSString *result = [languageBundle localizedStringForKey:@"test_bundle" value:@"" table:nil];
    if (![result length]) {
        result = [[NSBundle mainBundle] localizedStringForKey:@"test_bundle" value:@"" table:nil];
    }
    NSLog(@"%@",result);
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)isHan {
    NSString *language = [[NSLocale currentLocale] localeIdentifier];
    return [language hasPrefix:@"zh_"] || [language hasPrefix:@"zh-"] || [language rangeOfString:@"CN"].location != NSNotFound;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
