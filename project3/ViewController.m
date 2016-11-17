//
//  ViewController.m
//  project3
//
//  Created by Анна  Зелинская on 06.11.16.
//  Copyright © 2016 Анна  Зелинская. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NSMutableArray *arrayData;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrayData = [NSMutableArray new];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ColorText:(UIButton*)sender {
    
    NSRange range = [text selectedRange];
    NSMutableAttributedString *string = [text textStorage];
    [string addAttribute:NSForegroundColorAttributeName value:sender.currentTitleColor  range:range];
    [text setAttributedText:string];
    
    // NSAttributedString *as = [[NSAttributedString alloc] initWithString:[string.string substringWithRange:range]attributes:@{NSForegroundColorAttributeName:sender.currentTitleColor}];
    //   [arrayData addObject:as];
    
}

- (IBAction)Clear:(id)sender {
    text.textColor = [UIColor blackColor];
    
    [arrayData removeAllObjects];
    
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    [arrayData removeAllObjects];
    
    [text.attributedText enumerateAttributesInRange:NSMakeRange(0, [text.attributedText length]) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary *attributes, NSRange range, BOOL *stop) {
        UIColor *color = [attributes objectForKey:NSForegroundColorAttributeName];
        if ([color isEqual:[UIColor redColor]]||[color isEqual:[UIColor greenColor]]||[color isEqual:[UIColor blueColor]]||[color isEqual:[UIColor orangeColor]]) {
            NSAttributedString *as = [[NSAttributedString alloc] initWithString:[text.text substringWithRange:range]attributes:@{NSForegroundColorAttributeName:color}];
           [arrayData addObject:as];
        }
    }
     ];
    
    

       // Get the new view controller using [segue destinationViewController].
    TableViewController *vc = [segue destinationViewController];
    
    // Pass the selected object to the new view controller.
    vc.arrayData1 =arrayData;
}



@end
