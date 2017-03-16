//
//  ViewController.m
//  StaticAnalyser
//
//  Created by radhakrishnan S on 14/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewDataSourceDelegate.h"

@interface ViewController ()
@property UITableView *tableView;
@property (strong)TableViewDataSourceDelegate *delegate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //CSA
    //Dead store
    int i = 10;
   
    int sampleInteger = 0;
    sampleInteger = sampleInteger + 2;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)inferTest{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    //Infer
    NSString *string;
    NSMutableString *mutableString;
    [mutableString stringByAppendingString:string];
    self.delegate = [TableViewDataSourceDelegate new];
    self.tableView.delegate = self.delegate;
    self.tableView.dataSource = self.delegate;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
