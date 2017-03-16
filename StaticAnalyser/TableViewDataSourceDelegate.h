//
//  TableViewDataSourceDelegate.h
//  StaticAnalyser
//
//  Created by radhakrishnan S on 14/03/17.
//  Copyright © 2017 Test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TableViewDataSourceDelegate : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,weak) id<UITableViewDelegate> delegate;
@property (nonatomic,weak) id<UITableViewDataSource> datasource;
@end
