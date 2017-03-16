//
//  TableViewDataSourceDelegate.m
//  StaticAnalyser
//
//  Created by radhakrishnan S on 14/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import "TableViewDataSourceDelegate.h"
@interface ClassA : NSObject 
@end
@implementation ClassA

@end

@interface ClassB : NSObject
@end
@implementation ClassB

@end

@implementation TableViewDataSourceDelegate
-(id)init{
    if (self = [super init]) {
       
    }
    return self;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SampleIdentifier"];
    return cell;
    return nil;
}

//Infer - Null dereference
//Parameter not null checked
-(void) nullDeference:(void (^)())callback {
    if (callback) {
        callback();
    }
    
}
-(void) bar {
    [self nullDeference:nil];
}
//Memory leak
-(void) memory_leak_bug{
    UIImage *image = [UIImage imageNamed:@"SampleImage"];
    CGImageRef imageRef = CGImageCreateCopy([image CGImage]);
    CGImageRelease(imageRef);
}
//Premature nil termination argument
-(void)inferSpecific1{
    NSString *string = @"";
    NSArray *foo = [NSArray arrayWithObjects: @"aaa", string, @"bbb", nil];
    NSLog(@"foo %@",foo);
}
-(void)initializeList{
    NSString *temp = nil;
    NSArray *array = [[NSArray alloc] initWithObjects:@"one",@"two",temp, nil];
    NSLog(@"%@",array);
}
-(id<UITableViewDelegate>) copiedDelegate:(TableViewDataSourceDelegate<NSCopying>*)a {
    
    if (a) {
        TableViewDataSourceDelegate *b = [a copy]; // sending a message with receiver nil returns nil
        return b->_delegate; // dereferencing b, potential NPE if you pass nil as the argument a.
    }
    return nil;
    
}
-(void)checkForZero:(NSNumber *)number{
    
    if ([number integerValue] == 0) {
        NSLog(@"Passed value is zero");
    }
}
-(void)unavailableAPI{
    UIFont *font = [UIFont systemFontOfSize:10 weight:0];
    [font doesNotRecognizeSelector:@selector(test)];
}
@end
